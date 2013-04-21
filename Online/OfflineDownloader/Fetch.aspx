<%@ Page Title="Mygod离线下载器飞速下载中" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Fetch.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.OfflineDownloader.Fetch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function getQueryStringRegExp(name) {
            var reg = new RegExp("(^|\\?|&)" + name + "=([^&]*)(\\s|&|$)", "i");
            if (reg.test(location.href)) return unescape(RegExp.$2.replace(/\+/g, " ")); return "";
        };
        $(document).ready(function () {
            $("#terrible-button").click(function () {
                location.href = "Destroy.aspx?Key=" + getQueryStringRegExp("Key");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Mygod离线下载器飞速下载中</h2>
    <div>Mygod离线下载器正在飞速下载你的文件，在这段时间，你可以看看一下下面给你的下载状态。</div>
    <asp:ScriptManager ID="Manager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="Panel" runat="server">
        <ContentTemplate>
            <asp:Timer runat="server" ID="Timer" Interval="1000"></asp:Timer>
            <div style="word-wrap: break-word;">原文件地址：　<%=Url %></div>
            <div>当前状态：　　<%=Status %></div>
            <div>文件总大小：　<%=FileSize %></div>
            <div>已下载大小：　<%=DownloadedFileSize %></div>
            <div>平均下载速度：<%=AverageDownloadSpeed %>&nbsp;每秒</div>
            <div>开始时间：　　<%=StartTime %></div>
            <div>花费时间：　　<%=SpentTime %></div>
            <div>预计剩余时间：<%=RemainingTime %></div>
            <div>预计结束时间：<%=EndingTime %></div>
            <div>当前任务总数：<%=TaskCount %></div>
            <div>磁盘可用空间：<%=AvailableFreeSpace %></div>
            <div class="progress-bar">
                <%-- ReSharper disable UnexpectedValue --%>
                <div class="bar" style="width: <%=Percentage %>%;"></div>
                <%-- ReSharper restore UnexpectedValue --%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p class="center">你的任务被服务器咔嚓了？下载失败了？下载完了这个机密文件准备把它销毁了？服务器端的这个文件已经更新了？点击下面可怕的按钮销毁你的文件！</p>
    <p class="center"><button type="button" id="terrible-button">我就是那个可怕的按钮</button></p>
    <div>与此同时，你也可以做这些事：</div>
    <ul>
        <li>盯着上面的进度看它不断更新；</li>
        <li>跳踢踏舞；</li>
        <li>上Mygod 工作室™或Mygod 产品专卖店™的网站；</li>
        <li>订购些来自Mygod 工作室™的伟大产品；</li>
        <li>撞墙；</li>
        <li>抱怨Mygod离线下载器下载得太慢；</li>
        <li>再<a href="/Online/OfflineDownloader/" target="_blank">开始一个新任务</a>；</li>
        <li>读上面这些无聊的文字；</li>
        <li>读这三行无聊的文字；</li>
        <li>还有读下面那些无聊的FAQ！</li>
    </ul>
    <div>FAQ:</div>
    <ol>
        <li>假如我不点这个可怕的按钮，我的文件会永久保存吗？<br />
            答案是否定的，一旦我的网站更新新的版本，你的文件将会被推送到数据的深渊，你将再也无法找到它。有时更新新版本时可能甚至还在下载，在这种情况下你的任务将被彻底咔嚓。（即再也找不到记录，此时你需要重新下载）</li>
        <li>我可以关掉这个页面吗？它太占内存了。<br />
            当然！不然Mygod工作室™发明这玩意儿干吗？为了好玩么？不过记住<strong>要保存好这个页面的地址</strong>，并<strong>常回来看看</strong>，尤其是要赶在任务被咔嚓或被彻底咔嚓之前回来把你的东西下载下来。</li>
        <li>我使用这厮下载的文件可以被别人下载到吗？网站管理员能下载到吗？<br />
            只要别人不知道这个页面的地址，即使是网站管理员也下载不到。</li>
        <li>我怎么知道任务被咔嚓或彻底咔嚓了？<br />
            看看上面显示的“当前状态”，如果显示已被咔嚓（通常是因为服务器重启，不过几率很小）或是有“错误……thread……aborted”的字样，那么就是被咔嚓了，请销毁后重新开始下载；如果当前状态显示“文件消失”字样，则你的任务或者被彻底咔嚓，或者服务器反应慢，请刷新一下试试，如果被彻底咔嚓，你无须销毁，只要重新下载一下就行了。</li>
        <li>下载完成后我怎么下载文件？<br />
            很简单，刷新一下，你的下载就会开始。Enjoy! :D</li>
        <li>下载离线下载器下载好的文件的速度真**慢啊……<br />
            是的，我们似乎也发现了我们的网速受到了土啬的限制，你可以试试使用迅雷（使用这个页面的地址下载），或者换个时间来下。如果运气好，可以全速下载。</li>
        <li>我可以使用迅雷下载吗？<br />
            是的！研究表明<strong>你完全可以用迅雷下载</strong>，而且似乎迅雷下载得更快！只要等离线下载完成后将此页的链接复制到迅雷中即可！</li>
    </ol>
</asp:Content>
