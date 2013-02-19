using System;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online
{
    public partial class YouTubeDownloader : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Output = string.Empty;
            if (string.IsNullOrWhiteSpace(LinkBox.Text)) return;
            foreach (var link in YouTube.Video.GetVideoFromWebPageLink(LinkBox.Text).FmtStreamMap)
                Output += string.Format("<a href='http://mygod.apphb.com/Online/Chewer.aspx?URL={0}'>{1}</a><br />{2}",
                                        Server.UrlEncode(link.Url), link, Environment.NewLine);
        }

        protected string Output;
    }
}