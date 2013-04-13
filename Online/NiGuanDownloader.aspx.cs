using System;
using System.Linq;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online
{
    public partial class NiGuanDownloader : Page
    {
        protected void GetEmAll()
        {
            if (string.IsNullOrWhiteSpace(LinkBox.Text)) return;
            int count;
            if (!int.TryParse(CountBox.Text, out count) || count <= 0) count = int.MaxValue;
            foreach (var video in YouTube.Video.GetVideoFromLink(LinkBox.Text).Take(count))
            {
                Response.Write(string.Format("<h3><a href='{1}'>{0}</a></h3>{2}", video.Title, video.Url, Environment.NewLine));
                foreach (var link in video.FmtStreamMap) 
                {
                    Response.Write(string.Format("<div><a href='Chewer.aspx?URL={0}'>{1}</a>　" +
                                                 "<a href=\"OfflineDownloader/Start.aspx?URL={0}\">离线下载</a></div>{2}",
                                                 TFQR.Base64Encode(TFQR.Reverse(link.Url)), link, Environment.NewLine));
                    Response.Flush();
                }
            }
        }
    }
}