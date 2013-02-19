using System;
using System.Web.UI;

namespace Mygod.Website.ProductStore
{
    public partial class Site : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Page.Title)) Page.Title = "Mygod 产品专卖店™";
            else Page.Title += " - Mygod 产品专卖店™";
        }
    }
}