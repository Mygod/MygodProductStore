<%@ Page Title="OtherCube 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="OtherCube.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.OtherCube" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
     <a href="OtherCube.aspx">OtherCube 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    OtherCube（提示方块），表示一个提示你如何过关的方块。（请注意这玩意儿只能和@Mode=Toggle的Button交互，如magic关所示）
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">PositionTrigger</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定“?”显示的坐标位置，方块到达该位置时会激活提示方块。</td>
    </tr>
    <tr>
        <td class="nowrap">MovingBlockSync</td>
        <td class="nowrap">ID</td>
        <td>可选。指定要与其同步的MovingPlatform的ID。</td>
    </tr>
    <tr>
        <td class="nowrap">PositionCube</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定提示方块的初始位置。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;OtherCube PositionTrigger="70,27,1" MovingBlockSync="Block29" PositionCube="69,25,1"&gt; ... &lt;/OtherCube&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
    <div><a href="KeyEvent.aspx">按键事件元素</a></div>
</asp:Content>
