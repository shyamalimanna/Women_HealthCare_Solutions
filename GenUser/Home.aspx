<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="GenUser_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        html, body, .home-container {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .home-container {
            background-image: url('../Picture/Healthcare.png');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            display: table;
            width: 100%;
            min-height: 100vh;
        }

        .center-content {
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }

        /* You can remove the .search-box styles if not needed */
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-container">
        <div class="center-content">
            <!-- Content can go here if needed -->
        </div>
    </div>
</asp:Content>
