<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HouseRentMS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AdminLogin</title>
     <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="HouseStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <div class="heading">
    <p>House Rental Management System</p>
        </div>
    <form id="form1" runat="server">
        <div class="loginbox">
            <h2>Login Here</h2>

            <asp:Label runat="server" CssClass="lbluser" Text="Username"></asp:Label>
            <asp:TextBox ID="TxtUsername" CssClass="txtuser" runat="server"></asp:TextBox>

            <asp:Label runat="server" CssClass="lblpass" Text="Password"></asp:Label>
            <asp:TextBox ID="TxtPassword" CssClass="txtpass" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Button ID="BtnLogin" runat="server" CssClass="btnsubmit" Text="Submit" OnClick="BtnLogin_Click1" />
        </div>
    </form>
</body>
</html>

