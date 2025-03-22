<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="KrishiSadhana.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Banner Image -->
    <img src="assets/Images/aboutBanner.png" alt="Banner" class="banner-img">

    <!-- Vision, mission, DNA section -->
    <h2 class="about-h1">Our Vision, Mission, DNA</h2>

    <div class="vision-mission-dna">
        <div class="vmd">
            <div class="content d-flex">
                <div class="line"></div>
                <div class="mission">
                    <div class="v-img">
                        <img src="assets/Images/Mission.png" alt="">
                    </div>
                    <h5 class="title">Mission</h5>
                    <p class="desc-vmd">Trasforming famers future by data, Science and Technology</p>
                </div>
            </div>
        </div>

        <div class="vmd">
            <div class="content d-flex">
                <div class="line"></div>
                <div class="mission">
                    <div class="v-img">
                        <img src="assets/Images/Vision.png" alt="">
                    </div>
                    <h5 class="title">Vision</h5>
                    <p class="desc-vmd"> To Be An Iconic, Global Digital, Agriculture Ecosystem.</p>
                </div>
            </div>
        </div>

        <div class="vmd">
            <div class="content d-flex">
                <div class="line"></div>
                <div class="mission">
                    <div class="v-img">
                        <img src="assets/Images/DNA Helix.png" alt="">
                    </div>
                    <h5 class="title">Mission</h5>
                    <p class="desc-vmd"> Always staying humble and Delivering excellence</p>
                </div>
            </div>
        </div>

    </div>

    <!-- Banner2 -->
    <div class="banner2">
        <img src="assets/Images/aboutBanner2.png" class="banner2">
    </div>
</asp:Content>

