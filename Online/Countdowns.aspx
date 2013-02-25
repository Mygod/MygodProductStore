<%@ Page Title="倒计时" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Countdowns.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Countdowns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript" src="/javascript/countdowns.js"></script>
    <script type="text/javascript">
        function ceil(i) {
            var digits = $("#digits").val();
            if (isNaN(digits) || digits < 0) digits = 0;
            var pow = Math.pow(10, digits);
            return Math.ceil(i * pow) / pow;
        }
        function timedCount() {
            var countdown = $('#countdown');
            var result = "";
            var now = new Date();
            for (var i = 0; i < countdowns.length; i++) {
                var j = ceil((countdowns[i][1] - now) / 1000);
                if (j <= 0) continue;
                result += "<p>距离 " + countdowns[i][0] + " 还有 " + j + " 秒";
                j = ceil(j / 60);
                if (j <= 0) {
                    result += "。</p>";
                    continue;
                }
                result += "，约合 " + j + " 分";
                j = ceil(j / 60);
                if (j <= 0) {
                    result += "。</p>";
                    continue;
                }
                result += "，" + j + " 小时";
                j = ceil(j / 24);
                if (j <= 0) {
                    result += "。</p>";
                    continue;
                }
                result += "，" + j + " 天";
                j = ceil(j / 7);
                if (j <= 0) {
                    result += "。</p>";
                    continue;
                }
                result += "，" + j + " 周。</p>";
            }
            if (isNullOrWhiteSpace(result)) {
                result = "当前没有可用倒计时，请联系网站管理员以解决此问题。";
                if (interval != undefined && interval != null) interval = clearInterval(i); // stop
            }
            countdown.html(result);
        }
        var interval = setInterval("timedCount();", 1000);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">倒计时</h2>
    <p id="countdown">计算中……</p>
    <div>设置：精确到小数点后<input type="text" value="0" id="digits" maxlength="1" />位。</div>
</asp:Content>
