<%@ Page Title="Waypoint 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="Waypoint.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.MovingPlatform_Waypoint" %>
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
        <td>必填。该点的坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">TravelTime</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。移动到该点需要使用的分秒（0.1秒）数。</td>
    </tr>
    <tr>
        <td class="nowrap">PauseTime</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。在该点停留的分秒（0.1秒）数。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
