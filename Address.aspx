<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="KrishiSadhana.Address" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Address main content -->

    <div class="address-container">
        <h2>Select Delivery Address</h2>
    
        <div class="address-boxes">
            <!-- Add New Address Box -->
            <div class="address-box add-new">
                <span class="plus-icon">+</span>
                <p>Add New Address</p>
            </div>
    
            <!-- Existing Address Box 1 (Selected) -->
            <div class="address-box selected">
                <div class="address-header">
                    <span class="check-icon">✔</span>
                    <p class="user-name">John Doe</p>
                </div>
                <div class="address-details">
                    <p>123 Street Name</p>
                    <p>City, State</p>
                    <p>ZIP Code</p>
                    <p>+91 1234567890</p>
                </div>
            </div>
    
            <!-- Existing Address Box 2 -->
            <div class="address-box">
                <div class="address-header">
                    <p class="user-name">Jane Smith</p>
                </div>
                <div class="address-details">
                    <p>456 Avenue Name</p>
                    <p>City, State</p>
                    <p>ZIP Code</p>
                    <p>+91 9876543210</p>
                </div>
            </div>
        </div>
    
        <div class="button-container">
            <button class="proceed-btn">Proceed To Payment</button>
        </div>
    </div>
    
    
</asp:Content>

