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
            <input type="text" placeholder="Enter Type">
            <input type="text" placeholder="Enter State">
            <input type="text" placeholder="Enter City">
            <button class="search-btn">Search</button>
        </div>
    
        <div class="vehicle-card">
            <img src="assets/Images/Vehicle.png" alt="Vehicle Image" class="vehicle-img">
            <div class="vehicle-info">
                <h3 class="vehicle-name">Vehicle Name</h3>
                <p class="farmer-name">Farmer name</p>
                <p class="vehicle-details">
                    <img src="assets/Images/Porduct-rent.png" alt="₹"  style="height: 20px; width: 30px;"> Wheat, Rice, Cotton
                </p>
                <p class="vehicle-price">
                    <img src="assets/Images/Rupee.png" alt="₹" height="40px" style="height: 30px; width: 30px;"> 10000/day
                </p>
                <p class="vehicle-location">
                    <img src="assets/Images/Location.png" alt="Location" height="40px" style="height: 30px; width: 30px;"> Rajkot, Gujarat
                </p>
            </div>
            <button class="book-btn">Book Vehicle</button>
        </div>
    </div>
</asp:Content>

