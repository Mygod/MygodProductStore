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
    <tr>
        <td class="nowrap">Radius</td>
        <td class="nowrap">二维向量</td>
        <td>可选，默认为0,0。<a href="#SyntacticSugar">语法糖</a>。使方块的坐标与触发点坐标之差的绝对值小于等于此值时也认为是到达了触发点。（换言之可以使触发点变成一个矩形）</td>
    </tr>
    <tr>
        <td class="nowrap">Mode</td>
        <td class="nowrap">特殊</td>
        <td>可选，默认为AutoHide。<a href="#SyntacticSugar">语法糖</a>。填写MoveAway后被触发的位置下方的方块会开始变色。（<a href="http://www.tudou.com/programs/view/QUHjSYtGDZ8/">wire的视频演示</a>）填写Hole后被触发位置下方会变得什么都没有，下落到洞中后会自动瞬移到洞口并不再下落。（<a href="http://www.tudou.com/programs/view/96D37ut4YVM/">furious bot的视频演示</a>）选择AutoHide后离开该方块时提示方块会消失，否则不会消失。MoveAway只能生效一次，之后会变成AutoHide模式。Hole也只能生效一次，之后再进入不会再次下落，也不会触发提示方块。P.S. 原理是在触发位置放一个MovingPlatform和一个Button，并在方块移动到触发位置时将方块移开，来避免方块离开时提示方块消失。</td>
    </tr>
    <tr>
        <td class="nowrap">MoveDirection</td>
        <td class="nowrap">二维向量</td>
        <td>可选，在AutoHide模式下默认为0,0,0，在MoveAway模式下为0,-1,0，在Hole模式下为0,0,1。<a href="#SyntacticSugar">语法糖</a>。在设置了MovingPlatform/Waypoint的情况下此属性将被忽略。该属性在AutoHide模式下此属性无意义，在其他模式下此属性表示触发方块的移动方向向量。在Hole模式中实际触发位置以及MovingPlatform的初始位置为原来触发位置减去该向量的值。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Example">&lt;OtherCube PositionTrigger="70,27,1" MovingBlockSync="Block29" PositionCube="69,25,1"&gt; ... &lt;/OtherCube&gt;</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ChildElements" runat="server">
    <div><a href="MovingPlatform.aspx">MovingPlatform 元素</a>（仅在非AutoHide模式下可用，@AutoStart与@Looped的默认值为False，在没有子元素的情况下会有两个路点，即从@PositionTrigger开始向@MoveDirection移动，@TravelTime在MoveAway模式下为32000，在Hole模式下为1）</div>
    <div><a href="Button.aspx">Button 元素</a>（仅在非AutoHide模式下可用，@Position默认值为@PositionTrigger，@Visible默认值为False，@AffectMovingPlatforms会自动添加与其对应的MovingPlatform）</div>
    <div><a href="KeyEvent.aspx">按键事件元素</a></div>
</asp:Content>
