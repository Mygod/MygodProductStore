using System.Collections.Generic;
using RssToolkit.Rss;

namespace Mygod.Website.ProductStore
{
    public class Feed : RssHttpHandlerBase<RssDocument>
    {
        protected override void PopulateRss(string rssName, string userName)
        {
            Rss.Channel = new RssChannel { Title = "Mygod工作室™", Link = "http://mygod.apphb.com", 
                Description = "接收来自 Mygod工作室™ 的最新动态！", Generator = "Mygod RSS Generator", 
                Image = new RssImage { Title = "Mygod工作室™", Link = "http://mygod.apphb.com", 
                    Description = "接收来自 Mygod工作室™ 的最新动态！", Url = "http://mygod.apphb.com/Logo.png" }, 
                ManagingEditor = "mygodstudio@gmail.com", WebMaster = "mygodstudio@gmail.com", 
                LastBuildDate = Data.CompilationTime.ToString(), Language = "zh-CN", Items = new List<RssItem>() };
            foreach (var product in Data.Products)
            {
                var item = new RssItem { Title = product.Title, Author = "mygodstudio@gmail.com", 
                    Comments = "http://mygodstudio.tk/Product/Details.aspx?ID=" + product.ID, PubDate = product.Date, 
                    Source = new RssSource { Text = "Mygod工作室™", Url = "http://mygod.apphb.com" },
                    Description = "Mygod工作室™ 刚发布/更新了 " + product.Title + "！" };
                item.Guid = new RssGuid { Text = item.Link = "http://mygod.apphb.com/#Product-" + product.ID };
                Rss.Channel.Items.Add(item);
            }
        }
    }
}