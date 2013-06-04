<%@ Page Title="Mygod浏览器下载小工具" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrowserDownload.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.BrowserDownload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script type="text/javascript">
    var link = prompt("请输入要下载的链接", "about:blank");
    if (link == null) window.location.href = "\\Online\\";
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Mygod浏览器下载小工具</h2>
    <p class="center">
        <script type="text/javascript">
            document.write("<a href='" + link + "'>右击这里 - 目标另存为即可下载</a>");
        </script>
    </p>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'online-browser-download';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
