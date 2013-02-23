using System;
using System.Linq;
using System.Text;

namespace Mygod.Website.ProductStore.Online
{
    internal static class TFQR
    {
        public static string Base64Encode(string str)
        {
            return Convert.ToBase64String(Encoding.Default.GetBytes(str));
        }

        public static string Base64Decode(string str)
        {
            return Encoding.Default.GetString(Convert.FromBase64String(str));
        }

        public static string PublicEncode(string link, string linkpre, string prefix, string suffix, string name)
        {
            if (String.IsNullOrEmpty(link)) throw new ArgumentNullException("link");
            if (link.ToLower().StartsWith(linkpre.ToLower())) throw new ArgumentException("该链接已经是" + name + "下载链接。");
            return linkpre + Base64Encode(prefix + link + suffix);
        }

        public static string PublicDecode(string link, string linkpre, string prefix, string suffix, string name)
        {
            if (String.IsNullOrEmpty(link)) throw new ArgumentNullException("link");
            if (!link.ToLower().StartsWith(linkpre.ToLower())) throw new ArgumentException("该链接不是" + name + "下载链接。");
            link = link.TrimEnd('\\', '/', ' ', '\t', '\r', '\n');
            var and = link.IndexOf('&');
            if (and >= 0) link = link.Substring(0, and);
            var result = Base64Decode(link.Substring(linkpre.Length));
            return result.Substring(prefix.Length, result.Length - prefix.Length - suffix.Length);
        }

        public static string ThunderEncode(string link)
        {
            return PublicEncode(link, "thunder://", "AA", "ZZ", "迅雷");
        }

        public static string ThunderDecode(string link)
        {
            return PublicDecode(link, "thunder://", "AA", "ZZ", "迅雷");
        }

        public static string FlashGetEncode(string link)
        {
            return PublicEncode(link, "flashget://", "[FLASHGET]", "[FLASHGET]", "快车");
        }

        public static string FlashGetDecode(string link)
        {
            return PublicDecode(link, "flashget://", "[FLASHGET]", "[FLASHGET]", "快车");
        }

        public static string QQDLEncode(string link)
        {
            return PublicEncode(link, "qqdl://", String.Empty, String.Empty, "旋风");
        }

        public static string QQDLDecode(string link)
        {
            return PublicDecode(link, "qqdl://", String.Empty, String.Empty, "旋风");
        }

        public static string RayFileEncode(string link)
        {
            return PublicEncode(link, "fs2you://", String.Empty, String.Empty, "RayFile");
        }

        public static string RayFileDecode(string link)
        {
            return PublicDecode(link, "fs2you://", String.Empty, String.Empty, "RayFile");
        }

        public static string Reverse(string value)
        {
            return value.Reverse().Aggregate(string.Empty, (c, s) => c + s);
        }

        public static string OfflineEncode(string link)
        {
            return PublicEncode(Reverse(link), "http://mygod.apphb.com/Online/OfflineDownloader/Start.aspx?URL=", string.Empty,
                                string.Empty, "Mygod离线下载器");
        }

        public static string OfflineDecode(string link)
        {
            return Reverse(PublicDecode(link, "http://mygod.apphb.com/Online/OfflineDownloader/Start.aspx?URL=", string.Empty,
                           string.Empty, "Mygod离线下载器"));
        }

        public static string Encode(Operation to, string i)
        {
            switch (to)
            {
                case Operation.Normal:
                case Operation.HideEar:
                    return i;
                case Operation.Thunder:
                    return ThunderEncode(i);
                case Operation.FlashGet:
                    return FlashGetEncode(i);
                case Operation.QQDL:
                    return QQDLEncode(i);
                case Operation.RayFile:
                    return RayFileEncode(i);
                case Operation.Offline:
                    return OfflineEncode(i);
                default:
                    throw new ArgumentException("未知的链接格式！");
            }
        }

        public static string Decode(Operation from, string i)
        {
            switch (from)
            {
                case Operation.Normal:
                case Operation.HideEar:
                    return i;
                case Operation.Thunder:
                    return ThunderDecode(i);
                case Operation.FlashGet:
                    return FlashGetDecode(i);
                case Operation.QQDL:
                    return QQDLDecode(i);
                case Operation.RayFile:
                    return RayFileDecode(i);
                default:
                    throw new ArgumentException("未知的链接格式！");
            }
        }

        public static string Decode(string i)
        {
            return Decode(GetUrlType(i), i);
        }

        public static string ConvertUrl(Operation from, Operation to, string i)
        {
            return from == to ? i : Encode(to, Decode(from, i));
        }
        public static string ConvertUrl(Operation to, string i)
        {
            var from = GetUrlType(i);
            return from == to ? i : Encode(to, Decode(from, i));
        }

        public static Operation GetUrlType(string i)
        {
            var l = i.ToLower();
            if (l.StartsWith("http://mygod.apphb.com/online/offlinedownloader/start.aspx?url=")) return Operation.Offline;
            if (l.StartsWith("thunder://")) return Operation.Thunder;
            if (l.StartsWith("flashget://")) return Operation.FlashGet;
            if (l.StartsWith("qqdl://")) return Operation.QQDL;
            return l.StartsWith("fs2you://") ? Operation.RayFile : Operation.Normal;
        }
    }

    enum Operation
    {
        HideEar, Copy, Normal, Thunder, FlashGet, QQDL, RayFile, Download, Offline
    }
}
