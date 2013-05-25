<%@ Page Title="AdvancedCameraTrigger 元素 - EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/EdgeLevel.master" AutoEventWireup="true" CodeBehind="AdvancedCameraTrigger.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.AdvancedCameraTrigger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CurrentPosition" runat="server">
    <a href="AdvancedCameraTrigger.aspx">AdvancedCameraTrigger 元素</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    AdvancedCameraTrigger（高级相机触发器），会在到达这一点（或这一范围）时改变缩放级别。
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">Position</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。指定高级相机触发点的坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">Radius</td>
        <td class="nowrap">二维向量</td>
        <td>可选，默认为0,0。使方块的坐标与高级相机触发器坐标之差的绝对值小于此值时也认为是触发了高级相机触发器。（换言之可以使高级相机触发点变成一个矩形）</td>
    </tr>
    <tr>
        <td class="nowrap">Reset</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为False。指定是否是恢复到原来的缩放级别。</td>
    </tr>
    <tr>
        <td class="nowrap">StartDelay</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。指定触发到开始移动相机之间间隔的帧（1/30秒）数。</td>
    </tr>
    <tr>
        <td class="nowrap">SingleUse</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为False。指定是否只能触发一次。</td>
    </tr>
    <tr>
        <td class="nowrap">FieldOfView</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。指定触发后的视野大小。（单位：°，<a href="http://newinfo.sysu.edu.cn/Snowwaft/?p=933">参考文献</a>）顾名思义视野越大，看到的东西越多，因此物体变得越小。</td>
    </tr>
    <tr>
        <td class="nowrap">Zoom</td>
        <td class="nowrap">16位整数</td>
        <td>可选，默认为0。指定触发后相机的角度。</td>
    </tr>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
</asp:Content>
