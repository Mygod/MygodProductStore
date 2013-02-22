<%@ Page Title="YouTube下载者 Online" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
         CodeBehind="YouTubeDownloader.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.YouTubeDownloader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .link-box {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">YouTube下载者 Online</h2>
    <div>使用它可以下载任何一部YouTube上的视频！此产品基于<a href="/Online/Chewer.aspx">Mygod嚼烂喂给你吃下载器</a>。</div>
    <div>把地址贴上来，然后按下那个神奇的按钮，在那之后你就可以选择一个链接下载了。</div>
    <div><asp:TextBox ID="LinkBox" runat="server" CssClass="link-box"></asp:TextBox></div>
    <div>&nbsp;</div>
    <div class="center"><asp:Button ID="SubmitButton" runat="server" Text="我就是那个神奇的按钮" /></div>
    <p><%=Output %></p>
</asp:Content>
