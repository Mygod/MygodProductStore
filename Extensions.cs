using System;
using System.Net;
using Mygod.Website.ProductStore.Online;

// ReSharper disable ConvertToConstant.Global

namespace Mygod.Website.ProductStore
{
    static class R
    {
        internal static string GetVideoFileName(this VideoLinkBase link, bool ignoreExtensions = false)
        {
            return "%T%E".Replace("%T", link.Parent.Title).Replace("%A", link.Parent.Author)
                .Replace("%E", ignoreExtensions ? string.Empty : link.Extension).Replace("%", "%0").Replace("\\", "%1").Replace("/", "%2")
                .Replace(":", "%3").Replace("*", "%4").Replace("?", "%5").Replace("\"", "%6").Replace("<", "%7").Replace(">", "%8")
                .Replace("|", "%9");
        }
        internal static readonly string GetVideoInfoLink = "http://www.youtube.com/get_video_info?video_id={0}&eurl=http://mygodstudio.tk/";

        internal static string UrlDecode(this string str)
        {
            return Uri.UnescapeDataString(str);
        }

        internal static string UrlEncode(this string str)
        {
            return Uri.EscapeDataString(str);
        }
    }

    static class Settings
    {
        public static readonly WebClient Client = new WebClient();
    }
}
