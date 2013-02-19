using System;
using System.Collections.Generic;
using System.Linq;

namespace Mygod.Website.ProductStore.Online
{
    public static class YouTube
    {
        public class Video : VideoBase
        {
            private Video(string videoInfo)
            {
                information = (from info in videoInfo.Split('&') let i = info.IndexOf('=') 
                               select new { Key = info.Substring(0, i), Value = info.Substring(i + 1) })
                    .ToDictionary(pair => pair.Key, pair => pair.Value);
                if (videoInfo.Contains("status=fail"))
                    throw new Exception("获取视频信息失败！原因：" + Uri.UnescapeDataString(information["reason"]).Replace('+', ' '));
                FmtStreamMap = information["url_encoded_fmt_stream_map"].UrlDecode().Split(',').SelectMany(s => FmtStream.Create(s, this)).ToList();
                information.Remove("url_encoded_fmt_stream_map");
            }

            public static Video GetVideoFromWebPageLink(string link)
            {
                var v = link.IndexOf("v=", StringComparison.Ordinal);
                link = string.Format(R.GetVideoInfoLink, v < 0 ? link.Substring(link.LastIndexOf('/') + 1) : link.Substring(v + 2, 11));
                var data = Settings.Client.DownloadString(link);
                return new Video(data);
            }
            public static Video GetVideoFromWebPage(string link)
            {
                var data = Settings.Client.DownloadString(link);   // find video inner
                var uefsm = data.IndexOf("data-video-id=\"", StringComparison.Ordinal);
                if (uefsm < 0) throw new ArgumentException("您的URL格式不对。");
                data = data.Substring(uefsm + 15);
                return GetVideoFromVideoID(data.Substring(0, data.IndexOf('\"')));
            }

            private static Video GetVideoFromVideoID(string id)
            {
                return new Video(Settings.Client.DownloadString(string.Format(R.GetVideoInfoLink, id)));
            }
            private readonly Dictionary<string, string> information;
            public readonly List<FmtStream> FmtStreamMap;

            public override string Title { get { return Uri.UnescapeDataString(information["title"]).Replace('+', ' '); } }
            public override string Author { get { return Uri.UnescapeDataString(information["author"]).Replace('+', ' '); } }
        }

        public class FmtStream : VideoLinkBase
        {
            protected FmtStream(Video parent, string url)
            {
                this.parent = parent;
                this.url = url;
            }

            private FmtStream(VideoFormat videoFormat, VideoEncodings videoEncoding, int videoWidth, int videoHeight,
                              double? videoMinBitrate, double? videoMaxBitrate, AudioEncodings audioEncoding, int audioMinChannels,
                              int audioMaxChannels, int audioSamplingRate, int? audioBitrate, string url, Video parent) : this(parent, url)
            {
                Format = videoFormat;
                VideoEncoding = videoEncoding;
                MaxVideoWidth = videoWidth;
                MaxVideoHeight = videoHeight;
                VideoMinBitrate = videoMinBitrate;
                VideoMaxBitrate = videoMaxBitrate;
                AudioEncoding = audioEncoding;
                MinChannels = audioMinChannels;
                MaxChannels = audioMaxChannels;
                SamplingRate = audioSamplingRate;
                AudioBitrate = audioBitrate;
            }

            public static IEnumerable<FmtStream> Create(string data, Video parent)
            {
                var dic = (from info in data.Split('&') let i = info.IndexOf('=')
                           select new { Key = info.Substring(0, i), Value = info.Substring(i + 1) })
                    .ToDictionary(pair => pair.Key, pair => pair.Value);
                var result = Create(Convert.ToInt32(dic["itag"]), dic["url"].UrlDecode() + "&signature=" + dic["sig"], 
                                    dic["fallback_host"], parent).ToList();
                foreach (var u in result.OfType<UnknownFmtStream>())
                {
                    u.Quality = dic["quality"];
                    u.Type = dic["type"].UrlDecode();
                }
                return result;
            }

            private static IEnumerable<FmtStream> Create(int itag, string url, string fallbackHost, Video parent)
            {
                var fallbackUrl = url.Substring(7);
                fallbackUrl = "http://" + fallbackHost + fallbackUrl.Remove(0, fallbackUrl.IndexOf('/'));
                var urls = string.IsNullOrEmpty(fallbackHost) ? new[] { url } : new[] {url, fallbackUrl};
                switch (itag)
                {
                    case 0:     //OUTDATED, 4 Unknown
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatFLV, VideoEncodings.Undefined, 400, 240, null, null,
                                                                           AudioEncodings.MP3, 1, 1, 22050, null, u, parent);
                        yield break;
                    case 5:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatFLV, VideoEncodings.SorensonH263, 400, 240, 0.25, 0.25,
                                                                           AudioEncodings.MP3, 1, 2, 22050, 64, u, parent);
                        yield break;
                    case 6:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatFLV, VideoEncodings.SorensonH263, 450, 270, 0.8, 0.8,
                                                                           AudioEncodings.MP3, 1, 2, 44100, 64, u, parent);
                        yield break;
                    case 13:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.Format3GP, VideoEncodings.MPEG4Visual, 176, 144, 0.5, 0.5,
                                                                           AudioEncodings.AAC, 1, 1, 22050, 75, u, parent);
                        yield break;
                    case 17:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.Format3GP, VideoEncodings.MPEG4Visual, 176, 144, 2, 2,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 75, u, parent);
                        yield break;
                    case 18:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H264Baseline, 640, 360, 0.5, 0.5,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 96, u, parent);
                        yield break;
                    case 22:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H264High, 1280, 720, 2.0, 2.9,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 152, u, parent);
                        yield break;
                    case 34:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatFLV, VideoEncodings.H264Main, 640, 360, 0.5, 0.5,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 128, u, parent);
                        yield break;
                    case 35:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatFLV, VideoEncodings.H264Main, 854, 480, 0.8, 1,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 128, u, parent);
                        yield break;
                    case 36:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.Format3GP, VideoEncodings.MPEG4Visual, 400, 240, 0.8, 0.8,
                                                                           AudioEncodings.AAC, 1, 1, 22050, 75, u, parent);
                        yield break;
                    case 37:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H264High, 1920, 1080, 3.5, 5,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 152, u, parent);
                        yield break;
                    case 38:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H264High, 4096, 3072, 0, 0,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 152, u, parent);
                        yield break;
                    case 43:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP8, 640, 360, 0.5, 0.5,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 128, u, parent);
                        yield break;
                    case 44:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP8, 854, 480, 1, 1,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 128, u, parent);
                        yield break;
                    case 45:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP8, 1280, 720, 2, 2,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 192, u, parent);
                        yield break;
                    case 46:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP8, 1920, 1080, 2, 2,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 192, u, parent);
                        yield break;
                    case 82:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H2643D, 640, 360, 0.5, 0.5,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 96, u, parent);
                        yield break;
                    case 83:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H2643D, 854, 240, 0.5, 0.5,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 152, u, parent);
                        yield break;
                    case 84:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H2643D, 1280, 720, 2, 2.9,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 152, u, parent);
                        yield break;
                    case 85:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatMP4, VideoEncodings.H2643D, 1920, 520, 2, 2.9,
                                                                           AudioEncodings.AAC, 2, 2, 44100, 152, u, parent);
                        yield break;
                    case 100:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP83D, 640, 360, null, null,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 128, u, parent);
                        yield break;
                    case 101:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP83D, 854, 480, null, null,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 192, u, parent);
                        yield break;
                    case 102:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP83D, 1280, 720, null, null,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 192, u, parent);
                        yield break;
                    case 103:
                        foreach (var u in urls) yield return new FmtStream(VideoFormat.FormatWebM, VideoEncodings.VP83D, 1920, 540, null, null,
                                                                           AudioEncodings.Vorbis, 2, 2, 44100, 192, u, parent);
                        yield break;
                    default:
                        foreach (var u in urls) yield return new UnknownFmtStream(itag, u, parent);
                        yield break;
                }
            }

            // ReSharper disable MemberCanBePrivate.Global
            public readonly VideoFormat Format = VideoFormat.Undefined;
            public readonly VideoEncodings VideoEncoding = VideoEncodings.Undefined;
            public readonly int MaxVideoWidth;
            public readonly int MaxVideoHeight;
            public readonly double? VideoMinBitrate;
            public readonly double? VideoMaxBitrate;
            public readonly int MinChannels;
            public readonly int MaxChannels;
            public readonly AudioEncodings AudioEncoding = AudioEncodings.Undefined;
            public readonly int SamplingRate;
            public readonly int? AudioBitrate;
            // ReSharper restore MemberCanBePrivate.Global

            private readonly Video parent;

            public override VideoBase Parent { get { return parent; } }
            public override string Extension { get { return GetVideoFormatExtension(Format); } }

            private readonly string url = "about:blank;";

            public override string Url
            {
                get { return url + "&title=" + this.GetVideoFileName(true).UrlEncode(); }
            }

            public override int CompareTo(VideoLinkBase other)
            {
                if (!(other is FmtStream)) throw new NotSupportedException();
                if (this is UnknownFmtStream) if (other is UnknownFmtStream) return 0; else return -1;
                if (other is UnknownFmtStream) return 1;
                var you = other as FmtStream;
                var mine = MaxVideoWidth * MaxVideoHeight;
                var your = you.MaxVideoWidth * you.MaxVideoHeight;
                if (mine > your) return 1;
                if (mine < your) return -1;
                if (VideoMaxBitrate > you.VideoMaxBitrate) return 1;
                if (VideoMaxBitrate < you.VideoMaxBitrate) return -1;
                if (MinChannels > you.MinChannels) return 1;
                if (MinChannels < you.MinChannels) return -1;
                if (SamplingRate > you.SamplingRate) return 1;
                if (SamplingRate < you.SamplingRate) return -1;
                if (AudioBitrate > you.AudioBitrate) return 1;
                if (AudioBitrate < you.AudioBitrate) return -1;
                if (Format != VideoFormat.FormatWebM && you.Format == VideoFormat.FormatWebM) return 1; // 尽量不使用webm因为兼容性不好
                return 0;
            }

            public override string ToString()
            {
                return VideoFormatToString() + " " + MaxVideoWidth + "x" + MaxVideoHeight + " " + ChannelsToString() + " " + SamplingRate + "Hz" +
                       (AudioEncoding == AudioEncodings.Undefined ? String.Empty : (" " + AudioEncodingsToString()));
            }

            // ReSharper disable MemberCanBePrivate.Global

            public string VideoFormatToString()
            {
                return YouTube.VideoFormatToString(Format);
            }

            public string VideoEncodingsToString()
            {
                return YouTube.VideoEncodingsToString(VideoEncoding);
            }

            public string AudioEncodingsToString()
            {
                return YouTube.AudioEncodingsToString(AudioEncoding);
            }

            public string ChannelsToString()
            {
                return YouTube.ChannelsToString(MinChannels, MaxChannels);
            }

            public string VideoBitrateToString()
            {
                if (VideoMinBitrate == null || VideoMaxBitrate == null) return null;
                return Math.Abs(VideoMinBitrate.Value - VideoMaxBitrate.Value) < 1e-4
                    ? VideoMaxBitrate.Value.ToString() : (VideoMinBitrate + "-" + VideoMaxBitrate);
            }

            // ReSharper restore MemberCanBePrivate.Global
        }

        private class UnknownFmtStream : FmtStream
        {
            public UnknownFmtStream(int code, string url, Video parent) : base(parent, url)
            {
                videoTypeCode = code;
            }

            private readonly int videoTypeCode;
            public string Quality, Type;

            public override string ToString()
            {
                return string.Format("未知的FMT #{0} 类型：{1} 质量：{2} 请联系Mygod解决此问题", videoTypeCode, Type, Quality);
            }
        }

        public enum VideoFormat
        {
            Undefined,
            FormatFLV,
            FormatMP4,
            Format3GP,
            FormatWebM
        }

        private static string VideoFormatToString(VideoFormat format)
        {
            switch (format)
            {
                case VideoFormat.Format3GP:
                    return "3GP";
                case VideoFormat.FormatFLV:
                    return "FLV";
                case VideoFormat.FormatMP4:
                    return "MP4";
                case VideoFormat.FormatWebM:
                    return "WebM";
                default:
                    return "未知格式";
            }
        }

        private static string GetVideoFormatExtension(VideoFormat format)
        {
            switch (format)
            {
                case VideoFormat.Format3GP:
                    return ".3gp";
                case VideoFormat.FormatFLV:
                    return ".flv";
                case VideoFormat.FormatMP4:
                    return ".mp4";
                case VideoFormat.FormatWebM:
                    return ".webm";
                default:
                    return string.Empty;
            }
        }

        public enum VideoEncodings
        {
            Undefined, 
            SorensonH263, 
            H264Main,
            H264Baseline, 
            H264High,
            H2643D, 
            VP8, 
            VP83D, 
            MPEG4Visual
        }

        private static string VideoEncodingsToString(VideoEncodings encoding)
        {
            switch (encoding)
            {
                case VideoEncodings.SorensonH263:
                    return "Sorenson H.263";
                case VideoEncodings.H264Main:
                    return "MPEG-4 AVC (H.264) Main";
                case VideoEncodings.H264Baseline:
                    return "MPEG-4 AVC (H.264) Baseline";
                case VideoEncodings.H264High:
                    return "MPEG-4 AVC (H.264) High";
                case VideoEncodings.H2643D:
                    return "MPEG-4 AVC (H.264) 3D";
                case VideoEncodings.VP8:
                    return "VP8";
                case VideoEncodings.VP83D:
                    return "VP8 3D";
                case VideoEncodings.MPEG4Visual:
                    return "MPEG-4 Visual";
                default:
                    return "未知视频解码";
            }
        }

        public enum AudioEncodings
        {
            Undefined,
            AAC,
            MP3,
            Vorbis
        }

        private static string AudioEncodingsToString(AudioEncodings encoding)
        {
            switch (encoding)
            {
                case AudioEncodings.AAC:
                    return "AAC";
                case AudioEncodings.MP3:
                    return "MP3";
                case AudioEncodings.Vorbis:
                    return "Vorbis";
                default:
                    return "未知音频编码";
            }
        }

        private static string ChannelsToString(int minChannels, int maxChannels)
        {
            if (minChannels != maxChannels && minChannels != 1 && maxChannels != 2) return string.Format("{0}至{1}声道", minChannels, maxChannels);
            switch (minChannels)
            {
                case 1:
                    return maxChannels == 1 ? "单声道" : "单声道或双声道";
                case 2:
                    return "双声道";
                case 6:
                    return "5.1声道";
                case 8:
                    return "7.1声道";
                default:
                    return minChannels + "声道";
            }
        }
    }
}
