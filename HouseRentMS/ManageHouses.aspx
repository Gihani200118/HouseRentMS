<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHouses.aspx.cs" Inherits="HouseRentMS.ManageHouses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Houses</title>
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

        .btn-custom {
            padding: 10px 20px;
            background-color: #2ecc71;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-custom:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Left: Add/Edit Form -->
                <div class="col-md-4">
                    <div class="form-container">
                        <h4 class="text-primary mb-3">Manage Houses</h4>

                        <asp:HiddenField ID="hfHouseId" runat="server" />

                        <asp:Label runat="server" Text="Title:" />
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control mb-2" />

                        <asp:Label runat="server" Text="Location:" />
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control mb-2" />

                        <asp:Label runat="server" Text="Rent Price:" />
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control mb-2" />

                        <asp:Label runat="server" Text="Description:" />
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mb-3" />

                        <asp:Button ID="btnSave" runat="server" Text="Save House" CssClass="btn-custom" OnClick="btnSave_Click" />
                    </div>
                </div>

                <!-- Right: House List Table -->
                <div class="col-md-8">
                    <div class="table-container">
                        <h4 class="text-success mb-3">Existing Houses</h4>

                        <asp:GridView ID="GridViewHouses" runat="server"
                            AutoGenerateColumns="False"
                            DataKeyNames="Id"
                            OnRowDeleting="GridViewHouses_RowDeleting"
                            OnSelectedIndexChanged="GridViewHouses_SelectedIndexChanged"
                            CssClass="table table-striped table-bordered table-hover">

                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                                <asp:BoundField DataField="Location" HeaderText="Location" />
                                <asp:BoundField DataField="Price" HeaderText="Price" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />

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
