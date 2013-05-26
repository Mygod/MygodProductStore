<%@ Page Title="MovingPlatform 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="MovingPlatform.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.MovingPlatform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="MovingPlatform.aspx">MovingPlatform 元素</a> /
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    MovingPlatform（移动方块），表示一个会移动的方块，其颜色由/Level/@Theme指定。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">ID</td>
        <td class="nowrap">ID</td>
        <td>可选。填写后可用于被引用。</td>
    </tr>
    <tr>
        <td class="nowrap">AutoStart</td>
        <td class="nowrap">可空布尔型</td>
        <td>可选，默认为True。指定在关卡开始时是否该方块是否需要移动。</td>
    </tr>
    <tr>
        <td class="nowrap">Looped</td>
        <td class="nowrap">可空布尔型</td>
        <td>可选，默认为True。指定在指定轨道上运行一次后是否需要回到第一个点并继续移动。</td>
    </tr>
    <tr>
        <td class="nowrap">Clones</td>
        <td class="nowrap">16位整数</td>
        <td>可选，默认为-1。已过时。</td>
    </tr>
    <tr>
        <td class="nowrap">FullBlock</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为True。指定该移动方块是完整的一个方块还是只有上半个。（请注意这只是外观上不同，在游戏物理引擎中两者并无差别）</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;MovingPlatform ID="Block19" AutoStart="False" Looped="False"&gt; ... &lt;/MovingPlatform&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
    <a href="Waypoint.aspx">Waypoint</a>
</asp:Content>
