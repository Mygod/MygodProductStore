<%@ Page Title="中国粘粘世界排行榜关卡纪录提交入口" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Submit.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.WoGLeaderboard.Submit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">中国粘粘世界排行榜关卡纪录提交入口</h2>
    <ol>
        <li><span class="bold">提交方式：</span>在最下方的评论区留下截图与破纪录者（如果与你的账户名相同可以省略）。</li>
        <li>
            <span class="bold">截图说明：</span>普通关卡使用EOL场景；每章最后一关使用WoGModifier的控制台调试器截图，具体见<a href="#comment-1">注1</a>。</li>
        <li>作弊者将从排行榜上永久移除。</li>
        <li>如果你认为你先拿到这一个记录，你有以下三种选择：<br />
            ①再次破当前记录。<br />
            ②证明你比他先拿到。为了证明这一结论，你应该不择手段得到（例如查goofans上的存档上传、截图的发表时间等）你和他第一次取得这一成绩的时间区间，如果没有两区间无交集则可以直接得出结论，否则视情况而定。<br />
            ③与纪录保持者辩论直到他松口。如果你有第二个方法的证明或在第三个方法中双方达成协议，可以在下面回帖申诉。</li>
    </ol>
    <div>&nbsp;</div>
    <div id="comment-1" class="bold">注1：</div>
    <div>对于每章的最后一关由于没有EOL场景，因此需要使用<a href="/#Product-54">WoGModifier</a>的控制台调试器截图。方法如下。</div>
    <ol><li>下载并安装WoGModifier，并加载你的原版游戏。</li>
        <li>点击工具 - 选项，选中“启用控制台调试器”。<br />
            <img src="http://i.imgur.com/ve0hHt5.png" /></li>
        <li>双击你的原版游戏（或点击右击 - 运行游戏），此时你就会看到控制台调试器出现。<br />
        <img src="http://i.imgur.com/qj2dGVs.png" /></li>
        <li>去打你的纪录吧！不要关闭这窗口，这窗口对游戏完全没影响，真的。</li>
        <li>打完以后你可以找到如下图中的字样：time&nbsp; stat: old=xxx new=yyy。这里的yyy就是你的时间了，截图下来即可！<br />
        <img src="http://i.imgur.com/LKxyMM7.png" /></li>
        <li>如果很不幸，你的OCD速度比你的Goal速度慢，那么time&nbsp; stat不会显示。没关系，你可以继续往下找，找到HTTP POST这一行，里面有一个time=yy，这个yy就是你的秒数了！你的截图应该要从?balls=开始一直到time=yy&amp;，一来可以看到你玩的是哪一关，其次可以用来证明你玩到的是（举例子）60秒而不是600秒。<br />
            P.S. <span class="bold">尽量不要用上面的time=xx，因为经实验这个xx值总是比你实际使用的秒数偏多！</span>如果实在没有办法，用这个时间破纪录也是可以的，反正是变多嘛，就当你慢了一点就行了！不过最好还是用下面的方法。<br />
        <img src="http://i.imgur.com/Af8Jl8T.png" /></li>
        <li>假如你过关了却没有发现HTTP POST这一行怎么办？<br />
            问得好。的确有时候你会找不到HTTP POST这一行，这并不是因为你没有连接到互联网，而是因为控制台调试的内容还在缓存中。为了把这一行弄出来，你可以在粘粘里不断地进入、退出某个章节，或在在线搭塔开启的模式下在粘粘公司待一会儿，直到接下来的内容刷出来为止。</li>
    </ol>
    
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'online-wogleaderboard-submit';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
