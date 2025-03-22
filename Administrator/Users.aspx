<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="KrishiSadhana.Administrator.Users" %>

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

 <form id="form1" runat="server">
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
                <a href="Categoreis.aspx" >Categories</a>
                <a href="Products.aspx">Products</a>
                <a href="Orders.aspx">Orders</a>
                <a href="Vehicles_Orders.aspx">Vehicles Orders</a>
                <a href="Doctors.aspx">Doctors</a>
                <a href="User_Queries.aspx">User Queries</a>
                <a href="Vehicles.aspx">Vehicles</a>
                <a href="Users.aspx" class="active">Users</a>
                <a href="AllAdmins.aspx">Admins</a>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 ms-auto p-4 overflow-hidden">
                        <h3 class="mb-4" style="font-weight: 500">All Users</h3>

                        <div class="card border-0 shadow mb-4" style="width: 1050px; height: 440px">
                            <div>
                                <div class="d-flex justify-content-end mb-4 mt-4 me-3">
                                    <button type="button" class="btn btn-dark shadow-none btn-sm" data-bs-toggle="modal" data-bs-target="#crudModal">
                                        <i class="bi bi-plus-square"></i> Add
                                    </button>
                                </div>

                                 <%-- Adding Grid View --%>
                               <div style="width: 1000px; height: 340px; overflow: auto; border: 1px solid silver; margin: 20px; margin-bottom: 10px;">

                                    <asp:GridView ID="UserGrid" CellPadding="10"  runat="server" AutoGenerateColumns="False" Height="400px" Width="980px" BorderColor="Silver"
                                        BorderWidth="1px" GridLines="Horizontal" CssClass="gridViewStyle" OnRowCommand="CategoryGrid_RowCommand" PageSize="500">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="600px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="600px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gender">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="600px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Phone">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="600px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="600px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt" ForeColor="Red">Delete
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="600px" />
                                                <ItemStyle Width="200px" />
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
           <div class="modal fade" id="crudModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Add New User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <!-- First Row for Name and Email -->
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter name" runat="server" />
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="Enter Email" runat="server" />
                                </div>
                            </div>

                            <!-- Second Row for Mobile and Gender -->
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtMobile" CssClass="form-control" Placeholder="Enter Mobile" runat="server" />
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal" CssClass="form-check form-check-inline">
                                        <asp:ListItem Text=" Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text=" Female" Value="Female"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>

                            <!-- Third Row for Password and Confirm Password -->
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" Placeholder="Enter Password" TextMode="Password" runat="server" />
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" Placeholder="Enter Confirm Password" TextMode="Password" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" runat="server" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>

        </div>
    </form>
    

 <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>