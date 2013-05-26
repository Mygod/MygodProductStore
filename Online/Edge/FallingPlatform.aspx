<%@ Page Title="FallingPlatform 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="FallingPlatform.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.FallingPlatform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="FallingPlatform.aspx">FallingPlatform 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    FallingPlatform（可掉落平台），表示一个受到方块压过后在一段时间后就会消失的方块。（外观为一块会掉落的瓷砖）
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定可掉落平台的坐标。注意：在部分早期版本中若Z坐标≤0会导致有些崩溃。</td>
    </tr>
    <tr>
        <td class="nowrap">FloatTime</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为20。表示压过到掉落之间间隔的帧（1/30秒）数。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;FallingPlatform Position="14,3,1" FloatTime="10" /&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
