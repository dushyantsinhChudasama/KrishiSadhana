<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KrishiSadhana.assets.css.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <!-- linear Banner -->

    <div class="banner">
        Get in touch with us
    </div>

    <!-- Main content -->

    <div class="contact-container">
        <!-- Left Side - Contact Details -->
        <div class="contact-info">
            <div class="info-item">
                <img src="assets/Images/Call.png" alt="" style="height: 50px;">
                <div>
                    <h4>Call us</h4>
                    <p>+91 1234567890</p>
                    <p>Missed call to order: 1800-1222-3322</p>
                </div>
            </div>
    
            <div class="info-item">
                <img src="assets/Images/WhatsApp.png" alt="" style="height: 50px;">
                <div>
                    <h4>Whatsapp</h4>
                    <p>+91 1234567890</p>
                    <p>Missed call to order: 1800-1222-3322</p>
                </div>
            </div>
    
            <div class="info-item">
                <img src="assets/Images/Email (1).png" alt="" style="height: 50px;">
                <div>
                    <h4>Email</h4>
                    <p>+91 1234567890</p>
                    <p>Missed call to order: 1800-1222-3322</p>
                </div>
            </div>
    
            <div class="info-item">
                <img src="assets/Images/Location.png" alt="" style="height: 50px;">
                <div>
                    <h4>Address</h4>
                    <p>RK University,Kasturbadham, Bhavnagar highway, Rajkot, Gujarat - 360020</p>
                
                </div>
            </div>
        </div>
    
        <!-- Right Side - Contact Form -->
        <div class="contact-form">
            <%--<input type="text" placeholder="Name">--%>
            <asp:TextBox ID="txtName" runat="server" placeholder="Name"/>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"/>
            <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone"/>
            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject"/>
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message" TextMode="MultiLine" Rows="5"/>
            
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Messge Label" ForeColor="Red"></asp:Label>
            <br />
            
            <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="contact-button" OnClick="btnSubmit_Click"/>
            <!-- Social Media Section -->
            <div class="social-section">
                <h4>Connect With Us</h4>
                <div class="social-icons mt-4">
                    <a href=""><img src="assets/Images/Facebook contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/Instagram contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/YouTube contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/X  contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/LinkedIn contact.png" alt="" style="height: 40px;"></a>
                    

                </div>
            </div>
        </div>
    </div>
    
s
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


