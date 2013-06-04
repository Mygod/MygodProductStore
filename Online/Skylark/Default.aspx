<%@ Page Title="云雀™" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Skylark.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">云雀™</h2>
    <div>云雀™（开发代号：Skylark）是 Mygod工作室™ 当前正在开发的一个网盘。当前开发进度：Alpha。更多有关该项目的信息将会在该项目完成后添加。</div>
    <div>稳定版Demo：<a href="http://skylark.apphb.com/">http://skylark.apphb.com/</a></div>
    <div>最新版Demo：<a href="http://skylarkbeta.apphb.com/">http://skylarkbeta.apphb.com/</a>（注意：由于这是最新版，在这里的东西会随时被删掉）</div>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'online-skylark';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
