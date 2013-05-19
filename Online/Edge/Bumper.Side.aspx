<%@ Page Title="North &amp; East &amp; South &amp; West 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="Bumper.Side.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Bumper_Side" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="Bumper.aspx">Bumper 元素</a> / <a href="Bumper.Side.aspx">North &amp; East &amp; South &amp; West 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    撞击方向元素指定撞击器在该方向撞击的动作。若不填写表示在该方向不撞击。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">StartDelay</td>
        <td class="nowrap">16位整数</td>
        <td>可选，默认为0。表示从关卡开始到第一次撞击之间的分秒（0.1秒）数。若为-1表示不撞击。</td>
    </tr>
    <tr>
        <td class="nowrap">PulseRate</td>
        <td class="nowrap">16位整数</td>
        <td>可选，默认为0。表示两次撞击之间间隔的分秒（0.1秒）数。若为-1表示不撞击。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
