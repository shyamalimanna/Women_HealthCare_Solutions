<%@ Page Title="About Us" Language="VB" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="false" CodeFile="about.aspx.vb" Inherits="GenUser_about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .heading {
            font-size: 20pt;
            font-weight: bold;
            color: white;
            background-color: red;
            padding: 10px;
        }

        .content-text {
            font-size: large;
            line-height: 1.6;
            margin: 20px 0;
            text-align: left;
        }

        .image-container {
            text-align: center;
            margin-top: 20px;
        }

        .image-container img {
            width: 407px;
            height: 237px;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center; padding: 40px;">
        <asp:Label ID="Label6" runat="server" CssClass="heading" Text="About Us"></asp:Label>

        <div class="content-text">
            <strong>HealthCare</strong> is an AI-powered question-answering web application designed to support women by providing accurate, reliable, and accessible information on a wide range of health concerns. Our platform is dedicated to addressing medical issues specific to women, from reproductive health and hormonal disorders to mental wellness and chronic conditions.
        </div>

        <div class="content-text">
            By leveraging a vast database of trusted medical sources and user-provided health histories, EmpowerHer Health delivers personalized and privacy-conscious responses to questions about symptoms, treatments, lifestyle advice, and more. Whether you're looking for general health information or insights based on past medical experiences, our system aims to guide and empower users in making informed health decisions.
        </div>

        <div class="content-text">
            We understand that many women face unique challenges in accessing clear, compassionate, and science-backed healthcare information. EmpowerHer Health is committed to filling this gap by creating a safe and inclusive digital space where questions are welcomed and answers are grounded in expertise.
        </div>

        <div class="image-container">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Picture/images.jpg" />
        </div>
    </div>
</asp:Content>
