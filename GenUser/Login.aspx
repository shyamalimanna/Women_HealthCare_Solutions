<%@ Page Title="Login" Language="C#" MasterPageFile="~/GenUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="GenUser_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
