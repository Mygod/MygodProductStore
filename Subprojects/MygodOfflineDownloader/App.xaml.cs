using System;
using System.IO;
using System.Net;
using System.Windows;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.OfflineDownloader
{
    public partial class App
    {
        private void OnStartup(object sender, StartupEventArgs e)
        {
            Run(e.Args[0]);
            Shutdown();
        }

        private static void Run(string path)
        {
            var xmlPath = path + ".xml";
            if (!File.Exists(xmlPath)) return;
            FileStream fileStream = null;
            var doc = XDocument.Load(xmlPath);
            var download = doc.Element("download");
            var url = download.Attribute("url").Value;
            try
            {
                var request = WebRequest.Create(url);
                var response = request.GetResponse();
                var stream = response.GetResponseStream();
                var disposition = response.Headers["Content-Disposition"] ?? string.Empty;
                var pos = disposition.IndexOf("filename=", StringComparison.Ordinal);
                var fileName = pos >= 0 ? disposition.Substring(pos + 9).Trim('"', '\'') : Path.GetFileName(url);
                long? fileLength;
                if (stream.CanSeek) fileLength = stream.Length;
                else
                    try
                    {
                        fileLength = response.ContentLength;
                    }
                    catch
                    {
                        fileLength = null;
                    }
                if (fileLength != null) download.SetAttributeValue("size", fileLength);
                download.SetAttributeValue("fileName", fileName);
                download.SetAttributeValue("startTime", R.UtcNow);
                doc.Save(xmlPath);
                stream.CopyTo(fileStream = File.Create(path));
                download.SetAttributeValue("endTime", R.UtcNow);
                doc.Save(xmlPath);
            }
            catch (Exception exc)
            {
                download.SetAttributeValue("message", exc.Message);
                doc.Save(xmlPath);
            }
            finally
            {
                if (fileStream != null) fileStream.Close();
            }
        }
    }
}
