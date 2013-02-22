using System;
using System.Net;
using System.Net.Sockets;
using Mygod.Website.ProductStore.Online;

// ReSharper disable ConvertToConstant.Global

namespace Mygod.Website.ProductStore
{
    static class R
    {
        private static readonly TimeSpan Offset = NtpClient.GetNetworkTime("time.windows.com") - DateTime.UtcNow;
        internal static DateTime UtcNow { get { return DateTime.SpecifyKind(DateTime.UtcNow.Add(Offset), DateTimeKind.Unspecified); } }
        internal static DateTime Parse(string value)
        {
            return DateTime.SpecifyKind(DateTime.Parse(value), DateTimeKind.Unspecified);
        }

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

    /// <summary>
    /// Static class to receive the time from a NTP server.
    /// </summary>
    public static class NtpClient
    {
        /// <summary>
        /// Gets the current DateTime from <paramref name="ntpServer"/>.
        /// </summary>
        /// <param name="ntpServer">The hostname of the NTP server.</param>
        /// <returns>A DateTime containing the current time.</returns>
        public static DateTime GetNetworkTime(string ntpServer)
        {
            var address = Dns.GetHostEntry(ntpServer).AddressList;
            if (address == null || address.Length == 0)
                throw new ArgumentException("Could not resolve ip address from '" + ntpServer + "'.", "ntpServer");
            var ep = new IPEndPoint(address[0], 123);
            return GetNetworkTime(ep);
        }

        /// <summary>
        /// Gets the current DateTime form <paramref name="ep"/> IPEndPoint.
        /// </summary>
        /// <param name="ep">The IPEndPoint to connect to.</param>
        /// <returns>A DateTime containing the current time.</returns>
        private static DateTime GetNetworkTime(EndPoint ep)
        {
            var s = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
            s.Connect(ep);
            var ntpData = new byte[48]; // RFC 2030 
            ntpData[0] = 0x1B;
            for (var i = 1; i < 48; i++) ntpData[i] = 0;
            s.Send(ntpData);
            s.Receive(ntpData);
            const byte offsetTransmitTime = 40;
            ulong intpart = 0;
            ulong fractpart = 0;
            for (var i = 0; i <= 3; i++) intpart = 256 * intpart + ntpData[offsetTransmitTime + i];
            for (var i = 4; i <= 7; i++) fractpart = 256 * fractpart + ntpData[offsetTransmitTime + i];
            var milliseconds = (intpart * 1000 + fractpart * 1000 / 0x100000000L);
            s.Close();
            return new DateTime(1900, 1, 1) + TimeSpan.FromTicks((long)milliseconds * TimeSpan.TicksPerMillisecond);
        }
    }
}
