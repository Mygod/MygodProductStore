<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Screenshots.aspx.cs"
         Inherits="Mygod.Website.ProductStore.Screenshots" %>
<%@ Import Namespace="Mygod.Website.ProductStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <% var id = Request.QueryString["ID"] ?? string.Empty;
       var product = id == null || !Data.Products.Contains(id) ? null : Data.Products[id];
       var i = 0; %>
    <h2 class="center"><%=product == null ? "天知道你要找什么" : product.Name %> 的截图</h2>
    <% if (product == null || product.Screenshots == null)
       { %>
    <div>很不幸，这款软件还没有截图。</div>
    <% }
       else
       { %>
    <div class="screenshots">
        <% foreach (var screenshot in product.Screenshots.Split(new[] { '^' }, StringSplitOptions.RemoveEmptyEntries))
           { %>
        <a href="<%=screenshot %>" target="_blank"><img src="<%=screenshot %>" alt="截图<%=++i %>" title="点击看大图" /></a>
        <% } %>
    </div>
    <% } %>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'product-<%=id %>';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
