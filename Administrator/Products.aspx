<%@ Page Language="C#" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="KrishiSadhana.Administrator.Products" %>

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
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <h3 class="mb-4" style="font-weight: 500;">All Products</h3>
                            <h3 class="mb-4" style="font-weight: 500;">

                                <%-- This is to show admin name in right corner --%>
                                <asp:Label ID="lblAdminName" runat="server" Text="AdminName"></asp:Label></h3>
                        </div>
                        <div class="card border-0 shadow mb-4" style="width: 1200px; height: 490px; left: 0px; top: 0px;">
                            <div>
                                <div class="d-flex justify-content-end mb-4 mt-4 me-3">
                                    <button type="button" class="btn btn-dark shadow-none btn-sm" data-bs-toggle="modal" data-bs-target="#crudModal">
                                        <i class="bi bi-plus-square"></i>Add
                                    </button>
                                </div>

                                <%-- Adding Grid View --%>
                                <div style="width: 1150px; height: 380px; overflow: auto; border: 1px solid silver; margin: 20px; margin-bottom: 10px;">

                                    <asp:GridView ID="ProductGrid" CellPadding="10" runat="server" AutoGenerateColumns="False" Height="460px" Width="1130px" BorderColor="Silver"
                                        BorderWidth="1px" GridLines="Horizontal" CssClass="gridViewStyle" OnRowCommand="ProductGrid_RowCommand" PageSize="500" EnableViewState="true" OnSelectedIndexChanged="ProductGrid_SelectedIndexChanged">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" Height="59px" ImageUrl='<%# ResolveUrl("~/Images/Product_Images/" + Eval("Image").ToString().Split("/"[0]).Last()) %>' Width="66px" />

                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Category">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Ori_Pri">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Ori_Price") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sell_pri">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Sell_Price") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Disc">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Discount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Current_Qty">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Current_Qty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Origin">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Origin") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Slug">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Slug") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="DateAdd">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("DateAdded") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="UpdatedAt">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("LastUpdated") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt" Height="37px" ImageUrl="~/assets/Images/editIcon.png" Width="38px" />
                                                    &nbsp;&nbsp;
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt" Height="37px" ImageUrl="~/assets/Images/deleteIcon.png" Width="38px" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                            </asp:TemplateField>



                                        </Columns>
                                    </asp:GridView>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Modal Section -->
            <!-- Modal Section -->
            <div class="modal fade" id="crudModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel">Add New Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <!-- Form Fields -->
                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter name" runat="server" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="drpCategory" CssClass="form-control" runat="server" OnSelectedIndexChanged="drpCategory_SelectedIndexChanged">
                                                    <asp:ListItem>-- Select Category --</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtQty" CssClass="form-control" Placeholder="Enter Total Quantity" runat="server" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtOrigin" CssClass="form-control" Placeholder="Enter Product Origin" runat="server" />
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtOriPrice" CssClass="form-control" AutoPostBack="true" Placeholder="Enter Original Price" runat="server" OnTextChanged="txtOriPrice_TextChanged" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtSellprice" CssClass="form-control" AutoPostBack="true" Placeholder="Enter Selling Price" runat="server" OnTextChanged="txtSellprice_TextChanged" />
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="Label8" runat="server" Text="Total Discount:" />
                                                <asp:TextBox ID="txtDiscount" CssClass="form-control" Enabled="false" runat="server" />
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtSlug" CssClass="form-control" Placeholder="Enter Product Slug" runat="server" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtDesc" CssClass="form-control" Placeholder="Enter Product Description" runat="server" />
                                            </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- Save and Close Buttons with PostBackTrigger -->
                                <div class="modal-footer">
                                    <asp:Button ID="btnSave" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" runat="server" />
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnSave" />
                            </Triggers>
                        </asp:UpdatePanel>
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
