<%@ Page Title="搭塔者" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.WoGCorp.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">搭塔者</h2>
    <p><%=Output %></p>
    <div>
        我辛辛苦苦搭了 <asp:TextBox ID="HeightTextBox" runat="server"></asp:TextBox>
        米高的塔，结果才排到<asp:Button ID="ShowRankButton" runat="server" Text="……" OnClick="Show" CssClass="bg-color-darken" />
    </div>
    <div>
        我想要排到第 <asp:TextBox ID="RankTextBox" runat="server"></asp:TextBox>
        名，居然至少要搭<asp:Button ID="ShowHeightButton" runat="server" Text="……" OnClick="Show" CssClass="bg-color-darken" />
    </div>
    <div>
        玩家在线认证码为 <asp:TextBox ID="PlayerKeyBox" runat="server" Width="250"></asp:TextBox>
        的名字是<asp:Button ID="ShowNameButton" runat="server" Text="……" OnClick="Show" CssClass="bg-color-darken" />
    </div>
    <p>P.S. 玩家名为“Mygod Data Fetcher”的玩家是我的机器人，不要见怪。此外，“居然至少要搭……”功能速度较慢，慎用以免此页被卡死。<a href="http://goofans.com/forum/world-of-goo/general-discussion/3975">太神奇了，这怎么办到的？！</a></p>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'online-wogcorp';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
