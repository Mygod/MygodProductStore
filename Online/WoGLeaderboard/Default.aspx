<%@ Page Title="粘粘世界吧排行榜" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.WoGLeaderboard.Default" %>
<%@ Import Namespace="Mygod.Website.ProductStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">粘粘世界吧排行榜</h2>

    <h3>关卡纪录</h3>
    <div>说明：悬停可查看与世界纪录的差距。</div>
    <table>
        <thead>
            <tr>
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
    
    <h3>顶尖玩家排行榜</h3>
    <div>说明：悬停可查看破了哪些纪录。</div>
    <% foreach (var player in Players.Instance.OrderByDescending(player => player.WorldRecords.Count)
                                     .ThenByDescending(player => player.TiebaRecords.Count))
       { %>
    <div><%=player %></div>
    <% } %>
    <div>&nbsp;</div>
    <div><a href="Submit.aspx">现在提交你的记录！</a></div>
</asp:Content>
