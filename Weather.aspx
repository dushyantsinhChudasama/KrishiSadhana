<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Weather.aspx.cs" Inherits="KrishiSadhana.Weather" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
     <div class="banner mb-4">
        Know your Weather 
    </div>

    <div class="search-bar-vh d-flex justify-content-center align-items-center" style="padding: 20px;">
        <div class="input-group" style="max-width: 450px; width: 100%;">
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City" style="flex: 3;" />
            <div class="input-group-append">
                <asp:Button ID="btnSearch" CssClass="btn btn-primary search-btn no-hover" runat="server" Text="Search" style="flex: 1; max-width: 100px;" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>

    <!-- Weather Display Card -->
    <div class="weather-container">
        <div class="weather-header">Weather Information</div>

        <div class="weather-icon-container">
            <asp:Image ID="imgWeatherIcon" runat="server" CssClass="weather-icon" />
        </div>

        <h4>
            <asp:Label ID="lblCity_Country" runat="server"></asp:Label>
            <asp:Image ID="imgCountryFlag" runat="server" CssClass="country-flag" />
        </h4>

        <p>
            <asp:Label ID="lblDescription" runat="server" CssClass="text-muted"></asp:Label>
        </p>

        <table class="weather-table table table-bordered">
            <tr>
                <th>Humidity</th>
                <th>Min Temp</th>
                <th>Max Temp</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblHumidity" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblTempMin" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblTempMax" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>Day Temp</th>
                <th>Night Temp</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblTempDay" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblTempNight" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>


<style>
    .no-hover:hover {
        background-color: #2E7D32 !important;
    }
</style>




    
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
        .weather-container {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }

        .weather-header {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }

        .search-bar-container {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .weather-table {
            width: 100%;
            margin-top: 15px;
        }

        .weather-table th, .weather-table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .weather-table th {
            background-color: #2E7D32;
            color: white;
        }

        .weather-icon {
            max-width: 80px;
        }

        .country-flag {
            width: 30px;
            margin-left: 5px;
        }

        .no-hover:hover {
            background-color: #2E7D32 !important;
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


