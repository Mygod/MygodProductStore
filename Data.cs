using System;
using System.Collections.Generic;
using System.IO;
using System.Windows;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore
{
    public static class Data
    {
        public static readonly List<Product> Products = new List<Product>();

        static Data()
        {
            foreach (var product in XDocument.Parse(ReadText("/Products.xml")).Element("Products").Elements("Product"))
                Products.Add(new Product(product));
        }

        private static string ReadText(string path)
        {
            // ReSharper disable PossibleNullReferenceException
            try
            {
                return new StreamReader(Application.GetResourceStream(new Uri(path, UriKind.Relative)).Stream).ReadToEnd();
            }
            catch
            {
                return null;
            }
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