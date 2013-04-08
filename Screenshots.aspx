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
</asp:Content>
