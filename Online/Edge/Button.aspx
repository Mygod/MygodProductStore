<%@ Page Title="Button 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="Button.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Button" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    (<a href="ButtonSequence.aspx">ButtonSequence 元素</a> / )<a href="Button.aspx">Button 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    Button（按钮），表示一个可以被方块按下的按钮。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">ID</td>
        <td class="nowrap">ID</td>
        <td>可选。填写后可用于被@AffectButtons引用。</td>
    </tr>
    <tr>
        <td class="nowrap">Visible</td>
        <td class="nowrap">可空布尔型</td>
        <td>可选，默认为True。指定按钮是否可见。</td>
    </tr>
    <tr>
        <td class="nowrap">Enabled</td>
        <td class="nowrap">可空布尔型</td>
        <td>可选，默认为False。用法不明。</td>
    </tr>
    <tr>
        <td class="nowrap">Mode</td>
        <td class="nowrap">特殊</td>
        <td>可选，默认为StayDown。若按钮在ButtonSequence中则此项无效。按钮有按下或弹起两种状态。Toggle表示按下时切换按钮状态，StayUp表示该按钮永远弹起，StayDown表示该按钮按下后不再弹起。</td>
    </tr>
    <tr>
        <td class="nowrap">MovingBlockID</td>
        <td class="nowrap">ID</td>
        <td>可选，默认为使用@Position的坐标。指定与按钮保持相对静止的移动方块的ID。</td>
    </tr>
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>可选，默认为0,0,0。指定按钮在不与任何移动方块绑定的情况下的坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">AffectMovingPlatforms</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。若按钮在ButtonSequence中则此项无效。指定一堆要影响的移动方块ID。若数据为0表示遍历所有的路点，否则表示遍历指定个路点。</td>
    </tr>
    <tr>
        <td class="nowrap">AffectBumpers</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。若按钮在ButtonSequence中则此项无效。指定一堆要影响的撞击器ID。若数据为0表示停止撞击（若正在连续无条件撞击）或撞击一次（如果当前不在撞击），若数据为1表示启动该撞击器的连续无条件撞击。</td>
    </tr>
    <tr>
        <td class="nowrap">TriggerAchievements</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。若按钮在ButtonSequence中则此项无效。指定一堆要触发的成就ID。数据表示部分成就使用的元数据。</td>
    </tr>
    <tr>
        <td class="nowrap">AffectButtons</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。若按钮在ButtonSequence中则此项无效。指定一堆要影响的按钮ID。若数据为0表示启动（弹起）按钮，若数据为1表示禁用（按下）按钮。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;Button ID="Button2" Visible="False" Position="11,11,1" AffectButtons="Button1" /&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
