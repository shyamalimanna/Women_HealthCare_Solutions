<%@ Page Title="Ask Question" Language="C#" MasterPageFile="MasterPage.master"
    AutoEventWireup="true" CodeFile="AskQuestion.aspx.cs" Inherits="Patients_AskQuestion" %>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Ask Question
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Overall page container */
        .container {
            padding: 40px;
            width: 600px;
            margin: auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-family: Arial, sans-serif;
        }

        label {
            font-size: 14px;
            color: #333;
            font-weight: bold;
        }

        .question-box, .category-dropdown {
            width: 100%;
            margin-bottom: 20px;
        }

        /* Style for TextBox */
        .question-box {
            height: 100px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        /* Style for dropdown */
        .category-dropdown {
            width: 100%;
            height: 200px;
            border-radius: 5px;
            padding: 10px;
            border: 1px solid #ccc;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        /* Style for selected categories */
        .selected-category {
            display: inline-block;
            background-color: #e6f2ff;
            border: 1px solid #99ccff;
            border-radius: 12px;
            padding: 5px 10px;
            margin: 5px;
        }

        /* Style for the submit button */
        .submit-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #45a049;
        }

        /* Message label */
        .message {
            font-weight: bold;
            color: green;
        }

        /* Error message styling */
        .error-message {
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Ask a Question</h2>

        <asp:Label ID="lblQuestion" runat="server" Text="Enter your question:" CssClass="question-label"></asp:Label><br />
        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" CssClass="question-box"></asp:TextBox><br /><br />

        <asp:Label ID="lblCategory" runat="server" Text="Select Categories:" CssClass="question-label"></asp:Label><br />
        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="category-dropdown" Multiple="true"
                          AutoPostBack="true" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
        </asp:DropDownList>

        <br />
        <asp:Label ID="lblSelectedCategories" runat="server" Text="Selected Categories:" Font-Bold="true" /><br />
        <asp:Literal ID="litSelectedCategories" runat="server"></asp:Literal>

        <br /><br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Question" CssClass="submit-button" OnClick="btnSubmit_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
    </div>
</asp:Content>
