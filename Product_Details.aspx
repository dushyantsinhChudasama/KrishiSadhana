<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="KrishiSadhana.Product_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- Product details -->

    <div class="product-container bg-light">
        <div class="product-left">
            <img src="assets/Images/pro-img.png" class="main-image mt-2" alt="Product Image">
            <div class="thumbnail-container">
                <img src="assets/Images/Main-product-image.png" class="thumbnail" alt="Thumbnail 1">
                <img src="assets/Images/Main-product-image.png" class="thumbnail" alt="Thumbnail 2">
                <img src="assets/Images/Main-product-image.png" class="thumbnail" alt="Thumbnail 3">
            </div>
        </div>
        <div class="product-right">
            <h2 class="product-name">Product Name</h2>
            <p class="farmer-name">Manu / Farmer Name</p>
            <p class="product-price">Price <span class="current-price">₹213 / kg</span> 
                <span class="original-price">₹310</span>
                <span class="discount">30% Off</span>
            </p>
            <div class="buttons">
                <button class="add-to-cart">Add To Cart</button>
                <button class="buy-now">Buy Now</button>
            </div>
        </div>
    </div>
    
    <div class="product-description">
        <h3>Product Description</h3>
        <pre>
    About Product
    - EM 1 Insecticide is a modern insecticide of Avermectin group.
    - It is a multipurpose world-renowned soluble granular insecticide.
    - It offers protection against a wide range of pests.
    
    EM 1 Insecticide Technical Details
    - Technical Content: Emamectin Benzoate 5% SG
    - Mode of Entry: Contact and Systemic
    - Mode of Action: EM-1 gives effective control of caterpillars by its contact and stomach poison action.
    
    Key Features and Benefits
    - Broad-spectrum insecticide effective against caterpillars.
    - Useful for crops such as cotton, cabbage, cauliflower, chili, etc.
    - Suitable for the Integrated Pest Management (IPM) system.
    - Has a remarkable translaminar action for effective pest control.
        </pre>
    </div>
</asp:Content>

