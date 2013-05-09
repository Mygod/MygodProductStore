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
            Directory.CreateDirectory(@"D:\Temp\MyTestDirectory");
            File.WriteAllText(@"D:\Temp\MyTestDirectory\MyTestGarbage", "Garbage");
            Response.WriteFile(@"D:\Temp\MyTestDirectory\MyTestGarbage");
        }
    }
}