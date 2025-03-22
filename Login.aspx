<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KrishiSadhana.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <!-- Login sections -->

    <div class="wrapper bg-light">
        <div class="login-container item-center">
            <h2 style="text-align: center;">Login</h2>
            <asp:TextBox ID="txtEmail" placeholder="Enter email" CssClass="input-field" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPassword" placeholder="Enter password" CssClass="input-field" runat="server"></asp:TextBox>
            <asp:Button ID="btnLogin" CssClass="login-btn" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <p class="register-text">Don't have an account? <a href="Register.aspx">Register</a></p>
             <p class="register-text">Clcik for <a href="Administrator/Login.aspx">Admin Login</a></p>
        </div>
    </div>
    
</asp:Content>

