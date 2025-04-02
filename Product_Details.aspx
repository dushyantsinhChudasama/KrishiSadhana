<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="KrishiSadhana.Product_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
        }
        .auto-style2 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- Product details -->

    <div class="product-container bg-light">
        <div class="product-left">
            <%--<img src="assets/Images/pro-img.png" class="main-image mt-2" alt="Product Image">--%>
            <asp:Image ID="mainIamge" ImageUrl="assets/Images/pro-img.png" CssClass="main-image mt-2" runat="server" />
            <div class="thumbnail-container">
                <img src="assets/Images/Main-product-image.png" class="thumbnail" alt="Thumbnail 1">
                <img src="assets/Images/Main-product-image.png" class="thumbnail" alt="Thumbnail 2">
                <img src="assets/Images/Main-product-image.png" class="thumbnail" alt="Thumbnail 3">
            </div>
        </div>
        <div class="product-right">
            <h2 class="product-name">
                
                <asp:Label ID="lblProName" runat="server" Text="Label Name" CssClass="auto-style1"></asp:Label>

            </h2>
            <p >
                
                <asp:Label ID="lblCategory" CssClass="farmer-name" runat="server" Text="Label Origin"></asp:Label>

            </p>
            <p class="product-price">Price 
                
                :&nbsp; 
                
                <span class="current-price">
                    <asp:Label ID="lblSell_Price" runat="server" Text="Label ₹213 / kg"></asp:Label>

                </span> 
                <span class="original-price">
                    <asp:Label ID="lblOri_Prcie" runat="server" Text="Label ₹310"></asp:Label>

                </span>
                <span class="discount">
                    <asp:Label ID="lblDiscount" runat="server" Text="Label 30% Off"></asp:Label>

                </span>
                <br />
                <br />
                <br />
                 <span class="">
                    <img src="assets/Images/Location.png" style="height: 25px;">
                     <asp:Label ID="lblOrigin" runat="server" Text="Origin"></asp:Label>
                </span>
                 <br />
                <br />
                <br />
                  <span class="">
                        <asp:Label ID="Label1" runat="server" Text="Quantity"></asp:Label>
                        <br />
                      <asp:TextBox ID="txtQuantity" runat="server" CssClass="auto-style2" Width="117px"></asp:TextBox>
                </span>
            </p>
            <p class="product-price">&nbsp;</p>
            <div class="buttons">
                <%--<button class="add-to-cart">Add To Cart</button>--%>
                <asp:Button ID="Button1" CssClass="add-to-cart" runat="server" Text="Add To Cart" OnClick="Button1_Click" />
                <%--<button class="buy-now">Buy Now</button>--%>
                <asp:Button ID="Button2" CssClass="buy-now" runat="server" Text="Buy Now" />
            </div>
        </div>
    </div>
    
    <div class="product-description">
        <h3>Product Description</h3>
        <pre>
        <asp:Label ID="lblDesc" runat="server" Text="Label Description."></asp:Label>
            
        </pre>
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


