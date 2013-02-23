using System;

namespace Mygod.Website.ProductStore.Online
{
    public abstract class VideoBase
    {
        public abstract string Title { get; }
        public abstract string Author { get; }
    }

    public abstract class VideoLinkBase : IComparable<VideoLinkBase>
    {
        public abstract string Url { get; }
        public abstract string Extension { get; }
        public abstract string Properties { get; }
        public abstract VideoBase Parent { get; }
        public abstract int CompareTo(VideoLinkBase other);
    }
}
