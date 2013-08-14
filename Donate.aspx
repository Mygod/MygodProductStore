<%@ Page Title="捐助我们" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="Mygod.Website.ProductStore.Donate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">捐助我们</h2>
    <div>Mygod 工作室™ 竭力为您提供优质的共享软件，为了帮助我们更好地为您服务，也为了增加你的同情心，欢迎您捐助我们。</div>
    <div><a class="coinbase-button" data-code="29d5fb6e7639e6a225b1ac1568a9aef9" data-button-style="donation_large" data-custom="DONATION" href="https://coinbase.com/checkouts/29d5fb6e7639e6a225b1ac1568a9aef9">Donate Bitcoins</a><script src="https://coinbase.com/assets/button.js" type="text/javascript"></script></div>
    <div>比特币可以通过多种方式免费或付费获得，如果你只是闲着没事干，试试使用以下免费的方式帮助我们：</div>
    <ul>
        <li><a href="http://coinreaper.com/?bitcoinAddress=15Haz3tdxEXovnDdCWJdnYVzUQX8wAAM5g">去做任务！</a>（方法：将我们的地址复制到 Bitcoin address 中，再输入 reCAPTCHA 验证码，然后按下按钮即可，然后点击 NEXT SITE 进入下一个任务。）</li>
        <li><a href="http://pan.baidu.com/share/link?shareid=1018408076&uk=3104462449">下载您的系统对应的版本（32 位系统对应 x86，64 位系统对应 x64）的挖矿软件</a>帮助我们挖矿！下载后双击目录下的 mine.bat 即可开始挖矿！通常情况下挖矿会仁慈地使用您的 GPU，如果您不玩游戏应该没有多大影响；</li>
        <li>看看下面来自 Humble Bundle 的艺术品并同时同情我们。（无耻地不推荐！）</li>
    </ul>
    <div class="center"><a href="http://i1264.photobucket.com/albums/jj483/MygodStudio/ProductStore/indie-developer.jpg~original"><img src="http://i1264.photobucket.com/albums/jj483/MygodStudio/ProductStore/indie-developer.jpg~original" /></a></div>
    <div class="center"><a href="http://i1264.photobucket.com/albums/jj483/MygodStudio/ProductStore/indie-musician.jpg~original"><img src="http://i1264.photobucket.com/albums/jj483/MygodStudio/ProductStore/indie-musician.jpg~original" /></a></div>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'donate';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
