<%@ Page Title="Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2 class="center">Edge关卡XML参考指南</h2>
    <div>本参考指南为 Mygod工作室™ 的产品 <a href="/#Product-94">Edge浏览器</a> 编写。如果你还不知道这是什么，先去看看吧。</div>
    <div>简要说明：在你反编译一个关卡后，你会得到一个xxx.xml、一个xxx.png和若干个xxx.x.png文件。</div>
    <div>第一个文件是关卡的核心所在，其内部非常复杂。因此你可以<a href="Level.aspx">点这里进入完整的XML参考指南</a>。</div>
    <div>第二个文件是旧版游戏遗留下来的一个奇怪的东西。你可以把它替换成你喜欢的图片，不过它会变成黑白二色（而且不包括灰色！）。（而且不推荐这么做！因为会增大bin文件大小！）</div>
    <div>第三堆文件的后一个x是从0到关卡高度（<a href="Level.aspx">在XML的/Level/@Size中定义</a>）-1的一个索引，表示从下到上第x层中的方块。请注意这里定义的方块在游戏中会影响方块移动，但在PC版中这些玩意儿并不会在关卡中显示。换句话说它们是悬空的。如果你觉得很不爽，你可以用Edge浏览器的修复悬浮功能。（请在完成关卡设计后再使用）</div>
</asp:Content>
