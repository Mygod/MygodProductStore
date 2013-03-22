using System;
using System.IO;
using System.Web.Security;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online
{
    public partial class NiGuanDownloader : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Output = string.Empty;
            if (string.IsNullOrWhiteSpace(LinkBox.Text)) return;
            foreach (var video in YouTube.Video.GetVideoFromLink(LinkBox.Text))
            {
                Output += string.Format("<h3><a href='{1}'>{0}</a></h3>{2}", video.Title, video.Url, Environment.NewLine);
                foreach (var link in video.FmtStreamMap) Output += string.Format("<div><a href='Chewer.aspx?URL={0}'>{1}</a>　" +
                    "<a href=\"OfflineDownloader/Start.aspx?URL={0}\">离线下载</a></div>{2}",
                     TFQR.Base64Encode(TFQR.Reverse(link.Url)), link, Environment.NewLine);
            }
        }

        protected string Output;
    }
}