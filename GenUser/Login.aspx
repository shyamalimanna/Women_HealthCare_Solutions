<%@ Page Title="Login" Language="C#" MasterPageFile="~/GenUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="GenUser_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<<<<<<< HEAD
     <style type="text/css">
        .home-container {
            height: 100vh;
            background-image: url('../Picture/health-it.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
                justify-content: center;
            align-items: center;
            
        }
         .input {
             margin: 10px 0;
         }
         .auto-style7 {
             font-size: xx-large;
         }
         .auto-style8 {
             font-size: medium;
         }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-container" style="padding: 40px; width: 90vw; margin: auto; background-color: #f5f5f5; height: 471px;">
        <h2 style="text-align: center;" class="auto-style7">Login</h2>

        <div>
             <asp:Label ID="lblRole" runat="server" Text="Login As:" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButton ID="rbDoctor" runat="server" Text="Doctor" GroupName="Role" Checked="true" CssClass="auto-style8" />
        <asp:RadioButton ID="rbPatient" runat="server" Text="Patient" GroupName="Role" CssClass="auto-style8" />
        </div>

        <div class="input" style="width:30%; height: 70px;">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="txtEmail" runat="server" Width="93%" Height="43px" />
        </div>

        <div class="input" style="width:30%">
            <asp:Label ID="lblPassword" runat="server" Text="Password:" Font-Size="14pt"></asp:Label><br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="94%" Height="40px" />
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" BackColor="#00FF99" Height="42px" Width="83px" Font-Size="15pt" /><br /><br />
=======
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding: 40px; width: 400px; margin: auto; background-color: #f5f5f5;">
        <h2 style="text-align: center;">Login</h2>

        <asp:Label ID="lblRole" runat="server" Text="Login As:"></asp:Label><br />
        <asp:RadioButton ID="rbDoctor" runat="server" Text="Doctor" GroupName="Role" Checked="true" />
        <asp:RadioButton ID="rbPatient" runat="server" Text="Patient" GroupName="Role" /><br /><br />

        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label><br />
        <asp:TextBox ID="txtEmail" runat="server" Width="100%" /><br /><br />

        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label><br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="100%" /><br /><br />

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br /><br />
>>>>>>> 181909b7de07d0ab45e8101fc90f356718706fe5

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
<<<<<<< HEAD

=======
>>>>>>> 181909b7de07d0ab45e8101fc90f356718706fe5
