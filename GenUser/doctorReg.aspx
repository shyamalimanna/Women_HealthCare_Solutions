<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="doctorReg.aspx.cs" Inherits="GenUser_doctorReg" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background-image: url('../Picture/DoctorReg2.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            height: 600px; /* Increased height to accommodate password field */
            margin: 100px auto;
            border-radius: 10px;
            width: 50%;
        }

        .title {
            font-size: 20pt;
            font-style: italic;
            background-color: aqua;
            display: inline-block;
            margin-bottom: 30px;
            text-align: center;
            padding: 5px;
            width: 100%;
        }

        .form-label {
            font-size: 15pt;
            display: inline-block;
            width: 120px;
            margin-bottom: 5px;
        }

        .form-input {
            font-size: 15pt;
            height: 33px;
            width: 286px;
            margin-bottom: 15px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-group {
            margin-top: 15px;
        }

        .form-group input[type="file"] {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            font-size: 15pt;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <asp:Label ID="Label6" runat="server" CssClass="title" Text="Doctor Registration Form"></asp:Label>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" CssClass="form-label" Text="Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" CssClass="form-label" Text="Address"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label9" runat="server" CssClass="form-label" Text="Contact No"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label10" runat="server" CssClass="form-label" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label11" runat="server" CssClass="form-label" Text="License"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-input" />
        </div>

        <!-- Added password field -->
        <div class="form-group">
            <asp:Label ID="Label12" runat="server" CssClass="form-label" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-input" /><br />
        </div>

        <div class="form-group">
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="form-input" OnClick="btnRegister_Click" Height="49px" />
        </div>
    </div>
</asp:Content>
