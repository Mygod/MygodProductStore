<%@ Page Title="Mygod 产品专卖店™" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
         Inherits="Mygod.Website.ProductStore.Default" %>
<%@ Import Namespace="Mygod.Website.ProductStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript" src="http://metroui.org.ua/js/assets/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="javascript/dialog.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <p>欢迎来到 Mygod 产品专卖店™！你可以在 Mygod 网站罢工时来这里订购来自 Mygod 工作室™的产品。</p>
    <% var products = Data.Products.OrderByDescending(product => DateTime.Parse(product.Date)).ToArray(); %>
    <% foreach (var product in products)
       { %>
    <button class="command-button" id="<%=product.ID %>" type="button">
        <%=product.Title %>
        <small>发布日期：<%=product.Date %></small>
    </button><% } %>
    <div style="text-align: center;">Powered by Mygod 工作室™　<a href="http://tieba.baidu.com/Mygod">售后服务</a></div>
    <div style="text-align: center;">Copyright &copy; 2013 Mygod Product Store™ <%=Data.CurrentAssembly.GetName().Version.ToString() %></div>
    <script type="text/javascript">
        function subscribe(id, title, requirements, link) {
            $('#' + id).click(function () {
                var buttons = {
                    '官方下载': {
                        'action': function () { window.open('http://mygodstudio.tk/Product/Details.aspx?ID=' + id); }
                    }
                };
                if (link != null) buttons.镜像下载 = { 'action': function () { window.open(link); } };
                buttons.取消 = {};
                $.Dialog({
                    'title': '订购伟大的产品',
                    'content': '您将要订购这款来自 Mygod 工作室™ 的伟大产品：<br />' + title + "<br />运行需求：" + requirements
                        + "<br />&nbsp;<br />官方下载不稳定，推荐使用镜像下载。",
                    'draggable': true,
                    'buttonsAlign': 'center',
                    'position': {
                        'zone': 'center',
                        'offsety': 200
                    },
                    'buttons': buttons
                });
            });
        }
        $(document).ready(function () {
            <% foreach (var product in products)
               { %>subscribe(<%= product.ID %>, '<%=product.Title %>', '<%=product.Requirements %>', <%=product.Link == null ? "null" : '\'' + product.Link + '\''%>);
            <% } %>
        });
    </script>
</asp:Content>
