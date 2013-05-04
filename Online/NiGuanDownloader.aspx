<%@ Page Title="你管下载者 Online" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
         CodeBehind="NiGuanDownloader.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.NiGuanDownloader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #link-box {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">你管下载者 Online</h2>
    <div>使用它可以下载任何一部你管上的视频！此产品基于<a href="Chewer.aspx">Mygod嚼烂喂给你吃下载器</a>与<a href="OfflineDownloader/">Mygod离线下载器</a>。</div>
    <div>把地址贴上来，然后按下那个神奇的按钮，在那之后你就可以选择一个链接下载了。</div>
    <p><input type="text" id="link-box" value="http://www.youtube.com/results?search_query=" /></p>
    <p class="center"><button type="button" id="magic-button">我就是那个神奇的按钮</button></p>
    <div>离线下载支持使用迅雷。不想通过本服务器而是直接下载？试试该产品的完整版<a href="/#Product-66">掩耳</a>！</div>
    <script type="text/javascript">
        var url = getQueryStringRegExp("URL");
        if (url) $("#link-box").val($.base64reversed.decode(url));
        $("#magic-button").click(function () {
            var box = $("#link-box");
            var value = box.val();
            if (!isNullOrWhiteSpace(value) && value.indexOf("mygod.apphb.com") < 0)
                location.href = "?URL=" + $.base64reversed.encode(value);
        });
    </script>
    <% GetEmAll(); %>
</asp:Content>
