<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="KrishiSadhana.assets.css.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- Main cart content -->

    <div class="cart-container">
        <h2 class="mb-4">Your Cart</h2>
        <div class="cart-table">
            <div class="cart-header">
                <span style="margin-right: 100px;">Item</span>
                <span style="margin-right: 100px; margin-left: 310px;">Qty</span>
                <span style="margin-right: 100px; margin-left: 20px;">Price</span>
                <span style="margin-right: 1000px;">Total</span>
            </div>
    
            <div class="cart-item">
                <div class="item-details">
                    <img src="assets/Images/Main-product-image.png" style="height: 150px; width: 150px; margin-right: 30px;" alt="Product Image">
                    <div class="product-info">
                        <p class="product-name">Product Name</p>
                        <p class="farmer-name">Farmer name</p>
                    </div>
                </div>
    
                <div class="quantity">
                    <button class="qty-btn minus">-</button>
                    <input type="text" value="3" class="qty-input">
                    <button class="qty-btn plus">+</button>
                </div>
    
                <span class="price">₹84.00</span>
                <span class="total">₹252.00</span>
                <button class="delete-btn"><img src="assets/Images/Remove.png" alt=""></button>
            </div>

            <div class="cart-item">
                <div class="item-details">
                    <img src="assets/Images/Main-product-image.png" style="height: 150px; width: 150px; margin-right: 30px;" alt="Product Image">
                    <div class="product-info">
                        <p class="product-name">Product Name</p>
                        <p class="farmer-name">Farmer name</p>
                    </div>
                </div>
    
                <div class="quantity">
                    <button class="qty-btn minus">-</button>
                    <input type="text" value="3" class="qty-input">
                    <button class="qty-btn plus">+</button>
                </div>
                
    
                <span class="price">₹84.00</span>
                <span class="total">₹252.00</span>
                <button class="delete-btn"><img src="assets/Images/Remove.png" alt=""></button>
            </div>

            <div class="cart-item">
                <div class="item-details">
                    <img src="assets/Images/Main-product-image.png" style="height: 150px; width: 150px; margin-right: 30px;" alt="Product Image">
                    <div class="product-info">
                        <p class="product-name">Product Name</p>
                        <p class="farmer-name">Farmer name</p>
                    </div>
                </div>
    
                 <div class="quantity">
                    <button class="qty-btn minus">-</button>
                    <input type="text" value="3" class="qty-input">
                    <button class="qty-btn plus">+</button>
                </div>
    
                <span class="price">₹84.00</span>
                <span class="total">₹252.00</span>
                <button class="delete-btn"><img src="assets/Images/Remove.png" alt=""></button>
            </div>
        </div>
    
        <div class="cart-footer">
            <span>Grand Total : ₹252.00</span>
            <button class="proceed-btn">Proceed</button>
        </div>
    </div>
    
</asp:Content>

