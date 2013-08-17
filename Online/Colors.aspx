<%@ Page Title="系统定义颜色大全" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Colors.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Colors" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Reflection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        li {
            display: inline-block !important;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">系统定义颜色大全</h2>
    这里显示了所有 <a href="http://msdn.microsoft.com/zh-cn/library/system.drawing.color.aspx">System.Drawing.Color</a> 中的系统定义颜色。
    <ul>
        <% foreach (var color in typeof(Color).GetProperties(BindingFlags.Public | BindingFlags.Static)
               .Select(f => (Color) f.GetValue(null, null)).Where(c => c.IsNamedColor).OrderByDescending(color => (uint) color.ToArgb()))
           {
               var foreground = Math.Sqrt(0.241 * color.R * color.R + 0.691 * color.G * color.G + 0.068 * color.B * color.B) >= 127.5
                   ? "black" : "white"; %>
        <li style="background-color: <%=string.Format("rgba({0},{1},{2},{3})", color.R, color.G, color.B, color.A / 255.0) %>;
                   background-color: <%=color.A == 0 ? "transparent" : string.Format("rgb({0},{1},{2})", color.R, color.G, color.B) %>;">
            <a href="http://msdn.microsoft.com/zh-cn/library/system.drawing.color.<%=color.Name.ToLower() %>.aspx" target="_blank"
               style="color: <%=foreground%>;"><%=color.Name %></a><br /><a style="color: <%=foreground%>;" target="_blank"
               href="http://www.colorhexa.com/<%=string.Format("{0:x2}{1:x2}{2:x2}", color.R, color.G, color.B) %>">
                #<%=color.ToArgb().ToString("X8") %>
            </a>
        </li>
        <% } %>
    </ul>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'online-colors';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
