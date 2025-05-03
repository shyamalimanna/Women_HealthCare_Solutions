<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="patientReg.aspx.cs" Inherits="GenUser_patientReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Body styling for the background image */
        body {
            background-image: url('../Picture/PatientReg2.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        .registration-container {
            padding: 40px;
            width: 600px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24pt;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 14pt;
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-input {
            font-size: 14pt;
            padding: 8px;
            width: 100%;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-input:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn-register {
            width: 100%;
            padding: 10px;
            font-size: 16pt;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-register:hover {
            background-color: #0056b3;
        }

        .form-group {
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="registration-container">
        <h2>Patient Registration</h2>

        <div class="form-group">
            <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-input" /><br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Address"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input" /><br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Contact No"></asp:Label>
            <asp:TextBox ID="txtContact" runat="server" TextMode="Number" CssClass="form-input" /><br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input" /><br />
        </div>

        <!-- New password field -->
        <div class="form-group">
            <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" /><br />
        </div>

      
        <div class="form-group">
            <asp:Button ID="btnRegister" runat="server" CssClass="btn-register" Text="Register" OnClick="btnRegister_Click" />
        </div>
    </div>
</asp:Content>
