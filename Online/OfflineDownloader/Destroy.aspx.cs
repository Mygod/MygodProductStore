using System;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Web.UI;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.OfflineDownloader
{
    public partial class Destroy : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string md5 = Request.QueryString["Key"] ?? string.Empty, path = Server.MapPath("/Temp/OfflineDownloader/" + md5), 
                   xmlPath = path + ".xml";
            var found = true;
            string url = null;
            if (File.Exists(xmlPath))
            {
                var root = XDocument.Load(xmlPath).Element("download");
                try
                {
                    url = root.Attribute("url").Value;
                }
                catch
                {
                    url = null;
                }
                try
                {
                    Process.GetProcessById(int.Parse(root.Attribute("id").Value)).Kill();
                }
                catch { }
                DeleteWithRetries(xmlPath);
            }
            else found = false;
            DeleteWithRetries(path);
            ExtraContent = found ? string.IsNullOrWhiteSpace(url) ? "虽然你的数据貌似已经损坏了……不过我们还是销毁了它！"
                : string.Format("我们在销毁前的一刹那把你文件的下载地址保留下来了，真是惊心动魄，它就在这儿：<a href=\"{0}\">{0}</a>", 
                    url) : "说得更具体些，事实上我们没找到你要销毁的数据，你确定他们存在过吗？";
        }

        private static void DeleteWithRetries(string path)
        {
        retry:
            try
            {
                File.Delete(path);
            }
            catch
            {
                Thread.Sleep(100);
                goto retry;
            }
        }

        protected string ExtraContent;
    }
}