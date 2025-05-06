<%@ Page Title="My Questions" Language="C#" MasterPageFile="~/Patients/MasterPage.master" AutoEventWireup="true" CodeFile="MyQuestions.aspx.cs" Inherits="Patients_MyQuestions" %>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    My Answer
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin: 30px auto;
            width: 90%;
            max-width: 800px;
            font-family: Arial;
        }
        .question-box {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        .question-title {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
        }
        .category {
            font-style: italic;
            color: #555;
        }
        .answer {
            margin-top: 10px;
            color: green;
        }
        .no-answer {
            margin-top: 10px;
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>My Submitted Questions Answers</h2>
        <asp:Repeater ID="rptQuestions" runat="server">
            <ItemTemplate>
                <div class="question-box">
                    <div class="question-title">Q: <%# Eval("QuestionText") %></div>
                    <div class="category">Category: <%# Eval("Category") %> | Asked on: <%# Convert.ToDateTime(Eval("AskedDate")).ToString("dd-MMM-yyyy hh:mm tt") %></div>
                    <div class='<%# string.IsNullOrEmpty(Eval("AnswerText").ToString()) ? "no-answer" : "answer" %>'>
                        <%# string.IsNullOrEmpty(Eval("AnswerText").ToString()) ? "Not answered yet." : "Answer: " + Eval("AnswerText") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

