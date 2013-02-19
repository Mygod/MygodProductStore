﻿<%@ Page Title="Mygod离线下载器" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OfflineDownloader.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.OfflineDownloader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #link-box {
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#magic-button").click(function () {
                var box = $("#link-box");
                var value = box.val();
                if (value.indexOf("mygod.apphb.com") >= 0) return;
                box.val("http://mygod.apphb.com/Online/OfflineDownloader.aspx?URL=" + encodeURIComponent(value));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Mygod离线下载器</h2>
    <div>记住，Mygod离线下载器……就是这么拽！它还可以当梯子使，不过……嘘！</div>
    <div>把地址贴上来，然后按下那个神奇的按钮，在那之后你就可以打开这个链接下载了。</div>
    <div>
        <input type="text" id="link-box" />
    </div>
    <div>&nbsp;</div>
    <div class="center">
        <button type="button" id="magic-button">我就是那个神奇的按钮</button>
    </div>
</asp:Content>
