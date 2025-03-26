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
            <asp:TextBox ID="txtType" runat="server" placeholder="Enter Type" />

            <asp:TextBox ID="txtCity" runat="server" placeholder="Enter City" />

            <asp:TextBox ID="txtState" runat="server" placeholder="Enter State" />

            <asp:Button ID="btnSearch" CssClass="search-btn" runat="server" Text="Button" />
        </div>

        <asp:DataList ID="dlDoctors" runat="server" Width="830">
            <ItemTemplate>
                <div class="vehicle-card">

                    <span class="wishlist-icon"></span>
                    <img src='<%# Eval("Image") %>' alt="Vehicle Image" class="vehicle-img">
                    <div class="vehicle-info">
                        <h3 class="vehicle-name"><%# Eval("Name") %></h3>
                        <p class="farmer-name"><%# Eval("Current_experience") %>+ Years exp.</p>
                        <p class="vehicle-details">
                            <img src="assets/Images/Porduct-rent.png" alt="₹" style="height: 20px; width: 30px;">
                            <%# Eval("Specialization") %>
                        </p>
                        <p class="vehicle-price">
                            <img src="assets/Images/Rupee.png" alt="₹" style="height: 30px; width: 30px;">
                            <%# Eval("Study") %>/day
                        </p>
                        <p class="vehicle-location">
                            <img src="assets/Images/Location.png" alt="Location" style="height: 30px; width: 30px;">
                            <%# Eval("City") %>, <%# Eval("State") %>
                        </p>
                    </div>
                    <asp:Button ID="btnBook" runat="server" CssClass="book-btn" Text="Ask a Question" CommandArgument='<%# Eval("Id") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>

    </div>

</asp:Content>

