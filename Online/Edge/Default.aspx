<%@ Page Title="Level 元素 - Edge关卡XML参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Default" %>
<asp:Content ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="CurrentPosition" runat="server">&nbsp;</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description">Edge关卡XML的根元素，表示一个关卡。</asp:Content>
<asp:Content ContentPlaceHolderID="Body" runat="server">
    <tr>
        <td class="nowrap">ID</td>
        <td class="nowrap">32位整数</td>
        <td>必填。关卡的标识符。若相同ID的关卡同时安装在游戏中，则只会显示前一个。</td>
    </tr>
    <tr>
        <td class="nowrap">Name</td>
        <td class="nowrap">文本</td>
        <td>必填。关卡名。</td>
    </tr>
    <tr>
        <td class="nowrap">TimeThresholds</td>
        <td class="nowrap">16位自然数列表</td>
        <td>必填。由5个数字组成，分别表示达到S+、S、A、B、C所需的秒数。</td>
    </tr>
    <tr>
        <td class="nowrap">Size</td>
        <td class="nowrap">三维大小</td>
        <td>必填。填写关卡大小。</td>
    </tr>
    <tr>
        <td class="nowrap">SpawnPoint</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。方块起始坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">ExitPoint</td>
        <td class="nowrap">三维坐标</td>
        <td>必填。终点坐标。</td>
    </tr>
    <tr>
        <td class="nowrap">Theme</td>
        <td class="nowrap">8位自然数</td>
        <td>可选，默认为0。指定关卡的外观主题。如果大于3则会在游戏中变成0。0为白色主题，1为浅灰色主题，2为深灰色主题，3为黑色主题。</td>
    </tr>
    <tr>
        <td class="nowrap">MusicJava</td>
        <td class="nowrap">8位自然数</td>
        <td>可选，默认为0。在Java版上播放音乐的索引。如果大于11则会在游戏中变为0。音乐列表（前面的数字为代号）：00_menus, 01_braintonik, 02_cube_dance, 03_essai_2, 04_essai_01, 05_test, 06_mysterycube, 07_03_EDGE, 08_jungle, 09_RetardTonic, 10_oldschool_simon, 11_planant</td>
    </tr>
    <tr>
        <td class="nowrap">Music</td>
        <td class="nowrap">8位自然数</td>
        <td>可选，默认为0。在其他版本上播放音乐的索引。如果大于24则会在游戏中变为6。音乐列表（前面的数字为代号）：00_Title, 01_Eternity, 02_Quiet, 03_Pad, 04_Jingle, 05_Tec, 06_Kakkoi, 07_Dark, 08_Squadron, 09_8bits, 10_Pixel, 11_Jupiter, 12_Shame, 13_Debrief, 14_Space, 15_Voyage_geometrique, 16_Mzone, 17_R2, 18_Mystery_cube, 19_Duty, 20_PerfectCell, 21_fun, 22_lol, 23_lostway, 24_wall_street</td>
    </tr>
    <tr>
        <td class="nowrap">Zoom</td>
        <td class="nowrap">16位整数</td>
        <td>可选，默认为-1。关卡开始时的缩放级别。若小于0则表示使用高级缩放模式。</td>
    </tr>
    <tr>
        <td class="nowrap">FieldOfView</td>
        <td class="nowrap">16位自然数</td>
        <td>可选，默认为0。表示在高级缩放模式下的视野大小。（单位：°，<a href="http://newinfo.sysu.edu.cn/Snowwaft/?p=933">参考文献</a>）顾名思义视野越大，看到的东西越多，因此物体变得越小。</td>
    </tr>
    <tr>
        <td class="nowrap">AutoAdjustZoom</td>
        <td class="nowrap">布尔型</td>
        <td>可选，默认为False。在高级缩放模式下指定是否为视野大小调整缩放级别。</td>
    </tr>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ChildElements">
    <div>
        <a href="MovingPlatform.aspx">MovingPlatform</a><br />
        <a href="Bumper.aspx">Bumper</a><br />
        <a href="FallingPlatform.aspx">FallingPlatform</a><br />
        <a href="Checkpoint.aspx">Checkpoint</a><br />
        <a href="CameraTrigger.aspx">CameraTrigger</a><br />
        <a href="AdvancedCameraTrigger.aspx">AdvancedCameraTrigger</a><br />
        <a href="Prism.aspx">Prism</a><br />
        Fan（已过时）<br />
        <a href="Button.aspx">Button</a><br />
        <a href="ButtonSequence.aspx">ButtonSequence</a><br />
        <a href="OtherCube.aspx">OtherCube</a><br />
        <a href="DarkCube.aspx">DarkCube</a><br />
        <a href="Resizer.aspx">ResizerGrow &amp; ResizerShrink</a><br />
        MiniBlock（已过时）
    </div>
</asp:Content>