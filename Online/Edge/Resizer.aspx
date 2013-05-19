<%@ Page Title="ResizerGrow &amp; ResizerShrink 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="Resizer.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Resizer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="Resizer.aspx">ResizerGrow &amp; ResizerShrink 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    ResizerGrow（方块放大器） &amp; ResizerShrink（方块缩小器），表示一个可以使方块放大/缩小的按钮。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定方块尺寸调整器的位置。</td>
    </tr>
    <tr>
        <td class="nowrap">Visible</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为True。指定方块尺寸调整器在关卡中是否可见。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
