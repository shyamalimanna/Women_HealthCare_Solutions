<%@ Page Title="Login" Language="C#" MasterPageFile="~/GenUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="GenUser_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* Container for the background image */
        .home-container {
            height: 100vh;
            background-image: url('../Picture/login3.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        /* Form container for login fields */
        .login-form {
            width: 100%;
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Styling for heading */
        .login-form h2 {
            text-align: center;
            font-size: 28px;
            color: #007b7f;
            margin-bottom: 20px;
        }

        /* Styling for label */
        .login-form label {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        /* Styling for input fields */
        .login-form input[type="text"],
        .login-form input[type="password"],
        .login-form input[type="email"],
        .login-form select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border 0.3s ease-in-out;
        }

        /* Focus effect on input fields */
        .login-form input:focus,
        .login-form select:focus {
            border-color: #007b7f;
            outline: none;
        }

        /* Styling for dropdown */
        .login-form select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-color: #fff;
            background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"%3E%3Cpath fill="none" d="M0 0h20v20H0z"/%3E%3Cpath d="M5 7h10l-5 6z" fill="%23aaa"/%3E%3C/svg%3E');
            background-position: right 10px center;
            background-repeat: no-repeat;
            padding-right: 30px;
        }

        /* Styling for login button */
        .login-form button {
            background-color: #007b7f;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-form button:hover {
            background-color: #005f5f;
        }

        /* Message label styling */
        .login-form .message {
            text-align: center;
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-container">
        <div class="login-form">
            <h2>Login</h2>

            <!-- Role Selection using Dropdown -->
            <div class="input">
                <label for="ddlRole">Login As:</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Doctor">Doctor</asp:ListItem>
                    <asp:ListItem Value="Patient" Selected="True">Patient</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Email Input -->
            <div class="input">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" Width="100%" Height="40px" />
            </div>

            <!-- Password Input -->
            <div class="input">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="100%" Height="40px" />
            </div>

            <!-- Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"
                BackColor="#00FF99" Height="42px" Width="100%" Font-Size="15pt" class="btn" />

            <!-- Message Label for login errors -->
            <div class="message">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            </div>
        </div>
    </div>
</asp:Content>
