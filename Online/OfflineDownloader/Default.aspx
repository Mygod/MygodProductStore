<%@ Page Title="Mygod离线下载器" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.OfflineDownloader.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .link-box {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Mygod离线下载器</h2>
    <div>迅雷会员一点也不拽，Mygod会员现在也可以获得离线下载的功能！它居然也可以当梯子使，不过……嘘！</div>
    <div>把地址贴上来，然后按下那个神奇的按钮，在那之后你就可以看看服务器下载得怎么样了。</div>
    <div><asp:TextBox ID="LinkBox" runat="server" CssClass="link-box"></asp:TextBox></div>
    <div>&nbsp;</div>
    <div class="center"><asp:Button ID="SubmitButton" runat="server" Text="我就是那个神奇的按钮" /></div>
</asp:Content>
