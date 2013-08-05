<%@ Page Title="中国粘粘世界排行榜" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.WoGLeaderboard.Default" %>
<%@ Import Namespace="Mygod.Website.ProductStore" %>
<%@ Import Namespace="Mygod.Website.ProductStore.Online.WoGLeaderboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">中国粘粘世界排行榜</h2>

    <h3 id="level-record">关卡纪录</h3>
    <div>说明：悬停可查看与世界纪录的差距，差距越大颜色越红，差距大于10的会变得鲜血淋漓。</div>
    <table style="width: 100%">
        <thead style="width: 100%">
            <tr style="width: 100%">
                <td class="bold">关卡名</td>
                <td class="bold">最多球数</td>
                <td class="bold">最少步数</td>
                <td class="bold">最快Goal</td>
                <td class="bold">最快OCD</td>
            </tr>
        </thead>
        <tbody>
            <% foreach (var chapter in Data.Records)
               {
                   foreach (var level in chapter)
                   { %>
            <tr>
                <td><%=level.Name %></td>
                   <% for (var i = 0; i < 4; i++)
                      {
                          var record = level.ChinaRecord[i]; %>
                <td><span title="<%=record.Tooltip %>"<%=record.Color %>><%=record.Overview %></span></td>
                   <% } %>
            </tr>
                <% } %>
            <tr>
                <td class="bold"><%=chapter.Name %> 总计</td>
                <td><%=chapter.ChinaSum[0] %> (<%=chapter.WorldSum[0] %>)</td>
                <td><%=chapter.ChinaSum[1] %> (<%=chapter.WorldSum[1] %>)</td>
                <td><%=chapter.ChinaSum[2] %>s (<%=chapter.WorldSum[2] %>s)</td>
                <td><%=chapter.ChinaSum[3] %>s (<%=chapter.WorldSum[3] %>s)</td>
            </tr>
            <% } %>
            <tr>
                <td class="bold">总计</td>
                <td><%=Data.Records.ChinaSum[0] %> (<%=Data.Records.WorldSum[0] %>)</td>
                <td><%=Data.Records.ChinaSum[1] %> (<%=Data.Records.WorldSum[1] %>)</td>
                <td><%=Data.Records.ChinaSum[2] %>s (<%=Data.Records.WorldSum[2] %>s)</td>
                <td><%=Data.Records.ChinaSum[3] %>s (<%=Data.Records.WorldSum[3] %>s)</td>
            </tr>
        </tbody>
    </table>
    
    <h3 id="record-count">破纪录数排行榜</h3>
    <div>说明：悬停可查看破了哪些纪录。</div>
    <ol>
        <% foreach (var player in Players.Instance.OrderByDescending(player => player.WorldRecords.Count)
                                     .ThenByDescending(player => player.ChinaRecords.Count))
           { %>
        <li><%=player %></li>
        <% } %>
    </ol>

    <h3 id="wogcorp">粘粘公司排行榜</h3>
    <% var players = XDocument.Load(Server.MapPath("Players.xml")).Element("Players").Elements("Player")
           .Select(e => new LeaderboardPlayer(e)).ToList(); %>
    <ol>
        <% foreach (var player in players.OrderByDescending(player => player.Tower))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.Tower %>m</li>
        <% } %>
    </ol>

    <h3 id="balls">总球数排行榜</h3>
    <ol>
        <% foreach (var player in players.OrderByDescending(player => player.Balls))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.Balls %> 球</li>
        <% } %>
    </ol>

    <h3 id="moves">总步数排行榜</h3>
    <ol>
        <% foreach (var player in players.OrderBy(player => player.Moves))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.Moves %> 步</li>
        <% } %>
    </ol>

    <h3 id="time">总过关时间排行榜</h3>
    <ol>
        <% foreach (var player in players.OrderBy(player => player.Time))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.TimeFormatted %></li>
        <% } %>
    </ol>

    <div>接下来你要做什么？</div>
    <ul>
        <li><a href="Submit.aspx">现在提交你的关卡纪录！</a></li>
        <li>在下面留言留下你的goofans存档地址以申请进入玩家排行榜！</li>
        <li><a href="Refresh.aspx">刷新最后四个排行榜！（请在你更新了你的 goofans 存档后使用）</a></li>
    </ul>
    
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'online-wogleaderboard';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
