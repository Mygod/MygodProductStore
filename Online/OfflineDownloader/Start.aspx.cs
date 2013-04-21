using System;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online.OfflineDownloader
{
    public partial class Start : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.QueryString["URL"];
            if (string.IsNullOrWhiteSpace(url)) return;
            url = Encoding.UTF8.GetString(Convert.FromBase64String(url)).Reverse().Aggregate(string.Empty, (c, s) => c + s);
            Response.Redirect(MygodOfflineDownloader.Prefix + MygodOfflineDownloader.NewTask(Server, url));
        }
    }
}