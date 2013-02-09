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
    }

    public class Product
    {
        public Product(XElement element)
        {
            ID = element.GetAttribute("ID");
            Title = element.GetAttribute("Name");
            var version = element.GetAttribute("Version");
            if (version != null) Title += ' ' + version;
            Date = element.GetAttribute("Date");
            Requirements = element.GetAttribute("Requirements").Replace("\\", @"\\");
            Link = element.GetAttribute("Link");
        }

        public readonly string ID, Title, Date, Requirements, Link;
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