using System;
using System.Web;
using System.Web.Routing;

namespace Mygod.Website.ProductStore
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.MapPageRoute("EVERYTHING!!!!!!!1!", "{*Path}", "~/Default.aspx", false);
        }
    }
}