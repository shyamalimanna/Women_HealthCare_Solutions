<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="GenUser_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .home-container {
            height: 100vh;
            background-image: url('../Picture/image.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .search-box {
            width: 103%;
            max-width: 700px;
        height: 375px;
    }

        .search-box input[type="search"] {
            font-size: 18px;
            padding: 15px;
            width: 100%;
            border: 2px solid #ccc;
            border-radius: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-container">
        <div class="search-box">
        </div>
    </div>
</asp:Content>
