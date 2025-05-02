<%@ Page Title="View My Answers" Language="C#" MasterPageFile="~/GenUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="ViewMyAnswers.aspx.cs" Inherits="Patients_ViewMyAnswers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding: 40px; width: 600px; margin: auto; background-color: #f5f5f5;">
        <h2 style="text-align: center;">My Answer</h2>

        <asp:Label ID="lblQuestion" runat="server" Text="Question: " Font-Bold="True"></asp:Label><br />
        <asp:Label ID="lblAnswer" runat="server" Text="Answer: " Font-Bold="True"></asp:Label><br />
        <asp:Label ID="lblAnswerText" runat="server" Text=""></asp:Label><br /><br />

    </div>
</asp:Content>
