<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="KrishiSadhana.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- Main content -->

    <div class="order-history">
        <div class="order-box">
            <h2>Order Hishtory</h2>
            <div class="order-header">
                <div class="order-info">
                    <span class="order-id">Order : <strong>#BH1414011</strong></span><br>
                    <span class="order-date">Order placed on 22-02-2025</span>
                </div>
                <span class="order-status">Delivered</span>
            </div>

            <div class="order-content">
                <div class="product-details">
                    <img src="assets/Images/Main-product-image.png" style="height: 150px; width: 150px;" alt="Product">
                    <div class="product-info">
                        <strong>Indofil M-45 Fungicide - 500 gms</strong><br>
                        <span><b>Vendor:</b> Indofil</span><br>
                        <span><b>Varient:</b> 500 gms</span><br>
                        <span><b>Quantity:</b> 1</span>
                    </div>
                </div>

                <div class="total-price">
                    <span>Total</span>
                    <strong>₹100.00</strong>
                </div>
            </div>

            <hr>

            <div class="bill-container">
                <button class="order-details-btn">
                    <i class="fa fa-file-alt"></i> View Order Details
                </button>
            </div>
        </div>
    </div>

</asp:Content>

