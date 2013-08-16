﻿<%@ Page Title="系统定义颜色大全" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Colors.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Colors" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Reflection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">系统定义颜色大全</h2>
    这里显示了所有 <a href="http://msdn.microsoft.com/zh-cn/library/system.drawing.color.aspx">System.Drawing.Color</a> 中的系统定义颜色。
    <table>
        <thead>
            <tr><td>颜色</td><td>名称</td><td>ARGB 值</td></tr>
        </thead>
        <tbody>
            <% foreach (var color in typeof(Color).GetProperties(BindingFlags.Public | BindingFlags.Static)
                  .Select(f => (Color) f.GetValue(null, null)).Where(c => c.IsNamedColor).OrderByDescending(color => (uint) color.ToArgb()))
               { %>
            <tr>
                <td style="background-color: <%=string.Format("rgba({0},{1},{2},{3})", color.R, color.G, color.B, color.A / 255.0) %>);
                     background-color: <%=color.A == 0 ? "transparent" : string.Format("rgb({0},{1},{2})", color.R, color.G, color.B) %>;">
                </td>
                <td>
                    <a href="http://msdn.microsoft.com/zh-cn/library/system.drawing.color.<%=color.Name.ToLower() %>.aspx">
                        <%=color.Name %>
                    </a>
                </td>
                <td>
                    <a href="http://www.colorhexa.com/<%=string.Format("{0:x2}{1:x2}{2:x2}", color.R, color.G, color.B) %>">
                        #<%=color.ToArgb().ToString("X8") %>
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
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
