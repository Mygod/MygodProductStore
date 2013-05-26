<%@ Page Title="ButtonSequence 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="ButtonSequence.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.ButtonSequence" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="ButtonSequence.aspx">ButtonSequence 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    ButtonSequence（按钮序列），表示一堆可以被方块按下的按钮。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">SequenceInOrder</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为False。指定是否强制按钮序列要用指定的顺序按下。</td>
    </tr>
    <tr>
        <td class="nowrap">AffectMovingPlatforms</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。指定一堆要影响的移动方块ID。若数据为0表示遍历所有的路点，否则表示遍历指定个路点。</td>
    </tr>
    <tr>
        <td class="nowrap">AffectBumpers</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。指定一堆要影响的撞击器ID。若数据为0表示停止撞击（若正在连续无条件撞击）或撞击一次（如果当前不在撞击），若数据为1表示启动该撞击器的连续无条件撞击。</td>
    </tr>
    <tr>
        <td class="nowrap">TriggerAchievements</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。指定一堆要触发的成就ID。数据表示部分成就使用的元数据。</td>
    </tr>
    <tr>
        <td class="nowrap">AffectButtons</td>
        <td class="nowrap">带数据的ID列表</td>
        <td>可选。指定一堆要影响的按钮ID。若数据为0表示启动（弹起）按钮，若数据为1表示禁用（按下）按钮。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;ButtonSequence SequenceInOrder="True" AffectMovingPlatforms="Block10,Block11,Block12" AffectBumpers="Bumper1,Bumper2,Bumper3,Bumper4"&gt; ... &lt;/ButtonSequence&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
    <div><a href="Button.aspx">Button</a>（至少2个）</div>
</asp:Content>
