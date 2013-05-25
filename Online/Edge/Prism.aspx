<%@ Page Title="Prism 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="Prism.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Prism" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="Prism.aspx">Prism 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    Prism（棱柱），取得S(+)的必经之路，吃到后可在一定步数内加速的神奇玩意儿。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定棱柱的位置。</td>
    </tr>
    <tr>
        <td class="nowrap">Energy</td>
        <td class="nowrap">8位自然数</td>
        <td>可选，默认为1。已过时。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
