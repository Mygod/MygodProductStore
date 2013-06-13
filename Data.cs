using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore
{
    public static class Data
    {
        public static readonly Products Products = new Products();
        public static readonly Records Records;
        public static readonly Assembly CurrentAssembly;

        static Data()
        {
            CurrentAssembly = Assembly.GetExecutingAssembly();
            // ReSharper disable PossibleNullReferenceException
            foreach (var product in XDocument.Parse(new StreamReader(CurrentAssembly
                .GetManifestResourceStream("Mygod.Website.ProductStore.Products.xml")).ReadToEnd()).Element("Products")
                .Elements("Product").Select(product => new Product(product)).OrderByDescending(product => DateTime.Parse(product.Date)))
            // ReSharper restore PossibleNullReferenceException
                Products.Add(product);
            // ReSharper disable AssignNullToNotNullAttribute
            Records = new Records(XDocument.Parse(new StreamReader(CurrentAssembly
                .GetManifestResourceStream("Mygod.Website.ProductStore.Records.xml")).ReadToEnd()).Element("Records"));
            // ReSharper restore AssignNullToNotNullAttribute
        }

        private static DateTime? compilationTime;
        public static DateTime CompilationTime
        {
            get
            {
                if (compilationTime == null)
                {
                    var b = new byte[2048];
                    using (var s = new FileStream(Assembly.GetExecutingAssembly().Location, FileMode.Open, FileAccess.Read))
                        s.Read(b, 0, 2048);
                    compilationTime = new DateTime(1970, 1, 1).AddSeconds(BitConverter.ToInt32(b, BitConverter.ToInt32(b, 60) + 8))
                        .AddHours(8);
                }
                return compilationTime.Value;
            }
        }
    }

    public class Records : List<Chapter>
    {
        public Records(XElement element)
        {
            foreach (var chapter in element.Elements("Chapter")) Add(new Chapter(chapter));
            foreach (var chapter in this) for (var i = 0; i < 4; i++)
            {
                ChinaSum[i] += chapter.ChinaSum[i];
                WorldSum[i] += chapter.WorldSum[i];
            }
        }

        public readonly int[] ChinaSum = new int[4], WorldSum = new int[4];
    }

    public class Chapter : List<Level>
    {
        public Chapter(XElement element)
        {
            Name = element.GetAttribute("Name");
            foreach (var level in element.Elements("Level")) Add(new Level(level));
            foreach (var level in this) for (var i = 0; i < 4; i++)
            {
                ChinaSum[i] += level.ChinaRecord[i].Value;
                WorldSum[i] += level.WorldRecord[i].Value;
            }
        }

        public readonly string Name;

        public readonly int[] ChinaSum = new int[4], WorldSum = new int[4];
    }

    public class Level
    {
        public Level(XElement element)
        {
            Name = element.GetAttribute("Name");
            WorldRecord = new LevelRecord(this, element.Element("WorldRecord"), true);
            ChinaRecord = new LevelRecord(this, element.Element("ChinaRecord"), false);
        }

        public readonly string Name;
        public readonly LevelRecord WorldRecord, ChinaRecord;
    }

    public class LevelRecord : List<Record>
    {
        public LevelRecord(Level parent, XElement element, bool isWorldRecord)
        {
            Parent = parent;
            foreach (var record in element.Elements()) Add(new Record(this, record, isWorldRecord));
        }

        public readonly Level Parent;
    }

    public class Record
    {
        public Record(LevelRecord parent, XElement element, bool isWorldRecord)
        {
            Parent = parent;
            Type = (RecordType) Enum.Parse(typeof(RecordType), element.Name.LocalName, true);
            Value = int.Parse(element.GetAttribute("Value"));
            Setter = element.GetAttribute("Setter");
            if (string.IsNullOrWhiteSpace(Setter)) return;
            IsWorldRecord = isWorldRecord;
            Players.Instance.SetRecord(this);
        }

        public LevelRecord Parent;
        public int Value;
        public RecordType Type;
        public string Setter;
        public bool IsWorldRecord;

        private string formattedValue, overview, tooltip;
        public string FormattedValue
        {
            get
            {
                if (string.IsNullOrEmpty(formattedValue)) formattedValue = Type == RecordType.Goal || Type == RecordType.OCD
                    ? string.Format("{0}:{1:00}", Value / 60, Value % 60) : Value.ToString();
                return formattedValue;
            }
        }
        public string Overview
        {
            get
            {
                if (string.IsNullOrEmpty(overview))
                    overview = FormattedValue + (string.IsNullOrWhiteSpace(Setter) ? string.Empty : " (" + Setter + ")");
                return overview;
            }
        }
        public string Tooltip
        {
            get
            {
                if (string.IsNullOrEmpty(tooltip))
                {
                    var worldRecord = Parent.Parent.WorldRecord[(int) Type];
                    var delta = Math.Abs(worldRecord.Value - Value);
                    tooltip = Overview + "&#10;" + (delta == 0 ? "与世界纪录 " + worldRecord + " 相同！"
                        : "离世界纪录 " + worldRecord + " 差 " + delta + ' ' + GetUnit(Type) + "！");
                }
                return tooltip;
            }
        }

        public static string GetUnit(RecordType type)
        {
            switch (type)
            {
                case RecordType.Goos:                       return "球";
                case RecordType.Moves:                      return "步";
                case RecordType.Goal: case RecordType.OCD:  return "秒";
                default:                                    return string.Empty;
            }
        }

        public override string ToString()
        {
            return Overview;
        }

        public string GetDetailedString()
        {
            return string.Format("{0} {1}{2}{3}", Parent.Parent.Name, Type == RecordType.OCD ? "OCD " : string.Empty, FormattedValue,
                                 Type == RecordType.Goal || Type == RecordType.OCD ? string.Empty : GetUnit(Type));
        }
    }

    public class Players : KeyedCollection<string, Player>
    {
        private Players()
        {
        }
        static Players()
        {
            Instance = new Players();
        }

        public static readonly Players Instance;

        protected override string GetKeyForItem(Player item)
        {
            return item.ID;
        }

        public void SetRecord(Record record)
        {
            if (!Contains(record.Setter)) Add(new Player(record.Setter));
            this[record.Setter].Add(record);
        }
    }

    public class Player : List<Record>
    {
        public Player(string id)
        {
            ID = id;
        }

        public readonly string ID;
        private string strCache;
        private readonly List<Record> worldRecords = new List<Record>(), chinaRecords = new List<Record>();

        public List<Record> WorldRecords
        {
            get { AssortRecords(); return worldRecords; }
        }
        public List<Record> ChinaRecords
        {
            get { AssortRecords(); return chinaRecords; }
        }

        private void AssortRecords()
        {
            if (worldRecords.Count == 0 && chinaRecords.Count == 0)
                foreach (var record in this) if (record.IsWorldRecord) worldRecords.Add(record); else chinaRecords.Add(record);
        }

        public override string ToString()
        {
            if (string.IsNullOrEmpty(strCache))
            {
                AssortRecords();
                strCache = "<span class=\"bold\">" + ID + "</span>"
                    + GetRecordsString(WorldRecords, "世界") + GetRecordsString(ChinaRecords, "中国") + "。";
            }
            return strCache;
        }

        private static readonly string[] RecordTypes = new[] { "球数", "步数", " Goal ", " OCD " };

        private static string GetRecordsString(ICollection<Record> records, string type)
        {
            if (records.Count == 0) return string.Empty;
            var result = "，破了 " + records.Count + " 项" + type + "纪录（";
            var r = new List<Record>[4];
            for (var i = 0; i < 4; i++) r[i] = new List<Record>();
            foreach (var record in records) r[(int) record.Type].Add(record);
            var first = true;
            for (var i = 0; i < 4; i++)
            {
                if (r[i].Count == 0) continue;
                if (first) first = false; else result += '，';
                result += string.Format("<span title=\"{2}\">{0} 项{1}纪录</span>", r[i].Count, RecordTypes[i],
                                        GetAssortedRecordsString(r[i]));
            }
            return result + '）';
        }

        private static string GetAssortedRecordsString(IEnumerable<Record> records)
        {
            var result = string.Empty;
            foreach (var record in records)
            {
                if (!string.IsNullOrEmpty(result)) result += "&#10;";
                result += record.GetDetailedString();
            }
            return result;
        }
    }

    public enum RecordType
    {
        Goos, Moves, Goal, OCD
    }

    public class Products : KeyedCollection<string, Product>
    {
        protected override string GetKeyForItem(Product item)
        {
            return item.ID;
        }
    }

    public class Product
    {
        public Product(XElement element)
        {
            ID = element.GetAttribute("ID");
            Title = Name = element.GetAttribute("Name");
            var attr = element.GetAttribute("Version");
            if (attr != null) Title += ' ' + attr;
            Date = element.GetAttribute("Date");
            Requirements = element.GetAttribute("Requirements").Replace("\\", @"\\");
            Link = element.GetAttribute("Link");
            Producer = element.GetAttribute("Producer");
            Screenshots = element.GetAttribute("Screenshots");
        }

        public readonly string ID, Name, Title, Date, Requirements, Link, Producer, Screenshots;
    }

    public static class Helper
    {
        public static string GetAttribute(this XElement element, XName name)
        {
            var attr = element.Attribute(name);
            return attr == null ? null : attr.Value;
        }
    }
}