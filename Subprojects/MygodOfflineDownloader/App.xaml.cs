using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Windows;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.OfflineDownloader
{
    public partial class App
    {
        private void OnStartup(object sender, StartupEventArgs e)
        {
            Run(e.Args[0]);
            Shutdown();
        }

        private static void Run(string path)
        {
            var xmlPath = path + ".xml";
            if (!File.Exists(xmlPath)) return;
            FileStream fileStream = null;
            var doc = XDocument.Load(xmlPath);
            var download = doc.Element("download");
            var url = download.Attribute("url").Value;
            download.SetAttributeValue("id", Process.GetCurrentProcess().Id);
            try
            {
                var request = WebRequest.Create(url);
                var response = request.GetResponse();
                var stream = response.GetResponseStream();
                var disposition = response.Headers["Content-Disposition"] ?? string.Empty;
                var pos = disposition.IndexOf("filename=", StringComparison.Ordinal);
                var fileName = pos >= 0 ? disposition.Substring(pos + 9).Trim('"', '\'') : Path.GetFileName(url);
                long? fileLength;
                if (stream.CanSeek) fileLength = stream.Length;
                else
                    try
                    {
                        fileLength = response.ContentLength;
                    }
                    catch
                    {
                        fileLength = null;
                    }
                if (fileLength != null) download.SetAttributeValue("size", fileLength);
                download.SetAttributeValue("fileName", fileName);
                download.SetAttributeValue("startTime", R.UtcNow);
                doc.Save(xmlPath);
                stream.CopyTo(fileStream = File.Create(path));
                download.SetAttributeValue("endTime", R.UtcNow);
                doc.Save(xmlPath);
            }
            catch (Exception exc)
            {
                download.SetAttributeValue("message", exc.Message);
                doc.Save(xmlPath);
            }
            finally
            {
                if (fileStream != null) fileStream.Close();
            }
        }
    }
    public static class R
    {
        private static readonly TimeSpan Offset = NtpClient.GetNetworkTime("time.windows.com") - DateTime.UtcNow;
        public static DateTime UtcNow { get { return DateTime.SpecifyKind(DateTime.UtcNow.Add(Offset), DateTimeKind.Unspecified); } }
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
