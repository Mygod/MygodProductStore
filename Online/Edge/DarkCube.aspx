<%@ Page Title="DarkCube 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="DarkCube.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.DarkCube" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="DarkCube.aspx">DarkCube 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    DarkCube（暗方块），表示一个提示你如何过关或阻碍你过关的方块。（请注意这玩意儿同样会像普通方块一样与实际关卡交互）
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">PositionTrigger</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定“?”显示的坐标位置，方块到达该位置时会激活暗方块。</td>
    </tr>
    <tr>
        <td class="nowrap">Radius</td>
        <td class="nowrap">二维向量</td>
        <td>可选，默认为0,0。使方块的坐标与触发点坐标之差的绝对值小于此值时也认为是到达了触发点。（换言之可以使触发点变成一个矩形）</td>
    </tr>
    <tr>
        <td class="nowrap">MovingBlockSync</td>
        <td class="nowrap">ID</td>
        <td>可选。指定要与其同步的MovingPlatform的ID。</td>
    </tr>
    <tr>
        <td class="nowrap">PositionCube</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定暗方块的初始位置。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
    <div><a href="KeyEvent.aspx">按键事件元素</a></div>
</asp:Content>
