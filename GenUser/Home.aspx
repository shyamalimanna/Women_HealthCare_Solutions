<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="GenUser_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        

        .search-box {
            width: 60%;
            max-width: 700px;
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
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Search" CssClass="form-control" placeholder="Search for health-related questions..."></asp:TextBox>
        </div>
    </div>
</asp:Content>
