<%@ Page Title="在线工具" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
         Inherits="Mygod.Website.ProductStore.Online.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="buttons">
        <button class="command-button" type="button" id="mom-cn">
            MOM 中文版
            <small>改良版！</small>
        </button>
        <button class="command-button" type="button" id="mom-en">
            MOM 英文版
            <small>改良版！</small>
        </button>
        <button class="command-button" type="button" id="wogcorp">
            搭塔者
            <small>看看世界上正在搭塔的人们。</small>
        </button>
        <button class="command-button" type="button" id="browser-download">
            Mygod浏览器下载小工具
            <small>用来用浏览器下载一些东西……（我的第一个Javascript程序）</small>
        </button>
        <button class="command-button" type="button" id="chewer">
            Mygod嚼烂喂给你吃下载器
            <small>记住，Mygod嚼烂喂给你吃下载器……就是这么拽！它还可以当梯子使，不过……嘘！</small>
        </button>
        <button class="command-button" type="button" id="youtube-downloader">
            你管下载者 Online
            <small>使用它可以下载任何一部你管上的视频！</small>
        </button>
        <button class="command-button" type="button" id="offline-downloader">
            Mygod离线下载器
            <small>迅雷会员一点也不拽，Mygod会员现在也可以获得离线下载的功能！它居然也可以当梯子使，不过……嘘！</small>
        </button>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mom-cn').click(function () { location.href = 'MOM/'; });
            $('#mom-en').click(function () { location.href = 'MOM/English.htm'; });
            $('#wogcorp').click(function () { location.href = 'WoGCorp/'; });
            $('#browser-download').click(function () { location.href = 'BrowserDownload.aspx'; });
            $('#chewer').click(function () { location.href = 'Chewer.aspx'; });
            $('#youtube-downloader').click(function () { location.href = 'NiGuanDownloader.aspx'; });
            $('#offline-downloader').click(function () { location.href = 'OfflineDownloader/'; });
        });
    </script>
</asp:Content>
