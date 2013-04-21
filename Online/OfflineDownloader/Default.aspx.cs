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
    public partial class Default : Page
    {
        private const string Prefix = "http://mygod.apphb.com/Online/OfflineDownloader/Fetch.aspx?Key=";
        private string directoryPath;

        protected void Submit(object sender, EventArgs e)
        {
            var result = new StringBuilder();
            var lines = 0;
            Directory.CreateDirectory(directoryPath = Server.MapPath("/Temp/OfflineDownloader/"));
            foreach (var link in LinkBox.Text.Split(new[] { '\r', '\n' }).Where(link => !string.IsNullOrWhiteSpace(link)
                        && !link.StartsWith(Prefix, StringComparison.InvariantCultureIgnoreCase)))
            {
                lines++;
                result.AppendLine(Prefix + DownloadTask(link));
            }
            if (lines == 1) Response.Redirect(result.ToString());
            else LinkBox.Text = result.ToString();
        }

        private string DownloadTask(string url)
        {
            url = TFQR.Decode(TFQR.GetUrlType(url), url);
            string md5 = FormsAuthentication.HashPasswordForStoringInConfigFile(url, "MD5"),
                   path = Path.Combine(directoryPath, md5), xmlPath = path + ".xml";
            if (!File.Exists(xmlPath))
            {
                new XDocument(new XElement("download", new XAttribute("url", url))).Save(xmlPath);
                Process.Start(Server.MapPath("MygodOfflineDownloader.exe"), path);
            }
            return md5;
        }
    }
}