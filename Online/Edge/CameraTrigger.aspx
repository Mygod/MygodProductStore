<%@ Page Title="CameraTrigger 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="CameraTrigger.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.CameraTrigger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="CameraTrigger.aspx">CameraTrigger 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    CameraTrigger（相机触发器），会在到达这一点（或这一范围）时改变缩放级别。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定相机触发点的坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">Radius</td>
        <td class="nowrap">二维向量</td>
        <td>可选，默认为0,0。使方块的坐标与相机触发器坐标之差的绝对值小于此值时也认为是触发了相机触发器。（换言之可以使相机触发点变成一个矩形）</td>
    </tr>
    <tr>
        <td class="nowrap">Zoom</td>
        <td class="nowrap">16位整数</td>
        <td>可选，默认为0。指定触发后的缩放级别。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
</asp:Content>
