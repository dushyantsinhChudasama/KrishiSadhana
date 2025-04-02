<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rental.aspx.cs" Inherits="KrishiSadhana.Rental" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!-- linear Banner -->

    <div class="banner mb-4">
        Rent a vehicle Online
    </div>

    <div class="container-vh">
        <div class="search-bar-vh">

            <asp:TextBox ID="txtType" runat="server" placeholder="Enter Type" />

            <asp:TextBox ID="txtCity" runat="server" placeholder="Enter City" />

            <asp:TextBox ID="txtState" runat="server" placeholder="Enter State" />

            <asp:Button ID="btnSearch" CssClass="search-btn" runat="server" Text="Button" />
        </div>

        <asp:DataList ID="dlVehicles" runat="server" Width="830">
            <ItemTemplate>
                <div class="vehicle-card">
                    
                        <span class="wishlist-icon"></span>
                        <img src='<%# Eval("Image") %>' alt="Vehicle Image" class="vehicle-img">
                    <div class="vehicle-info">
                        <h3 class="vehicle-name"><%# Eval("Name") %></h3>
                        <p class="farmer-name"><%# Eval("Company") %></p>
                        <p class="vehicle-details">
                            <img src="assets/Images/Porduct-rent.png" alt="₹" style="height: 20px; width: 30px;">
                            <%# Eval("Product") %>
                        </p>
                        <p class="vehicle-price">
                            <img src="assets/Images/Rupee.png" alt="₹" style="height: 30px; width: 30px;">
                            <%# Eval("Rent_Per_Day") %>/day
                        </p>
                        <p class="vehicle-location">
                            <img src="assets/Images/Location.png" alt="Location" style="height: 30px; width: 30px;">
                            <%# Eval("City") %>, <%# Eval("State") %>
                        </p>
                    </div>
                    <asp:Button ID="btnBook" runat="server" CssClass="book-btn" Text="Book Vehicle" CommandArgument='<%# Eval("Id") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>

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
                        .farmer-name
                        {
                            font-size:15px !important;
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
                        Track order</a> <a href="#" class="icons text-secondary">
                            <img src="assets/Images/Heart.png" alt=""
                                style="margin-bottom: 7px; height: 30px;">
                            Wishlist</a>
                    <a href="Login.aspx" class="icons text-secondary">
                        <img src="assets/Images/User Locked.png" alt=""
                            style="margin-bottom: 15px; height: 30px;">
                        <asp:Label ID="lblName" runat="server" Text="Login"></asp:Label></a> <a href="Cart.aspx" class="icons text-secondary">
                            <img src="assets/Images/Shopping Trolley.png" alt=""
                                style="margin-bottom: 7px; height: 25px;">
                            Cart</a>
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


