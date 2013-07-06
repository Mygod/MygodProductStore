using System;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.WoGLeaderboard
{
    public partial class Refresh : Page
    {
        private const string Prefix = "http://goofans.com/leaderboard/";
        private static readonly Regex HighestTower = new Regex("Highest ever tower: (.*?)m", RegexOptions.Compiled),
                                      Profile = new Regex("profile/(.*?)\"", RegexOptions.Compiled | RegexOptions.RightToLeft),
                                      Summary = new Regex("<td style=\"text-align:right\">(.*?)</td>", RegexOptions.Compiled);
        private static readonly WebClient Client = new WebClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            Now(Server);
        }

        public static void Now(HttpServerUtility server)
        {
            var path = server.MapPath("~/Online/WoGLeaderboard/Players.xml");
            var doc = XDocument.Load(path);
            foreach (var player in doc.Element("Players").Elements("Player"))
            {
                string key = player.GetAttribute("Key"), content = Client.DownloadString(Prefix + "player/" + key);
                player.SetAttributeValue("Tower", HighestTower.Match(content).Groups[1].Value);
                var matches = Summary.Matches(Client.DownloadString(Prefix + "profile/" + Profile.Match(content).Groups[1].Value));
                player.SetAttributeValue("Balls", matches[0].Groups[1].Value.Replace(",", string.Empty));
                player.SetAttributeValue("Moves", matches[1].Groups[1].Value.Replace(",", string.Empty));
                var time = matches[2].Groups[1].Value.Split(':');
                player.SetAttributeValue("Time", int.Parse(time[0]) * 60 + int.Parse(time[1]));
            }
            doc.Save(path);
        }
    }
}