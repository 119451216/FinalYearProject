<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FYP_ResourceManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/css/login.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image runat="server" ID="Image1" CssClass="img_Logo" ImageUrl="~/img/NeoDyne-Logo.png" />
        <div class="div_Login">
            <asp:Login runat="server" ID="login" OnAuthenticate="ValidateUser"></asp:Login>
        </div>
    </form>
</body>
</html>
