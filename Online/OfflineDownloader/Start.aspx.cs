using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.OfflineDownloader
{
    public partial class Start : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.QueryString["URL"];
            if (string.IsNullOrWhiteSpace(url)) return;
            url = Encoding.UTF8.GetString(Convert.FromBase64String(url)).Reverse().Aggregate(string.Empty, (c, s) => c + s);
            url = TFQR.Decode(TFQR.GetUrlType(url), url);
            string md5 = FormsAuthentication.HashPasswordForStoringInConfigFile(url, "MD5"),
                   path = Server.MapPath("/Temp/OfflineDownloader/" + md5), xmlPath = path + ".xml";
            if (!File.Exists(xmlPath))
            {
                var download = new XElement("download", new XAttribute("url", url));
                var doc = new XDocument(download);
                Directory.CreateDirectory(Path.GetDirectoryName(xmlPath));
                doc.Save(xmlPath);
                Process.Start(Server.MapPath("MygodOfflineDownloader.exe"), path);
            }
            Response.Redirect("Fetch.aspx?Key=" + md5);
        }
    }
}