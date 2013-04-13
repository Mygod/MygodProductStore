using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Windows.Forms;

namespace Mygod.Website.ProductStore.Online
{
    public class ServerPeeker : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "image/png";
            using (var bitmap = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height))
            {
                using (var g = Graphics.FromImage(bitmap)) g.CopyFromScreen(new Point(0, 0), new Point(0, 0),
                new Size(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height));
                bitmap.Save(context.Response.OutputStream, ImageFormat.Png);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}