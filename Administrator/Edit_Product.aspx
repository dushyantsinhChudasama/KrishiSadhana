<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Product.aspx.cs" Inherits="KrishiSadhana.Administrator.Edit_Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <%-- For modal --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        .sidebar {
            min-width: 230px;
            height: 100vh;
            background-color: #2c3e50;
            color: white;
        }

            .sidebar a {
                text-decoration: none;
                color: #fff;
                padding: 12px;
                display: block;
                border-radius: 5px;
            }

                .sidebar a.active {
                    background-color: #007bff;
                }

                .sidebar a:hover {
                    background-color: rgba(255, 255, 255, 0.1);
                }

        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .header {
            background-color: #2c3e50;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logout-btn {
            background-color: white;
            color: black;
            border-radius: 5px;
            padding: 5px 10px;
            border: none;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #212529;
            color: white;
            padding: 15px 20px;
            font-weight: 600;
            font-size: 24px;
            border-bottom: solid 3px rgb(108 117 125);
        }

        .container-fluid {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #212529;
            color: white;
            height: 100vh;
            padding: 20px 0;
        }

            .sidebar a {
                text-decoration: none;
                color: #fff;
                padding: 12px 20px;
                display: block;
                border-radius: 5px;
            }

                .sidebar a.active {
                    background-color: #007bff;
                }

                .sidebar a:hover {
                    background-color: rgba(255, 255, 255, 0.1);
                }

        .deleteButton {
            background-color: #e53935; /* Red background */
            border-radius: 8px; /* Rounded corners */
            padding: 4px; /* Spacing around the icon */
            border: none;
            width: 37px;
            height: 49px;
            display: inline-flex;
            justify-content: center;
            align-items: center;
        }

            .deleteButton img {
                width: 20px; /* Adjust the icon size */
                height: 20px;
            }

        .gridViewStyle tr {
            border-bottom: 1px solid #ccc; /* Light gray line */
            line-height: 20px;
        }

        .sticky-header {
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .buttons{

        }
    </style>
</head>

<body>

    <form id="form1" runat="server" enctype="multipart/form-data">
        <!-- Script Manager Inside Form -->
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <!-- Header Section -->
        <div class="header d-flex justify-content-between align-items-center">
            <img src="../assets/Images/Logo.png" height="50" width="130" />
            <a class="btn btn-sm logout-btn" href="Logout.aspx">LOG OUT</a>
        </div>

        <!-- Main Layout -->
        <div class="d-flex">
            <div class="sidebar d-flex flex-column p-3">
                <h4 class="mb-4 text-light">ADMIN PANEL</h4>
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="Categoreis.aspx">Categories</a>
                <a href="Products.aspx" class="active">Products</a>
                <a href="Orders.aspx">Orders</a>
                <a href="Vehicles_Orders.aspx">Vehicles Orders</a>
                <a href="Doctors.aspx">Doctors</a>
                <a href="User_Queries.aspx">User Queries</a>
                <a href="Vehicles.aspx">Vehicles</a>
                <a href="Users.aspx">Users</a>
                <a href="AllAdmins.aspx">Admins</a>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 ms-auto p-4 overflow-hidden">
                        <h3 class="mb-4" style="font-weight: 500">Edit Product : <asp:Label runat="server" Text="ProductName"></asp:Label></h3>
                        <div class="card border-0 shadow mb-4" style="width: 1200px; height: 530px; left: 0px; top: 0px;">
                           

                                <%-- Adding Grid View --%>
                                <div style="width: 1150px; height: 540px; overflow: auto; border: 1px solid silver; margin: 20px; margin-bottom: 10px; padding-top:30px; padding-bottom:50px; padding-left:20px; padding-right:20px">

                                    <div class="container">
                                        <!-- Form Fields -->
                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Name</div>
                                                <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter name" runat="server" />
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-1">Category Name</div>
                                                <asp:DropDownList ID="drpCategory" CssClass="form-control" runat="server" OnSelectedIndexChanged="drpCategory_SelectedIndexChanged">
                                                    <asp:ListItem>-- Select Category --</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <%-- second row --%>

                                         <div class="row mb-4">
                                            <div class="col-md-6">
                                        <div class="mb-1">Product Quantity</div>
                                                <asp:TextBox ID="txtQty" CssClass="form-control" Placeholder="Enter Total Quantity" runat="server" />
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Origin</div>
                                                <asp:TextBox ID="txtOrigin" CssClass="form-control" Placeholder="Enter Product Origin" runat="server" />
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Original Price</div>
                                                <asp:TextBox ID="txtOriPrice" CssClass="form-control" AutoPostBack="true" Placeholder="Enter Original Price" runat="server" OnTextChanged="txtOriPrice_TextChanged" />
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Sell Price</div>
                                                <asp:TextBox ID="txtSellprice" CssClass="form-control" AutoPostBack="true" Placeholder="Enter Selling Price" runat="server" OnTextChanged="txtSellprice_TextChanged" />
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Slug</div>
                                                <asp:TextBox ID="txtSlug" CssClass="form-control" Placeholder="Enter Product Slug" runat="server" />

                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Discount</div>
                                                <asp:TextBox ID="txtDiscount" CssClass="form-control" Enabled="false" runat="server" />
                                            </div>

                                            <div class="col-md-12">
                                                <div class="mb-1">Product Description</div>
                                                <asp:TextBox ID="txtDesc" CssClass="form-control" Enabled="false" runat="server" />
                                            </div>
                                        </div>

                                         <div class="row mb-1">
                                            <div class="col-md-6">
                                                <div class="mb-1">Product Image</div>
                                                <asp:Image ID="proImage" runat="server" Height="200px" Width="200px" />
                                            </div>
                                            <div class="col-md-6 mt-4 d-flex align-items-center">
                                                <asp:Button ID="btnUpdate" Text ="Update" CssClass="mx-4 btn btn-success" runat="server" OnClick="btnUpdate_Click"/>
                                                <asp:Button ID="btnCancel" Text ="Calcel" CssClass="mx-4 btn btn-secondary" runat="server" OnClick="btnCancel_Click"/>

                                            </div>
                                        </div>


                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            

        </div>
    </form>

    <!-- jQuery (Make sure this is included) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap 5 Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>

