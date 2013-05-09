using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mygod.Website.ProductStore.Online
{
    public partial class Tester : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateGarbage(object sender, EventArgs e)
        {
            File.WriteAllText(@"D:\temp\vsmghgtz.v10\output\_PublishedWebsites\MygodProductStore\Online\WoGLeaderboard\Default.aspx.garbage", "Garbage");
            Response.WriteFile(@"D:\temp\vsmghgtz.v10\output\_PublishedWebsites\MygodProductStore\Online\WoGLeaderboard\Default.aspx.garbage"); 
            Response.WriteFile(@"D:\temp\vsmghgtz.v10\output\_PublishedWebsites\MygodProductStore\Online\WoGLeaderboard\Default.aspx");
        }
    }
}