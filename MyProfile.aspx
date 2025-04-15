<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="KrishiSadhana.MyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Home</title>
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                    <link rel="stylesheet" href="assets/css/style.css">
                    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
               
                                    <style>
                    body {
                        
                        font-family: 'Segoe UI', sans-serif;
                        height: 100%;
                    }

                    .container {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-height: 100vh;
                    }

                    .the-content{

                        background-color: #f3f5f7;

                    }
                    .sidebar {
                       width: 250px;
                    background-color: #fff;
                    border-right: 1px solid #ddd;
                    padding: 20px;
                    flex-shrink: 0;
                    }
                    .sidebar a {
                        display: block;
                        color: #000;
                        padding: 10px 15px;
                        text-decoration: none;
                        border-radius: 5px;
                        margin-bottom: 5px;
                    }
                    .sidebar a.active, .sidebar a:hover {
                        background-color: #e6f3ff;
                        font-weight: bold;
                    }
                    .main-content {
                         padding: 40px;
                         flex: 1;
                    }
                    .section-title {
                        font-size: 18px;
                        font-weight: bold;
                        margin-bottom: 20px;
                    }
                    .form-section {
                        background: #fff;
                        padding: 25px;
                        border-radius: 10px;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
                        margin-bottom: 30px;
                    }
                    .edit-link {
                        font-size: 14px;
                        margin-left: 10px;
                        color: #007bff;
                        cursor: pointer;
                    }
                    .form-label {
                        font-weight: 500;
                    }
                    .user-icon {
                        width: 70px;
                        height: 70px;
                        margin: auto;
                    }
                    .sidebar p {
                        font-size: 14px;
                        margin-bottom: 0;
                    }
                </style>
                    
                </head>
                <body>
                    <!-- Header top bar -->
                    <div class="container-fluid p-0">
                        <div class="top-bar">
                            <div class="d-flex justify-content-end align-items-center p-0">
                                <a href="#" class="text-white">Bulk order inquiries | </a><a href="tel:180030002312" class="call-order">Missed call to order: 1800-3000-2312</a>
                            </div>
                        </div>
                    </div>

                    <!-- header -->
                    <header class="main-header">
                        <div class="container-fluid d-flex justify-content-between align-items-center">
                            <a href="Home.aspx">
                            <img src="assets/Images/Logo.png" style="width: 160px; height: 70px;" alt="KrishiSadhana"></a>
                            <div class="search-bar col-md-4">
                                <input type="text" placeholder="Search..." class="form-control search-bar">
                                <button class="search-btn-top">
                                    <img src="assets/Images/Search.png" width="25px" alt="">
                                </button>
                            </div>
                             <div class="header-icons">
                    <div class="">
                    </div>
                    <a href="Orders.aspx" class="icons text-secondary">
                        <img src="assets/Images/Truck.png" alt=""
                            style="margin-bottom: 15px; height: 30px;" class="icons">
                        Track order</a>

                    <a href="Login.aspx" class="icons text-secondary">
                        <img src="assets/Images/User Locked.png" alt=""
                            style="margin-bottom: 15px; height: 30px;">
                        <asp:Label ID="lblName" runat="server" Text="Login"></asp:Label></a> 
                    
                    <a href="MyProfile.aspx" class="icons text-secondary">
                           
                            <asp:Label ID="lblProfile" runat="server"> <img src="assets/Images/userProfile.png" alt="" style="margin-bottom: 7px; height: 30px;">  My Profile  </asp:Label></a>

                    
                    <a href="Cart.aspx" class="icons text-secondary">
                            <img src="assets/Images/Shopping Trolley.png" alt=""
                                style="margin-bottom: 7px; height: 25px;">
                            Cart</a>

                     <a href="Logout.aspx" class="icons text-secondary">
                            
                            <asp:Label ID="lblLogout" runat="server"><img src="assets/Images/logout.png" alt="" style="margin-bottom: 7px; height: 25px;">  Log Out  </asp:Label>

                     </a>
                </div>
                        </div>
                </div>

                    </header>

    <!-- Navbar -->

                    <nav class="navbar text-secondary mb-2">
                        <div class="container-fluid d-flex align-items-center justify-content-between nav">
                            <a href="Home.aspx" class="a-navbar">Home</a> <a href="Crops.aspx" class="a-navbar">Crops</a> <a href="Fruits.aspx" class="a-navbar">Fruits</a> <a href="Vegeatbles.aspx" class="a-navbar">Vegetables</a> <a href="DryFruits.aspx" class="a-navbar">Dry Fruits</a> <a href="Seeds.aspx" class="a-navbar">Seeds</a> <a href="Rental.aspx" class="a-navbar">Vehicles & Rental</a> <a href="Consultation.aspx" class="a-navbar">Consultation</a> <a href="Weather.aspx" class="a-navbar">Weather</a> <a href="About.aspx" class="a-navbar">About us</a> <a href="Contact.aspx" class="a-navbar">Contact us</a>
                        </div>
                    </nav>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">


    <div class="container d-flex">
        <div class="p-4 the-content mx-auto" style="max-width:2000px">

            <div class="d-flex">
                <!-- Sidebar -->
                <div class="sidebar">
                    <div class="text-center mb-4">
                        <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" class="rounded-circle user-icon" alt="User Icon">
                        <p class="mt-2">Hello,</p>
                        <strong>
                            
                            <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>

                        </strong>
                    </div>

                    <a href="MyProfile.aspx" class="ms-2 active">Profile Information</a>
                    <a href="MyOrders.aspx" class="">MY ORDERS</a>
                    <a href="MyVehicleBookings.aspx" class="">vehicle Bookings</a>
                    <a href="MyConsultations.aspx" class="">My Consultations</a>
                    <a href="ChangePassword.aspx" class="">Change Password</a>
                    
                </div>

                <!-- Main Content -->
                <div class="main-content w-100">
                    <!-- Personal Info -->
                    <div class="form-section">
                        <div class="section-title">
                            Personal Information
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" class="form-control" Text="Full name"></asp:TextBox>
                            </div>
                            
                            <div class="col-md-12">
                                <label class="form-label">Your Gender</label><br>
                                <asp:RadioButtonList ID="rbGender" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                            <asp:Button ID="btnUpdateNameEmailGender" CssClass="search-btn m-1" runat="server" Text="Update" OnClick="btnUpdateNameEmailGender_Click" />

                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-section">
                        <div class="section-title">
                            Email Address
                        </div>
                        <asp:TextBox ID="txtEmali" CssClass="form-control" runat="server" Text="Email Here"></asp:TextBox>
                    
                        <asp:Button ID="btnUpdateEmail" CssClass="search-btn mt-3" runat="server" Text="Update" OnClick="btnUpdateEmail_Click" />
                    
                    </div>

                    <!-- Mobile -->
                    <div class="form-section">
                        <div class="section-title">
                            Mobile Number
                        </div>
                        <asp:TextBox ID="txtMobile" class="form-control" runat="server" Text="Mobile number"></asp:TextBox>
                    
                        <asp:Button ID="btnUpdateMobile" CssClass="search-btn mt-3" runat="server" Text="Update" OnClick="btnUpdateMobile_Click" />

                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>


