<%@ Page Title="安装.NET Framework 4.0 Client Profile - Mygod 产品专卖店™" Language="C#" MasterPageFile="~/Site.Master"
         AutoEventWireup="true" CodeBehind="InstallDotNetFx40Client.aspx.cs" 
         Inherits="Mygod.Website.ProductStore.PublicInstallDotNetFx40Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2>
        安装.NET Framework 4.0 Client Profile</h2>
    <h3>
        方法一：使用Windows Update直接安装</h3>
    <h4>
        Windows XP</h4>
    <p>
        1.&nbsp; 控制面板 - 自动更新 - Windows Update网站。<br />
        2.&nbsp; 选择自定义。<br />
        3.&nbsp; 在可选更新中找到.NET Framework 4.0 Client Profile，选中并安装。</p>
    <h4>
        Windows Vista/Windows 7</h4>
    <p>
        1.&nbsp; 控制面板 - 系统和安全 - Windows Update。<br />
        2.&nbsp; 检查更新并选中推荐更新中的.NET Framework 4.0 Client Profile。<br />
        3.&nbsp; 点击安装。</p>
    <h4>
        Windows 8</h4>
    <p>
        太好啦！你的系统自带更新的.NET Framework 4.5，你无需安装！！！</p>
    <h3>
        方法二：手动从微软下载安装</h3>
    <h4>
        安装前的准备</h4>
    <p>
        如果您还没有安装Windows Installer（通常是Windows自带的），请您安装<a 
            href="http://go.microsoft.com/fwlink/?LinkId=49256">Windows Installer（32位）</a>。<br />
        安装前请您阅读<a href="http://go.microsoft.com/fwlink/?LinkID=66406">许可条约</a>（切，谁要阅读啊）。</p>
    <h4>
        下载并安装</h4>
    <p>
        <a href="http://go.microsoft.com/fwlink/?linkid=182804">下载地址1</a>
        <a href="http://go.microsoft.com/fwlink/?linkid=164196&amp;clcid=0x804">下载地址2</a><br />
        不能联网，要脱机安装？试试<a 
            href="http://www.microsoft.com/downloads/zh-cn/details.aspx?displaylang=zh-cn&amp;FamilyID=e5ad0459-cbcc-4b4f-97b6-fb17111cf544">下载地址3</a></p>
    <h4>可能遇到的问题</h4>
    <p>
        　　Windows XP SP2或Windows Server 2003的用户如果遇到“必须安装 32 位 Windows 映像处理组件(WIC)”的提示信息，请点击<a href="http://pan.baidu.com/share/link?shareid=288646&uk=3104462449">这里</a>安装WIC（32位）后再试。</p>
</asp:Content>
