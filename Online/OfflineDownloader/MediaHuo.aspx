<%@ Page Title="媒体火下载器" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MediaHuo.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.OfflineDownloader.MediaHuo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">媒体火下载器</h2>
    <div>
        下载界面地址：http://www.mediafire.com/?<asp:TextBox ID="LinkBox" runat="server" Width="400px"></asp:TextBox>
        <asp:Button ID="SubmitButton" runat="server" OnClick="TryNow" Text="按下试试吧" />
    </div>
</asp:Content>
