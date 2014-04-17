<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Globalization" %>
<%
    string path;
    try
    {
        path = RouteData.GetRequiredString("Path");
    }
    catch
    {
        path = null;
    }
    path = path ?? string.Empty;
    Response.Redirect("http://mygod.tk/" +
        (path.StartsWith("Online", true, CultureInfo.InvariantCulture) ? string.Empty : "product/"));
%>