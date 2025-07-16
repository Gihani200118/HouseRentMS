<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTenants.aspx.cs" Inherits="HouseRentMS.ManageTenants" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Tenants</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    body {
        background-color: #f4f4f4;
        padding: 30px;
    }

    .form-container, .table-container {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px #ccc;
        margin-bottom: 20px;
    }

    .btn_custom {
        padding: 10px 20px;
        background-color: #3498db;
        border: none;
        color: white;
        cursor: pointer;
        border-radius: 5px;
    }

    .btn_custom:hover {
        background-color: #2980b9;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Left: Add Tenants Form -->
                <div class="col-md-4">
        <div class="form-container">
            <h4 class="text-primary mb-3">Add New Tenant</h4>

            <asp:Label runat="server" Text="Full Name:" />
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control mb-2" />

            <asp:Label runat="server" Text="Email:" />
            <asp:TextBox ID="txtEmail" runat="server"  CssClass="form-control mb-2" />

            <asp:Label runat="server" Text="Phone:" />
            <asp:TextBox ID="txtPhone" runat="server"  CssClass="form-control mb-2" />

            <asp:Button ID="btnAddTenant" runat="server" Text="Add Tenant" CssClass="btn_custom" OnClick="btnAddTenant_Click"/>
        </div>
         </div>

                <!-- Right: Tenant List Table -->
                <div class="col-md-8">

        <div class="table-container">
            <h4 class="text-success mb-3">Existing Tenants</h4>

            <asp:GridView ID="GridViewTenants" runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                OnRowDeleting="GridViewTenants_RowDeleting" 
                OnSelectedIndexChanged="GridViewTenants_SelectedIndexChanged" 
                CssClass="table table-striped table-bordered table-hover">

                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select" CssClass="btn btn-sm btn-primary me-2">Edit</asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger"
                                OnClientClick="return confirm('Are you sure you want to delete this house?');">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
      </div>
    </div>
            </div>
  </form>
</body>
</html>
