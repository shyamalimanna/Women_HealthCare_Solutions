<%@ Page Title="View Patient Questions" Language="C#" MasterPageFile="~/Doctor/MasterPage.master"
    AutoEventWireup="true" CodeFile="ViewQuestions.aspx.cs" Inherits="Doctors_ViewQuestions" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .question-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 10px;
        }

        .question-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 25px;
        }

        .question-label {
            font-weight: bold;
            color: #333;
            margin-top: 8px;
        }

        .question-value {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .answer-box {
            width: 100%;
            min-height: 100px;
            font-size: 14px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            margin-top: 10px;
        }

        .submit-btn {
            margin-top: 12px;
            background-color: #007b7f;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="question-container">
        <asp:Repeater ID="rptQuestions" runat="server" OnItemCommand="rptQuestions_ItemCommand">
            <ItemTemplate>
                <div class="question-card">
                    <div class="question-label">Question:</div>
                    <div class="question-value"><%# Eval("QuestionText") %></div>

                    <div class="question-label">Category:</div>
                    <div class="question-value"><%# Eval("Category") %></div>

                    <div class="question-label">Asked by:</div>
                    <div class="question-value"><%# Eval("PatientEmail") %></div>

                    <div class="question-label">Asked on:</div>
                    <div class="question-value"><%# Eval("AskedDate", "{0:dd-MMM-yyyy hh:mm tt}") %></div>

                    <div class="question-label">Your Answer:</div>
                    <asp:TextBox ID="txtAnswer" runat="server" CssClass="answer-box" TextMode="MultiLine" />

                    <asp:Button ID="btnSubmit" runat="server" CommandName="Answer" 
                                CommandArgument='<%# Eval("QuestionID") %>' Text="Submit Answer" 
                                CssClass="submit-btn" />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />
    </div>
</asp:Content>
