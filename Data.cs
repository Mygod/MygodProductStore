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
                TiebaSum[i] += chapter.TiebaSum[i];
                WorldSum[i] += chapter.WorldSum[i];
            }
        }

        public readonly int[] TiebaSum = new int[4], WorldSum = new int[4];
    }

    public class Chapter : List<Level>
    {
        public Chapter(XElement element)
        {
            Name = element.GetAttribute("Name");
            foreach (var level in element.Elements("Level")) Add(new Level(level));
            foreach (var level in this) for (var i = 0; i < 4; i++)
            {
                TiebaSum[i] += level.TiebaRecord[i].Value;
                WorldSum[i] += level.WorldRecord[i].Value;
            }
        }

        public readonly string Name;

        public readonly int[] TiebaSum = new int[4], WorldSum = new int[4];
    }

    public class Level
    {
        public Level(XElement element)
        {
            Name = element.GetAttribute("Name");
            WorldRecord = new LevelRecord(this, element.Element("WorldRecord"), true);
            TiebaRecord = new LevelRecord(this, element.Element("TiebaRecord"), false);
        }

        public readonly string Name;
        public readonly LevelRecord WorldRecord, TiebaRecord;
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
            if (isWorldRecord) Players.Instance.SetWorldRecord(this);
            else Players.Instance.SetTiebaRecord(this);
        }

        public LevelRecord Parent;
        public int Value;
        public RecordType Type;
        public string Setter;

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
                {
                    overview = FormattedValue;
                    if (!string.IsNullOrWhiteSpace(Setter)) overview += " (" + Setter + ")";
                }
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

        public void SetWorldRecord(Record record)
        {
            if (!Contains(record.Setter)) Add(new Player(record.Setter));
            var player = this[record.Setter];
            player.WorldRecordsTotal++;
            if (!string.IsNullOrWhiteSpace(player.WorldRecords)) player.WorldRecords += "&#10;";
            player.WorldRecords += string.Format("{0} {1}{2}{3}", record.Parent.Parent.Name,
                                                 record.Type == RecordType.OCD ? "OCD " : string.Empty, record.FormattedValue,
                                                 record.Type == RecordType.Goal || record.Type == RecordType.OCD
                                                     ? string.Empty : Record.GetUnit(record.Type));
        }

        public void SetTiebaRecord(Record record)
        {
            if (!Contains(record.Setter)) Add(new Player(record.Setter));
            var player = this[record.Setter];
            player.TiebaRecordsTotal++;
            if (!string.IsNullOrWhiteSpace(player.TiebaRecords)) player.TiebaRecords += "&#10;";
            player.TiebaRecords += string.Format("{0} {1}{2}{3}", record.Parent.Parent.Name,
                                                 record.Type == RecordType.OCD ? "OCD " : string.Empty, record.FormattedValue,
                                                 record.Type == RecordType.Goal || record.Type == RecordType.OCD
                                                     ? string.Empty : Record.GetUnit(record.Type));
        }
    }

    public class Player
    {
        public Player(string id)
        {
            ID = id;
        }

        public readonly string ID;
        public int WorldRecordsTotal, TiebaRecordsTotal;
        public string WorldRecords = string.Empty, TiebaRecords = string.Empty;
        private string strCache;

        public string Records
        {
            get
            {
                if (string.IsNullOrEmpty(WorldRecords)) return TiebaRecords;
                return string.IsNullOrEmpty(TiebaRecords) ? WorldRecords
                    : "世界纪录：&#10;" + WorldRecords + "&#10;&#10;贴吧纪录：&#10;" + TiebaRecords;
            }
        }

        public override string ToString()
        {
            if (string.IsNullOrEmpty(strCache))
            {
                strCache = ID;
                if (WorldRecordsTotal > 0) strCache += "，破了 " + WorldRecordsTotal + " 项世界纪录";
                if (TiebaRecordsTotal > 0) strCache += "，破了 " + TiebaRecordsTotal + " 项贴吧纪录";
                strCache += "。";
            }
            return strCache;
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