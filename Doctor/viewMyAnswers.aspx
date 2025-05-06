<%@ Page Title="View My Answers" Language="C#" MasterPageFile="~/Doctor/MasterPage.master"
    AutoEventWireup="true" CodeFile="ViewMyAnswers.aspx.cs" Inherits="Doctors_ViewMyAnswers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .answer-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 10px;
        }

        .answer-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 25px;
        }

        .question-label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .question-value {
            margin-bottom: 10px;
            font-size: 15px;
        }

        .answer-box {
            width: 100%;
            min-height: 100px;
            font-size: 14px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
        }

        .submit-btn {
            margin-top: 10px;
            background-color: #007b7f;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .submit-btn:hover {
            background-color: #005f60;
        }

        .message-label {
            font-weight: bold;
            color: green;
            margin-top: 15px;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="answer-container">
        <asp:Repeater ID="rptAnsweredQuestions" runat="server" OnItemCommand="rptAnsweredQuestions_ItemCommand">
            <ItemTemplate>
                <div class="answer-card">
                    <div class="question-label">Question:</div>
                    <div class="question-value"><%# Eval("QuestionText") %></div>

                    <div class="question-label">Category:</div>
                    <div class="question-value"><%# Eval("Category") %></div>

                    <div class="question-label">Answered by:</div>
                    <div class="question-value"><%# Eval("DoctorEmail") %></div>

                    <div class="question-label">Answered on:</div>
                    <div class="question-value"><%# Eval("AnsweredDate", "{0:dd-MMM-yyyy hh:mm tt}") %></div>

                    <!-- Editable Answer -->
                    <div class="question-label">Edit Your Answer:</div>
                    <asp:TextBox ID="txtAnswer" runat="server" CssClass="answer-box" 
                                 TextMode="MultiLine" Text='<%# Eval("AnswerText") %>' />

                    <!-- Update Button -->
                    <asp:Button ID="btnUpdate" runat="server" CommandName="UpdateAnswer" 
                                CommandArgument='<%# Eval("QuestionID") %>' Text="Update Answer"
                                CssClass="submit-btn" />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />
    </div>
</asp:Content>
