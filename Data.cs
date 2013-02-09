using System.Collections.Generic;
using System.Web;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore
{
    public static class Data
    {
        public static bool Initialized;
        public static List<Product> Products = new List<Product>();

        public static void Initialize(HttpServerUtility server)
        {
            if (Initialized) return;
            Initialized = true;
            foreach (var product in XDocument.Load(server.MapPath("/Products.xml")).Element("Products").Elements("Product"))
                Products.Add(new Product(product));
        }
    }

    public class Product
    {
        public Product(XElement element)
        {
            ID = element.GetAttribute("ID");
            Name = element.GetAttribute("Name");
            Version = element.GetAttribute("Version");
            Date = element.GetAttribute("Date");
            Requirements = element.GetAttribute("Requirements").Replace("\\", @"\\");
            Link = element.GetAttribute("Link");
        }

        public readonly string ID, Name, Version, Date, Requirements, Link;

        public string Title { get { return Name + (string.IsNullOrWhiteSpace(Version) ? string.Empty : (' ' + Version)); } }
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