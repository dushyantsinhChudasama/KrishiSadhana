<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Seeds.aspx.cs" Inherits="KrishiSadhana.Seeds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- linear Banner -->

    <div class="banner mb-4">
        Buy best Quality Seeds online
    </div>

    <!-- Products -->

    <!-- Products -->

    <div class="container-pr d-flex mt-4">

        <%-- Data list for displaying products --%>

            <asp:DataList ID="dataListCrops" runat="server" RepeatColumns="5" CellSpacing="10" OnSelectedIndexChanged="dataListCrops_SelectedIndexChanged">
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

                         <div style="text-align: center;">
                            <asp:LinkButton ID="btnView" CssClass="view-btn mb-2 w-100 " runat="server" Text="View Product" CommandArgument='<%# Eval("Id") %>' OnClick="btnView_Click">View Product</asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="btnCart" CssClass="cart-btn w-100" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("Id") %>' OnClick="btnCart_Click">Add to Cart</asp:LinkButton>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:DataList>


    </div>

     <br />
    <br />
    <asp:LinkButton ID="btnPrev" CssClass="prev-btn" runat="server" OnClick="btnPrev_Click">Previous</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnNext" runat="server" CssClass="next-btn" OnClick="btnNext_Click">Next</asp:LinkButton>


</asp:Content>

