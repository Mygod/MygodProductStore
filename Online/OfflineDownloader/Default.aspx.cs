using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.OfflineDownloader
{
    public partial class Default : Page
    {
        protected void Submit(object sender, EventArgs e)
        {
            var result = new StringBuilder();
            var lines = 0;
            foreach (var link in LinkBox.Text.Split(new[] { '\r', '\n' }).Where(link => !string.IsNullOrWhiteSpace(link)
                        && !link.StartsWith(MygodOfflineDownloader.Prefix, StringComparison.InvariantCultureIgnoreCase)))
            {
                lines++;
                result.AppendLine(MygodOfflineDownloader.Prefix + MygodOfflineDownloader.NewTask(Server, link));
            }
            if (lines == 1) Response.Redirect(result.ToString().Trim('\r', '\n'));
            else LinkBox.Text = result.ToString();
        }
    }

    public static class MygodOfflineDownloader
    {
        private static string directoryPath;

        public const string Prefix = "http://mygod.apphb.com/Online/OfflineDownloader/Fetch.aspx?Key=";

        public static string NewTask(HttpServerUtility server, string url)
        {
            if (directoryPath == null) Directory.CreateDirectory(directoryPath = server.MapPath("/Temp/OfflineDownloader/"));
            url = TFQR.Decode(TFQR.GetUrlType(url), url);
            string md5 = FormsAuthentication.HashPasswordForStoringInConfigFile(url, "MD5"),
                   path = Path.Combine(directoryPath, md5), xmlPath = path + ".xml";
            if (!File.Exists(xmlPath))
            {
                new XDocument(new XElement("download", new XAttribute("url", url))).Save(xmlPath);
                Process.Start(server.MapPath("MygodOfflineDownloader.exe"), path);
            }
            return md5;
        }
    }
}