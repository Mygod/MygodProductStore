using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
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
            string md5 = FormsAuthentication.HashPasswordForStoringInConfigFile(url, "MD5"),
                   path = Server.MapPath("/Temp/" + md5), xmlPath = path + ".xml";
            if (!File.Exists(xmlPath))
            {
                var download = new XElement("download", new XAttribute("url", url));
                var doc = new XDocument(download);
                Directory.CreateDirectory(Path.GetDirectoryName(xmlPath));
                doc.Save(xmlPath);
                var thread = new Thread(() =>
                {
                    FileStream fileStream = null;
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
                        if (fileLength != null) download.Add(new XAttribute("size", fileLength));
                        download.Add(new XAttribute("fileName", fileName), new XAttribute("startTime", DateTime.Now));
                        doc.Save(xmlPath);
                        stream.CopyTo(fileStream = File.Create(path));
                        download.Add(new XAttribute("endTime", DateTime.Now));
                        doc.Save(xmlPath);
                    }
                    catch (Exception exc)
                    {
                        download.Add(new XAttribute("message", exc.Message));
                        doc.Save(xmlPath);
                    }
                    finally
                    {
                        if (fileStream != null) fileStream.Close();
                        Application.Remove(md5);
                    }
                });
                thread.Start();
                Application[md5] = thread;
            }
            Response.Redirect("Fetch.aspx?Key=" + md5);
        }
    }
}