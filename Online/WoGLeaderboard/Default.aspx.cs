using System;
using System.Web.UI;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.WoGLeaderboard
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }

    public class LeaderboardPlayer
    {
        public LeaderboardPlayer(XElement element)
        {
            Key = element.GetAttribute("Key");
            Name = element.GetAttribute("Name");
            Tower = double.Parse(element.GetAttribute("Tower"));
            Balls = int.Parse(element.GetAttribute("Balls"));
            Moves = int.Parse(element.GetAttribute("Moves"));
            Time = int.Parse(element.GetAttribute("Time"));
        }

        public readonly string Key, Name;
        public readonly double Tower;
        public readonly int Balls, Moves, Time;

        public string NameWithLink
        {
            get { return string.Format("<a href=\"http://goofans.com/leaderboard/player/{0}\">{1}</a>", Key, Name); }
        }
        public string TimeFormatted { get { return Time / 60 + ":" + Time % 60; } }
    }
}