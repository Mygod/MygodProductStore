using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore
{
    public static class Data
    {
        public static readonly List<Product> Products = new List<Product>();
        public static readonly Assembly CurrentAssembly;

        static Data()
        {
            CurrentAssembly = Assembly.GetExecutingAssembly();
            // ReSharper disable PossibleNullReferenceException
            foreach (var product in XDocument.Parse(new StreamReader(CurrentAssembly
                .GetManifestResourceStream("Mygod.Website.ProductStore.Products.xml")).ReadToEnd()).Element("Products").Elements("Product"))
                Products.Add(new Product(product));
            // ReSharper restore PossibleNullReferenceException
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

    public class Product
    {
        public Product(XElement element)
        {
            ID = element.GetAttribute("ID");
            Title = element.GetAttribute("Name");
            var attr = element.GetAttribute("Version");
            if (attr != null) Title += ' ' + attr;
            Date = element.GetAttribute("Date");
            Requirements = element.GetAttribute("Requirements").Replace("\\", @"\\");
            Link = element.GetAttribute("Link");
            Producer = element.GetAttribute("Producer");
        }

        public readonly string ID, Title, Date, Requirements, Link, Producer;
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