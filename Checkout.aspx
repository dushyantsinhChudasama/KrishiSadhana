<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="KrishiSadhana.assets.css.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    

    <!-- Main content -->

    <div class="order-history">
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
    </div>
    


</asp:Content>

