<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="GenUser_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        html, body, .home-container {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .home-container {
    background-image: url('../Picture/Healthcare.png'); /* Ensure correct path */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;

    display: table;
    width: 100%;
    min-height: 100vh; /* Ensures full screen height */
}

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}


        .center-content {
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }

        .search-box {
            width: 90%;
            max-width: 600px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .search-box input[type="search"] {
            font-size: 18px;
            padding: 12px 15px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        /* Change border color when input is focused */
.search-box input[type="search"]:focus {
    border-color: #007b7f;  /* New border color (you can change this to any color you prefer) */
    outline: none;  /* Removes the default outline */
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-container">
        <div class="center-content">
            <div class="search-box">
                <asp:TextBox 
                    ID="TextBox1" 
                    runat="server" 
                    TextMode="Search" 
                    CssClass="form-control" 
                    placeholder="Search for health-related questions...">
                </asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>
