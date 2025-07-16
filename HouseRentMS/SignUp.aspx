<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HouseRentMS.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserRegister</title>
    <link href="HouseStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <div class="heading">
        <p>House Rental Management System</p>
    </div>
    <form id="form1" runat="server">
        <div class="registerbox">
            <h2>Register</h2>

            <asp:Label runat="server" CssClass="lblfield" Text="Full Name"></asp:Label>
            <asp:TextBox ID="TxtFullName" CssClass="txtfield" runat="server"></asp:TextBox>

            <asp:Label runat="server" CssClass="lblfield" Text="Username"></asp:Label>
            <asp:TextBox ID="TxtUsername" CssClass="txtfield" runat="server"></asp:TextBox>

            <asp:Label runat="server" CssClass="lblfield" Text="Email"></asp:Label>
            <asp:TextBox ID="TxtEmail" CssClass="txtfield" runat="server" TextMode="Email"></asp:TextBox>

            <asp:Label runat="server" CssClass="lblfield" Text="Password"></asp:Label>
            <asp:TextBox ID="TxtPassword" CssClass="txtfield" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Label runat="server" CssClass="lblfield" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="TxtConfirmPassword" CssClass="txtfield" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Button ID="BtnRegister" runat="server" CssClass="btnregsubmit" Text="Register" OnClick="BtnRegister_Click" />

            <asp:Label ID="LblMessage" runat="server" CssClass="success-msg" EnableViewState="false"></asp:Label>
        </div>
    </form>
</body>
</html>
