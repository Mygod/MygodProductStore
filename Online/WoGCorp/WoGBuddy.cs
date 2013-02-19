using System;
using System.Net;
using System.Xml;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.WoGCorp
{
    public static class WoGBuddy
    {
        private static readonly WebClient Client = new WebClient();

        private static string GetStringResponse(string param)
        {
            string s;
            lock (Client) s = Client.DownloadString("https://worldofgoo.com/wogbuddy2.php?" + param);
            if (string.IsNullOrEmpty(s)) throw new Exception("服务器返回空响应，请稍后再试。");
            return s;
        }

        private static XElement GetXmlResponseFromString(string s)
        {
            // ReSharper disable PossibleNullReferenceException
            XDocument document;
            try
            {
                document = XDocument.Parse(s);
            }
            catch (XmlException e)
            {
                throw new Exception("服务器返回 “" + s + "”。", e);
            }
            var response = document.Element("WogResponse");
            if (response.Attribute("result").Value.ToLower() != "ok") throw new Exception("服务器处理失败！返回信息：" + s);
            return response;
            // ReSharper restore PossibleNullReferenceException
        }

        private static XElement GetXmlResponseAdvanced(string param)
        {
            return GetXmlResponseFromString(GetStringResponse(param));
        }

        internal static XElement GetXmlResponse(string param, string playerKey = "df97bc13a9a8d0a02e1939055181f9dd")
        {
            return GetXmlResponseAdvanced("version=1%2e40win&playerkey=" + playerKey + "&op=" + param);
        }

        internal static long GetRank(double height)
        {
            // ReSharper disable PossibleNullReferenceException
            return long.Parse(GetXmlResponse("SetWogcStat&ballCount=1000000&ballCountAttached=3&height=" + height.ToString())
                       .Element("rank").Value);
            // ReSharper restore PossibleNullReferenceException
        }

        internal static double GetHeight(long rank)
        {
            int left = 0, right = 1200, middle = 0;
            while (left <= right)
            {
                middle = (left + right) >> 1;
                var result = GetRank(middle / 10.0);
                if (rank < result) left = middle + 1; else right = middle - 1;
            }
            return middle / 10.0;
        }

        internal static string GetPlayerName(string playerKey)
        {
            // ReSharper disable PossibleNullReferenceException
            return GetXmlResponse("SetLevelStats&balls=4&levelid=GoingUp&moves=10&time=9999", playerKey).Attribute("message").Value
                .Replace("recorded levelstat for player ", string.Empty).Replace(", levelid GoingUp", string.Empty);
            // ReSharper restore PossibleNullReferenceException
        }
    }
}