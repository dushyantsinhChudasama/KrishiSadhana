<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="KrishiSadhana.Administrator.Orders" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
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

    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CrystalReport1.rpt">
        </Report>
    </CR:CrystalReportSource>

    <!-- Top bar -->
    <!-- Header Section -->
    <div class="header">
        <h3>DC Hotels</h3>
        <button class="btn btn-sm logout-btn">LOG OUT</button>
    </div>


    <!-- Starting sidebar -->
    <!-- Main Layout -->
    <div class="d-flex">
        <!-- Sidebar Section -->
        <div class="sidebar d-flex flex-column p-3">
            <h4 class="mb-4 text-light">ADMIN PANEL</h4>


            <a href="Dashboard.aspx">Dashboard</a>
            <a href="Categoreis.aspx">Categoreis</a>
            <a href="Products.aspx">Products</a>
            <a href="Orders.aspx" class="active">Orders</a>
            <a href="Vehicles_Orders.aspx">Vehicles Orders</a>
            <a href="Doctors.aspx">Doctors</a>
            <a href="User_Queries.aspx">User Queries</a>
            <a href="Vehicles.aspx">Vehicles</a>
            <a href="Users.aspx">Users</a>
            <a href="AllAdmins.aspx">Admins</a>


        </div>

        <!-- Content Section -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 ms-auto p-4 overflow-hidden">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h3 class="mb-4" style="font-weight: 500;">All Products</h3>
                        <h3 class="mb-4" style="font-weight: 500;">

                            <%-- This is to show admin name in right corner --%>
                            <asp:Label ID="lblAdminName" runat="server" Text="AdminName"></asp:Label></h3>
                    </div>
                    <form id="form1" runat="server">
                    <div class="card border-0 shadow mb-4" style="width: 1200px; height: 490px; left: 0px; top: 0px;">
                        <div>
                            
                                <div class="d-flex justify-content-end mb-4 mt-4 me-3">
                                     
                                    <asp:Button ID="Button1" class="btn btn-dark shadow-none btn-sm" runat="server" Text="Generate Report" OnClick="Button1_Click" />
                                </div>


                            <%-- Adding Grid View --%>
                            <div style="width: 1150px; height: 380px; overflow: auto; border: 1px solid silver; margin: 20px; margin-bottom: 10px;">

                                 <asp:GridView ID="OrdersGrid" runat="server" AutoGenerateColumns="False" Height="201px" Width="1148px" BorderColor="Silver"
                            BorderWidth="1px" GridLines="Horizontal" CssClass="gridViewStyle" CellPadding="10">
                            <Columns>
                                <asp:TemplateField HeaderText="Order ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Order_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Order Date">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# "₹ " + Eval("TotalAmount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total Items">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("TotalItems") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Payment Mode">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("PaymentMode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Deliver To">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("DeliverTo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="View">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlView" runat="server" Text="View Details"
                                            NavigateUrl='<%# "OrderDetails.aspx?orderId=" + Eval("Order_Id") %>' CssClass="btn btn-sm btn-primary" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="sticky-header" BackColor="#212529" ForeColor="White"
                                        HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                            </div>

                        </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>



    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
