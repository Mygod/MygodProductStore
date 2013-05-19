<%@ Page Title="Checkpoint 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="Checkpoint.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Checkpoint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="Checkpoint.aspx">Checkpoint 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    Checkpoint（存档点），若在方块经过这一点（或这一范围）后死亡（或在菜单中选择last checkpoint），会恢复到这一点，并恢复到达这一点时的状态。在settings.ini中设置show_checkpoint_effect = true后会在经过存档点时方块变白一次。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定存档点的坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">RespawnOffsetZ</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。指定恢复时方块上升的高度。</td>
    </tr>
    <tr>
        <td class="nowrap">Radius</td>
        <td class="nowrap">二维向量</td>
        <td>可选，默认为0,0。使方块的坐标与存档点坐标之差的绝对值小于此值时也认为是到达了存档点。（换言之可以使存档点变成一个矩形）</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">无子元素</asp:Content>
