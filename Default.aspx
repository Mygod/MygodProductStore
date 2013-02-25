﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
         Inherits="Mygod.Website.ProductStore.Default" %>
<%@ Import Namespace="Mygod.Website.ProductStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript" src="javascript/dialog.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <p>欢迎来到 Mygod 产品专卖店™！这是 Mygod 工作室™的一项<a href="https://github.com/Mygod/MygodProductStore">开源项目</a>。你可以在 Mygod 网站罢工时来这里订购来自 <a href="http://mygodstudio.tk/">Mygod 工作室™</a> 的<a href="http://mygodstudio.tk/Product/">产品</a>。</p>
    <% var products = Data.Products.OrderByDescending(product => DateTime.Parse(product.Date)).ToArray(); %>
    <div>
        <% foreach (var product in products)
           { %>
        <button class="command-button" id="<%=product.ID %>" type="button">
            <%=product.Title %>
            <small>发布日期：<%=product.Date %></small>
        </button><% } %>
    </div>
    <script type="text/javascript">
        var reg = /(.*)#Product-(.*)/;
        var basePage = location.href.replace(reg, "$1");
        while (basePage[basePage.length - 1] == '#') basePage = basePage.substr(0, basePage.length - 1);
        var pageID = location.href.replace(reg, "$2");
        function returnBase() {
            location.href = basePage + '#Main';
        }
        function subscribe(id, title, requirements, link) {
            var f = function() {
                location.href = basePage + "#Product-" + id;
                var buttons = {
                    '官方下载': {
                        'action': function() {
                            window.open('http://mygodstudio.tk/Product/Details.aspx?ID=' + id);
                            returnBase();
                        }
                    }
                };
                if (link != null) buttons.镜像下载 = {
                     'action': function() {
                         window.open(link);
                         returnBase();
                     }
                };
                buttons.取消 = { 'action': function () { returnBase(); } };
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
            };
            $('#' + id).click(f);
            if (id == pageID) f();
        }
        $(document).ready(function () {
            <% foreach (var product in products)
               { %>subscribe('<%= product.ID %>', '<%=product.Title %>', '<%=product.Requirements %>', <%=product.Link == null ? "null" : '\'' + product.Link + '\''%>);
            <% } %>
        });
    </script>
</asp:Content>
