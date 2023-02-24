<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoggedOut.aspx.cs" Inherits="FYP_ResourceManagement.LoggedOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/css/login.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image runat="server" ID="Image1" CssClass="img_Logo" ImageUrl="~/img/NeoDyne-Logo.png" />
            <asp:Table ID="tbl_Login" runat="server" CssClass="ts_Login">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label ID="lbl_LoginHeader" runat="server" Text="Session Expired" CssClass="logOut_Header"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label runat="server" ID="lbl_LoggedOut" Text="User has been logged out. Please redirect to login page to sign in." CssClass="loggedOut" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableFooterRow HorizontalAlign="Center">
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="Login Here" CssClass="shading" />
                    </asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
