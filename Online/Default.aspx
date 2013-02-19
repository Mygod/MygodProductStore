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
        <button class="command-button" type="button" id="offline-downloader">
            Mygod离线下载器
            <small>记住，Mygod离线下载器……就是这么拽！它还可以当梯子使，不过……嘘！</small>
        </button>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mom-cn').click(function () { location.href = '/Online/MOM/'; });
            $('#mom-en').click(function () { location.href = '/Online/MOM/English.htm'; });
            $('#wogcorp').click(function () { location.href = '/Online/WoGCorp/'; });
            $('#browser-download').click(function () { location.href = '/Online/BrowserDownload.aspx'; });
            $('#offline-downloader').click(function () { location.href = '/Online/OfflineDownloader.aspx'; });
        });
    </script>
</asp:Content>
