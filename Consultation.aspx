<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Consultation.aspx.cs" Inherits="KrishiSadhana.assets.css.Consultation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- linear Banner -->

    <div class="banner mb-4">
        Consultant With Specialist
    </div>

    <div class="container-vh">
        <div class="search-bar-vh">
            <input type="text" placeholder="Enter Type">
            <input type="text" placeholder="Enter State">
            <input type="text" placeholder="Enter City">
            <button class="search-btn">Search</button>
        </div>
    
        <div class="vehicle-card">
            <img src="assets/Images/doctor.png" alt="Vehicle Image" class="vehicle-img">
            <div class="vehicle-info">
                <h3 class="vehicle-name">Doctor Name</h3>
                <p class="farmer-name">10+ Years exp.</p>
                <p class="vehicle-details">
                    <img src="assets/Images/dcotor icon.png" alt="₹"  style="height: 25px; width: 25px; margin-bottom: 5px; margin-right: 13px;"> Wheat, Rice, Cotton
                </p>
                <p class="vehicle-price">
                    <img src="assets/Images/dcotorEducation.png" alt="₹" height="40px" style="height: 30px; width: 30px;"> Ph.D (Agronomy)
                </p>
                <p class="vehicle-location">
                    <img src="assets/Images/Location.png" alt="Location" height="40px" style="height: 30px; width: 30px;"> Rajkot, Gujarat
                </p>
            </div>
            <button class="book-btn">Ask a Question</button>
        </div>
    </div>
    
</asp:Content>

