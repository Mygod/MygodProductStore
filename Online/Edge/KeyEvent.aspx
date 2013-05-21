<%@ Page Title="按键事件元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="KeyEvent.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.KeyEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="OtherCube.aspx">OtherCube 元素</a> &amp; <a href="DarkCube.aspx">DarkCube 元素</a> / <a href="KeyEvent.aspx">按键事件元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    按键事件元素，表示一个方块按键的事件。元素名前半部分是West, East, North, South中的一个，表示移动的方向；元素名后半部分是Up或Down，表示是按下这个方向的键还是放开。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">TimeOffset</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。表示从方块被触发到按键间隔的帧（1/30秒）数。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
