using System;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online.OfflineDownloader
{
    public partial class MediaHuo : Page
    {
        private static readonly Regex DirectLinkExtractor = new Regex("kNO = \"(.*?)\";", RegexOptions.Compiled);

        protected void TryNow(object sender, EventArgs e)
        {
            Response.Redirect(MygodOfflineDownloader.Prefix + MygodOfflineDownloader.NewTask(Server, 
                DirectLinkExtractor.Match(new WebClient().DownloadString("http://www.mediafire.com/?" + LinkBox.Text)).Groups[1].Value));
        }
    }
}