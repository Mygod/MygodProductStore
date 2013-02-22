using System;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online
{
    public partial class NiGuanDownloader : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Output = string.Empty;
            if (string.IsNullOrWhiteSpace(LinkBox.Text)) return;
            foreach (var link in YouTube.Video.GetVideoFromLink(LinkBox.Text).FmtStreamMap)
                Output += string.Format("<a href='Chewer.aspx?URL={0}'>{1}</a>　" +
                                        "<a href=\"OfflineDownloader/Start.aspx?URL={0}\">离线下载</a><br />{2}",
                    Convert.ToBase64String(Encoding.UTF8.GetBytes(link.Url.Reverse().Aggregate(string.Empty, (c, s) => c + s))), 
                    link, Environment.NewLine);
        }

        protected string Output;
    }
}