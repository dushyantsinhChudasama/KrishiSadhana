<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Vegeatbles.aspx.cs" Inherits="KrishiSadhana.Vegeatbles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- linear Banner -->

    <div class="banner mb-4">
        Buy best Quality Vegetables online
    </div>

    <!-- Products -->

    <!-- Products -->

    <div class="container-pr d-flex mt-4">

        <%-- Data list for displaying products --%>

            <asp:DataList ID="dataListCrops" runat="server" RepeatColumns="5" CellSpacing="10" OnSelectedIndexChanged="dataListCrops_SelectedIndexChanged" OnItemCommand="dataListCrops_ItemCommand">
                <ItemTemplate>
                    <div class="product-card">
                        <span class="discount-badge"><%# Eval("Discount") %> % Off</span>
                        <%-- Add to wishlist code here --%>
                        <span class="wishlist-icon"></span>
                        <img src='<%# Eval("Image") %>' alt="Product Image" class="product-img">
                        <div class="product-name"><%# Eval("Name") %></div>
                        
                        <div class="price-section">
                            <span class="old-price">
                                <img src="assets/Images/Rupee.png" alt="" style="height: 22px;">
                                ₹<%# Eval("Ori_Price") %></span>
                            <span>₹<%# Eval("Sell_Price") %>/ Per kg</span>
                        </div>
                        <div class="location">
                            <img src="assets/Images/Location.png" style="height: 25px;">
                            <%# Eval("Origin") %>
                        </div>

                        <div style="text-align: center;">
                            <asp:LinkButton ID="btnView" CssClass="view-btn mb-2 w-100 " runat="server" Text="View Product" CommandArgument='<%# Eval("Id") %>' OnClick="btnView_Click" CommandName="cmd_view"></asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="btnCart" CssClass="cart-btn w-100" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("Id") %>' OnClick="btnCart_Click" CommandName="cmd_cart"></asp:LinkButton>
                        </div>

                        </div>
                </ItemTemplate>
            </asp:DataList>


    </div>

     <br />
    <br />
    <asp:LinkButton ID="btnPrev" CssClass="prev-btn" runat="server" OnClick="btnPrev_Click">Previous</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnNext" runat="server" CssClass="next-btn" OnClick="btnNext_Click">Next</asp:LinkButton>

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


