<%@ Page Title="Mygod离线下载器" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.OfflineDownloader.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .link-box {
            width: 100%;
            height: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Mygod离线下载器</h2>
    <div>迅雷会员一点也不拽，Mygod会员现在也可以获得离线下载的功能！它居然也可以当梯子使，不过……嘘！</div>
    <div>离线原理：先把东西从服务器上下载到Mygod，然后再传给你。</div>
    <div>把地址贴上来，然后按下那个神奇的按钮，在那之后你就可以看看服务器下载得怎么样了。（为了达到最佳速度推荐下载国外地址）</div>
    <div>离线下载器同样支持同时下载多个文件！在下面的窗口中粘贴上所有你要下载的地址然后点击那个神奇的按钮，稍等片刻后服务器就会返回下载链接。点击<a href="Fetch.aspx" target="_blank">这里</a>看看下载状态，当当前任务总数变为0/x时表示全部下载完成，复制以下的下载链接即可开始下载！</div>
    <div>想要销毁任务？把你得到的地址中的Fetch改为Destroy然后打开即可！</div>
    <p><asp:TextBox ID="LinkBox" runat="server" TextMode="MultiLine" CssClass="link-box"></asp:TextBox></p>
    <div class="center"><asp:Button ID="SubmitButton" runat="server" Text="我就是那个神奇的按钮" OnClick="Submit" /></div>
</asp:Content>
