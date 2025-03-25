<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KrishiSadhana.assets.css.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <!-- linear Banner -->

    <div class="banner">
        Get in touch with us
    </div>

    <!-- Main content -->

    <div class="contact-container">
        <!-- Left Side - Contact Details -->
        <div class="contact-info">
            <div class="info-item">
                <img src="assets/Images/Call.png" alt="" style="height: 50px;">
                <div>
                    <h4>Call us</h4>
                    <p>+91 1234567890</p>
                    <p>Missed call to order: 1800-1222-3322</p>
                </div>
            </div>
    
            <div class="info-item">
                <img src="assets/Images/WhatsApp.png" alt="" style="height: 50px;">
                <div>
                    <h4>Whatsapp</h4>
                    <p>+91 1234567890</p>
                    <p>Missed call to order: 1800-1222-3322</p>
                </div>
            </div>
    
            <div class="info-item">
                <img src="assets/Images/Email (1).png" alt="" style="height: 50px;">
                <div>
                    <h4>Email</h4>
                    <p>+91 1234567890</p>
                    <p>Missed call to order: 1800-1222-3322</p>
                </div>
            </div>
    
            <div class="info-item">
                <img src="assets/Images/Location.png" alt="" style="height: 50px;">
                <div>
                    <h4>Address</h4>
                    <p>RK University,Kasturbadham, Bhavnagar highway, Rajkot, Gujarat - 360020</p>
                
                </div>
            </div>
        </div>
    
        <!-- Right Side - Contact Form -->
        <div class="contact-form">
            <%--<input type="text" placeholder="Name">--%>
            <asp:TextBox ID="txtName" runat="server" placeholder="Name"/>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"/>
            <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone"/>
            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject"/>
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message" TextMode="MultiLine" Rows="5"/>
            
            <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="contact-button"/>
            <!-- Social Media Section -->
            <div class="social-section">
                <h4>Connect With Us</h4>
                <div class="social-icons mt-4">
                    <a href=""><img src="assets/Images/Facebook contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/Instagram contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/YouTube contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/X  contact.png" alt="" style="height: 40px;"></a>
                    <a href=""><img src="assets/Images/LinkedIn contact.png" alt="" style="height: 40px;"></a>
                    

                </div>
            </div>
        </div>
    </div>
    
s
</asp:Content>

