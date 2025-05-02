<%@ Page Title="" Language="C#" MasterPageFile="~/GenUser/MasterPage.master" AutoEventWireup="true" CodeFile="patientReg.aspx.cs" Inherits="GenUser_patientReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding: 40px; width: 600px; margin: auto; background-color: #f5f5f5;">
        <h2 style="text-align: center;">Patient Registration</h2>
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label><br />
        <asp:TextBox ID="txtName" runat="server" Width="100%" /><br /><br />

        <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label><br />
        <asp:TextBox ID="txtAddress" runat="server" Width="100%" /><br /><br />

        <asp:Label ID="Label3" runat="server" Text="Contact No"></asp:Label><br />
        <asp:TextBox ID="txtContact" runat="server" TextMode="Number" Width="100%" /><br /><br />

        <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label><br />
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="100%" /><br /><br />

        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    </div>
</asp:Content>
