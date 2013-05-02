<%@ Page Title="粘粘世界吧排行榜" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.WoGLeaderboard.Default" %>
<%@ Import Namespace="Mygod.Website.ProductStore" %>
<%@ Import Namespace="Mygod.Website.ProductStore.Online.WoGLeaderboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">粘粘世界吧排行榜</h2>

    <h3>关卡纪录</h3>
    <div>说明：悬停可查看与世界纪录的差距。</div>
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
                          var record = level.TiebaRecord[i]; %>
                <td><span title="<%=record.Tooltip %>"><%=record.Overview %></span></td>
                   <% } %>
            </tr>
                <% } %>
            <tr>
                <td class="bold"><%=chapter.Name %> 总计</td>
                <td><%=chapter.TiebaSum[0] %> (<%=chapter.WorldSum[0] %>)</td>
                <td><%=chapter.TiebaSum[1] %> (<%=chapter.WorldSum[1] %>)</td>
                <td><%=chapter.TiebaSum[2] %>s (<%=chapter.WorldSum[2] %>s)</td>
                <td><%=chapter.TiebaSum[3] %>s (<%=chapter.WorldSum[3] %>s)</td>
            </tr>
            <% } %>
            <tr>
                <td class="bold">总计</td>
                <td><%=Data.Records.TiebaSum[0] %> (<%=Data.Records.WorldSum[0] %>)</td>
                <td><%=Data.Records.TiebaSum[1] %> (<%=Data.Records.WorldSum[1] %>)</td>
                <td><%=Data.Records.TiebaSum[2] %>s (<%=Data.Records.WorldSum[2] %>s)</td>
                <td><%=Data.Records.TiebaSum[3] %>s (<%=Data.Records.WorldSum[3] %>s)</td>
            </tr>
        </tbody>
    </table>
    
    <h3>破纪录数排行榜</h3>
    <div>说明：悬停可查看破了哪些纪录。</div>
    <ol>
        <% foreach (var player in Players.Instance.OrderByDescending(player => player.WorldRecords.Count)
                                     .ThenByDescending(player => player.TiebaRecords.Count))
           { %>
        <li><%=player %></li>
        <% } %>
    </ol>

    <h3>粘粘公司排行榜</h3>
    <% var players = XDocument.Load(Server.MapPath("Players.xml")).Element("Players").Elements("Player")
           .Select(e => new LeaderboardPlayer(e)).ToList(); %>
    <ol>
        <% foreach (var player in players.OrderByDescending(player => player.Tower))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.Tower %>m</li>
        <% } %>
    </ol>

    <h3>总球数排行榜</h3>
    <ol>
        <% foreach (var player in players.OrderByDescending(player => player.Balls))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.Balls %> 球</li>
        <% } %>
    </ol>

    <h3>总步数排行榜</h3>
    <ol>
        <% foreach (var player in players.OrderBy(player => player.Moves))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.Moves %> 步</li>
        <% } %>
    </ol>

    <h3>总过关时间排行榜</h3>
    <ol>
        <% foreach (var player in players.OrderBy(player => player.Time))
           { %>
        <li><span class="bold"><%=player.NameWithLink %></span>：<%=player.TimeFormatted %></li>
        <% } %>
    </ol>

    <div>接下来你要做什么？</div>
    <ul>
        <li><a href="Submit.aspx">现在提交你的关卡纪录！</a></li>
        <li><a href="http://tieba.baidu.com/p/2303510329">现在申请进入玩家排行榜！</a></li>
        <li><a href="Refresh.aspx">刷新最后四个排行榜！（请在你更新了你的 goofans 存档后使用）</a></li>
    </ul>
</asp:Content>
