<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="KrishiSadhana.Address" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Address main content -->

    <div class="address-container">

        <div class="address-box add-new border rounded p-4 shadow-sm">
            <h2>Enter Delivery Details</h2>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtName" class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter full name" runat="server" required/>
                </div>
                <div class="col-md-6">
                    <label for="txtPhone" class="form-label">Phone Number</label>
                    <asp:TextBox ID="txtPhone" CssClass="form-control" Placeholder="Enter phone number" runat="server" required/>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtName" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="Enter your email" runat="server" required/>
                </div>
                <div class="col-md-6">
                    <label for="txtPhone" class="form-label">Note (Optional)</label>
                    <asp:TextBox ID="txtNote" CssClass="form-control" Placeholder="Enter any note" runat="server" />
                </div>
            </div>

            <div class="mb-3">
                <label for="txtAddress" class="form-label">Address</label>
                <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" Rows="3" required Placeholder="Enter your full address" runat="server" />
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtCity" class="form-label">City</label>
                    <asp:TextBox ID="txtCity" CssClass="form-control" Placeholder="Enter city" runat="server" required/>
                </div>
               
                <div class="col-md-6">
                    <label for="txtPincode" class="form-label">Landmark (Optional)</label>
                    <asp:TextBox ID="txtLandmark" CssClass="form-control" Placeholder="Enter nearest landmark" runat="server" />
                </div>

            </div>



            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtCity" class="form-label">State</label>
                    <asp:TextBox ID="txtStates" CssClass="form-control" Placeholder="Enter State" runat="server" required/>
                </div>
                 <div class="col-md-6">
                    <label for="txtPincode" class="form-label">Pincode</label>
                    <asp:TextBox ID="txtPincode" CssClass="form-control" Placeholder="Enter pincode" runat="server" required />
                </div>
            </div>

           <div class="text-end">
                <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount : " CssClass="d-block mb-2 fw-bold fs-2"></asp:Label>
    
                <asp:Button ID="btnProceed" runat="server" Text="Continue to Payment" OnClick="btnProceed_Click" CssClass="btn btn-success px-4" />
            </div>


        </div>

    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder1">
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

                        .address-box {
                            background-color: #f8f9fa !important;
                            border: 1px solid #dee2e6 !important;
                            border-radius: 12px !important;
                            padding: 30px !important;
                            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05) !important;
                            width: 70% !important;
                            margin: 40px auto !important; /* center horizontally and give vertical spacing */
                        }

                        .address-box h4 {
                            font-size: 1.5rem !important;
                            font-weight: 600 !important;
                            margin-bottom: 20px !important;
                            color: #343a40 !important;
                        }

                        .form-label {
                            font-weight: 500 !important;
                            color: #495057 !important;
                            margin-bottom: 6px !important;
                            display: block !important;
                        }

                        .form-control {
                            border-radius: 8px !important;
                            padding: 10px 14px !important;
                            font-size: 1rem !important;
                            border: 1px solid #ced4da !important;
                            transition: border-color 0.2s !important;
                        }

                        .form-control:focus {
                            border-color: #28a745 !important;
                            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25) !important;
                            outline: none !important;
                        }

                        .btn-success {
                            border-radius: 8px !important;
                            font-size: 1rem !important;
                            padding: 10px 20px !important;
                            background-color: #28a745 !important;
                            border: none !important;
                            color: white !important;
                            font-weight: 600 !important;
                            transition: background-color 0.2s !important;
                            text-align:right !important;
                        }

                        .btn-success:hover {
                            background-color: #218838 !important;
                        }

                        .text-end {
                            text-align: right !important;
                            margin-top: 50px !important;
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


