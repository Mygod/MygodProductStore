<%@ Page Title="" Language="C#" AutoEventWireup="true" Inherits="Mygod.Website.ProductStore.Default" %>
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
    Response.Redirect("http://mygodstudio.tk/" +
        (path.StartsWith("Online", true, CultureInfo.InvariantCulture) ? string.Empty : "products/"));
%>