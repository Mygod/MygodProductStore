<%@ Page Title="销毁数据" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Destroy.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.OfflineDownloader.Destroy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">销毁数据</h2>
    <div>恭喜你！你和你的数据现在安全了！<a href="/Online/OfflineDownloader/" target="_blank">开始一个新任务</a>？</div>
    <div><%=ExtraContent %></div>
</asp:Content>
