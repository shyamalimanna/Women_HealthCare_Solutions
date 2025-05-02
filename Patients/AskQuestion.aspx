<%@ Page Title="Ask Question" Language="C#" MasterPageFile="~/GenUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="AskQuestion.aspx.cs" Inherits="Patients_AskQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding: 40px; width: 500px; margin: auto; background-color: #f5f5f5;">
        <h2 style="text-align: center;">Ask a Question</h2>

        <asp:Label ID="lblQuestion" runat="server" Text="Enter your question:"></asp:Label><br />
        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Width="100%" Height="150px"></asp:TextBox><br /><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
    </div>
</asp:Content>
