<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tester.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Tester" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%=new DirectoryInfo("D:").EnumerateFileSystemInfos().Aggregate(string.Empty, (c, s) => c + s.FullName + "<br />") %>
    </div>
        <div><asp:Button runat="server" ID="CreateGarbager" OnClick="CreateGarbage" Text="Test now" /></div>
    </form>
</body>
</html>
