<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Fruits.aspx.cs" Inherits="KrishiSadhana.Fruits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- linear Banner -->

    <div class="banner mb-4">
        Buy best Quality Fruits online
    </div>

    <!-- Products -->

    <!-- Products -->

    <div class="container-pr d-flex mt-4">

        <%-- Data list for displaying products --%>

            <asp:DataList ID="dataListCrops" runat="server" RepeatColumns="3" CellSpacing="10" OnSelectedIndexChanged="dataListCrops_SelectedIndexChanged">
                <ItemTemplate>
                    <div class="product-card">
                        <span class="discount-badge"><%# Eval("Discount") %> % Off</span>
                        <%-- Add to wishlist code here --%>
                        <span class="wishlist-icon"></span>
                        <img src='<%# Eval("Image") %>' alt="Product Image" class="product-img">
                        <div class="product-name"><%# Eval("Name") %></div>
                        
                        <div class="price-section">
                            <span class="old-price">
                                <img src="assets/Images/Rupee.png" alt="" style="height: 22px;">
                                ₹<%# Eval("Ori_Price") %></span>
                            <span>₹<%# Eval("Sell_Price") %>/ Per kg</span>
                        </div>
                        <div class="location">
                            <img src="assets/Images/Location.png" style="height: 25px;">
                            <%# Eval("Origin") %>
                        </div>
                        <asp:Button ID="btnView" CssClass="view-btn" runat="server" Text="View Product" CommandArgument='<%# Eval("Id") %>' OnClick="btnView_Click" />
                        <asp:Button ID="btnCart" CssClass="cart-btn" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("Id") %>' OnClick="btnCart_Click" />
                    </div>
                </ItemTemplate>
            </asp:DataList>


    </div>

</asp:Content>

