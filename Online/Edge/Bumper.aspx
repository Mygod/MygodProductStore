<%@ Page Title="Bumper 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="Bumper.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Bumper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="Bumper.aspx">Bumper 元素</a> /
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    Bumper（撞击器），表示一个支持撞击的方块。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">ID</td>
        <td class="nowrap">ID</td>
        <td>可选。填写后可用于被@AffectBumpers引用。</td>
    </tr>
    <tr>
        <td class="nowrap">AutoStart</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为True。指定撞击器在关卡开始时是否进行连续无条件撞击。</td>
    </tr>
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定撞击器的位置。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
    <a href="Bumper.Side.aspx">North &amp; East &amp; South &amp; West 元素</a>（各0～1个）
</asp:Content>
