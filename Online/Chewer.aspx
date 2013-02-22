<%@ Page Title="Mygod嚼烂喂给你吃下载器" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
         CodeBehind="Chewer.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Chewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #link-box {
            width: 100%;
        }
    </style>
    <script type="text/javascript" src="https://raw.github.com/carlo/jquery-base64/master/jquery.base64.min.js"></script>
    <script type="text/javascript">
        function isNullOrWhitespace(input) {
            if (!input) return true;
            return input.replace(/\s/g, '').length < 1;
        }
        $(document).ready(function () {
            $("#magic-button").click(function () {
                var box = $("#link-box");
                var value = box.val();
                if (!isNullOrWhitespace(value) && value.indexOf("mygod.apphb.com") < 0)
                    box.val("http://mygod.apphb.com/Online/Chewer.aspx?URL=" + $.base64.encode(value.split("").reverse().join("")));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Mygod嚼烂喂给你吃下载器</h2>
    <div>记住，Mygod嚼烂喂给你吃下载器……就是这么拽！它还可以当梯子使，不过……嘘！</div>
    <div>把地址贴上来，然后按下那个神奇的按钮，在那之后你就可以打开这个链接下载了。很遗憾经测试迅雷似乎并不能用，如果你想用迅雷下载，试试<a href="OfflineDownloader/">Mygod离线下载器</a>！</div>
    <div>
        <input type="text" id="link-box" />
    </div>
    <div>&nbsp;</div>
    <div class="center">
        <button type="button" id="magic-button">我就是那个神奇的按钮</button>
    </div>
</asp:Content>
