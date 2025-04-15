<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="KrishiSadhana.assets.css.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <!-- Main content -->

    <%--    <div class="order-history">
        <div class="order-box">
            <div class="order-header">
                <span class="order-id">Order : <strong>#BH1414011</strong></span>
                <span class="order-date">Order placed on 22-02-2025</span>
                <span class="order-status">Cancelled</span>
            </div>
    
            <div class="order-content">
                <div class="product-details">
                    <img src="product-image.jpg" alt="Product">
                    <div class="product-info">
                        <strong>Indofil M-45 Fungicide - 500 gms</strong><br>
                        <span><b>Vendor:</b> Indofil</span><br>
                        <span><b>Varient:</b> 500 gms</span><br>
                        <span><b>Quantity:</b> 1</span>
                    </div>
                </div>
    
                <div class="total-price">
                    <span>Total</span>
                    <strong>₹0.00</strong>
                </div>
            </div>
    
            <hr>
    
            <button class="order-details-btn">
                <i class="fa fa-file-alt"></i> View Order Details
            </button>
        </div>
    </div>--%>



    <div class="checkout-container">
        <div class="payment-section">
            <h4>Select Payment Method</h4>

            <div class="payment-banners">
                <asp:Image ID="imgBanner" runat="server" ImageUrl="~/assets/Images/Banner3.png" CssClass="banner-img" />
            </div>

            <div class="payment-options">
                <asp:RadioButtonList ID="rblPaymentMethod" AutoPostBack="true" runat="server" CssClass="payment-radio-list" RepeatLayout="Flow" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged">
                    <asp:ListItem Text="Online&nbsp;<small>(UPI / Cards / Net Banking / BNPL)</small>" Value="Online" Selected="True" />
                    <asp:ListItem Text="Cash On Delivery (COD)" Value="COD" />
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="summary-section">
            <div class="product-box">
                <h5>Your Products</h5>
                <div class="product">
                    <div class="scrollable-grid" style="height: 240px; overflow-y: auto; overflow-x: hidden;">
                        <asp:GridView
                            ID="ProductGrid"
                            runat="server"
                            AutoGenerateColumns="False"
                            Width="462px"
                            GridLines="Horizontal"
                            CssClass="product-grid">

                            <Columns>
                                <asp:TemplateField HeaderText="Item">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="69px" ImageUrl='<%# Eval("Image") %>' Width="77px" Style="padding: 5px;" />
                                    </ItemTemplate>
                                    <ControlStyle Width="158px" />
                                    <HeaderStyle Font-Bold="True" VerticalAlign="Middle" />
                                    <ItemStyle Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Qty">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# "₹" + Eval("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>

            <div class="billing-details">
                <h5>Billing Details</h5>

                <div class="bill-row">
                    <span>Total Price:</span>
                    <div class="amount-box">
                        <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <div class="bill-row">
                    <span>Shipping Charges:</span>
                    <div class="amount-box">
                        <asp:Label ID="lblShippingIcon" runat="server" Text="&#8377;" CssClass="rupee-icon"></asp:Label>
                        <asp:Label ID="lblShipping" runat="server" Text=""></asp:Label>
                    </div>
                </div>


                <hr />

                <div class="bill-row net-price">
                    <span>Net Price:</span>
                    <div class="amount-box">
                        <asp:Label ID="lblNetPriceIcon" runat="server" Text="&#8377;" CssClass="rupee-icon"></asp:Label>
                        <asp:Label ID="lblNetPrice" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <asp:Button ID="btnMakePayment" runat="server" Text="Make Payment" CssClass="btn-make-payment" OnClick="btnMakePayment_Click" />
            </div>

        </div>
    </div>




</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

        <style>
            .payment-radio-list input[type="radio"] {
                margin-right: 10px;
            }

            .payment-radio-list label {
                display: block;
                padding: 15px;
                border-radius: 8px;
                border: 1px solid #ccc;
                font-weight: 600;
                background-color: white; /* 🔄 Changed to white */
                margin-bottom: 10px;
                cursor: pointer;
                transition: border-color 0.3s, box-shadow 0.3s;
            }

            /* Optional: highlight selected option */
            .payment-radio-list input[type="radio"]:checked + label {
                border-color: #007bff;
                box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
            }



            .checkout-container {
                display: flex !important;
                justify-content: space-between !important;
                padding: 20px !important;
                max-width: 90% !important;
                margin: auto !important;
                gap: 30px !important;
                font-family: Arial, sans-serif !important;
            }

            .payment-section {
                flex: 1.2 !important;
            }

            .payment-banners {
                display: flex !important;
                justify-content: space-between !important;
                margin: 20px 0 !important;
                width: 100px;
                width: 100%; /* or set to something like 250px if needed */
                max-width: 700px; /* Optional: controls max width */
            }

                .payment-banners img {
                    width: 100%;
                    height: auto;
                    object-fit: contain;
                    display: block;
                    border-radius: 8px;
                }


            .banner {
                padding: 10px 15px !important;
                background-color: #f8f9fa !important;
                border-radius: 8px !important;
                font-weight: 600 !important;
                font-size: 0.9rem !important;
                border: 1px solid #ccc !important;
            }

            .payment-options {
                display: flex !important;
                flex-direction: column !important;
                gap: 15px !important;
            }

            .payment-option {
                display: flex !important;
                align-items: center !important;
                padding: 15px !important;
                border-radius: 8px !important;
                border: 1px solid #ccc !important;
                font-weight: 600 !important;
                background-color: #f0f0f0 !important;
            }

                .payment-option input {
                    margin-right: 10px !important;
                }

                .payment-option.selected {
                    background-color: #Ffffff !important;
                    color: black !important;
                }

                .payment-option.cod {
                    background-color: #ffffff !important;
                }

            .summary-section {
                flex: 0.8 !important;
            }

            .product-box {
                border: 1px solid #ccc !important;
                padding: 15px !important;
                border-radius: 8px !important;
                margin-bottom: 20px !important;
                height: 300px;
            }

            .product {
                display: flex !important;
                gap: 15px !important;
                align-items: center !important;
            }

                .product img {
                    width: 50px !important;
                    height: 50px !important;
                }

            .checkout-layout {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap; /* so on smaller screens it stacks */
                gap: 20px;
            }

            .left-section {
                flex: 2;
            }

            .right-section {
                flex: 1;
                min-width: 280px; /* prevent it from getting too small */
            }


            .billing-details {
                width: 100%;
                min-width: 250px;
                max-width: 500px;
                padding: 10px 15px;
                box-sizing: border-box;
            }

                .billing-details h5 {
                    margin-bottom: 15px;
                }

            .bill-row {
                display: flex;
                justify-content: space-between;
                margin: 6px 0;
                font-size: 0.95rem;
            }

            .discount {
                color: green !important;
                background-color: transparent !important; /* Remove yellow */
            }

            .net-price {
                font-size: 1.1rem;
                font-weight: bold;
                margin-top: 10px;
            }

            .scrollable-grid {
                height: 270px;
                overflow-y: auto;
                overflow-x: hidden;
            }


            .btn-make-payment {
                width: 100%;
                margin-top: 20px;
                background-color: #28a745;
                color: white;
                border: none;
                padding: 12px;
                font-size: 1rem;
                border-radius: 8px;
                font-weight: 600;
                cursor: pointer;
            }
        </style>

        <%-- Razorpay script --%>

         <!-- ✅ Include jQuery before your script -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            function OpenPaymentWindow(key, amountInSubunits, currency, name, descritpion, imageLogo, orderId, profileName, profileEmail, profileMobile, notes) {
                notes = $.parseJSON(notes);
                var options = {
                    "key": key, // Enter the Key ID generated from the Dashboard
                    "amount": amountInSubunits, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                    "currency": currency,
                    "name": name,
                    "description": descritpion,
                    "image": imageLogo,
                    "order_id": orderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                    "handler": function (response) {
                        window.location.href = "Success.aspx?orderId=" + response.razorpay_order_id +
                            "&paymentId=" + response.razorpay_payment_id +
                            "&signature=" + response.razorpay_signature;
                    },
                    "prefill": {
                        "name": profileName,
                        "email": profileEmail,
                        "contact": profileMobile
                    },
                    "notes": notes,
                    "theme": {
                        "color": "#F37254"
                    }
                };
                var rzp1 = new Razorpay(options);
                rzp1.open();
                rzp1.on('payment.failed', function (response) {
                    console.log(response.error);
                    alert("Oops, something went wrong and payment failed. Please try again later");
                });
            }

        </script>

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


