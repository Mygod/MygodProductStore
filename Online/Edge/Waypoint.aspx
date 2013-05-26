<%@ Page Title="Waypoint 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="Waypoint.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.MovingPlatform_Waypoint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="MovingPlatform.aspx">MovingPlatform 元素</a> / <a href="Waypoint.aspx">Waypoint 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    Waypoint（路点），表示移动方块到达的一个点。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。该点的坐标。请注意这里的Z坐标应该在原坐标基础上-1，否则在游戏中将显示不正常！</td>
    </tr>
    <tr>
        <td class="nowrap">TravelTime</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。移动到该点需要使用的帧（1/30秒）数。</td>
    </tr>
    <tr>
        <td class="nowrap">PauseTime</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。在该点停留的帧（1/30秒）数。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;Waypoint Position="-1,-81,4" PauseTime="24" /&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
