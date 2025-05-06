<%@ Page Title="View Questions" Language="C#" AutoEventWireup="true" CodeFile="viewQuestions.aspx.cs" Inherits="Doctor_ViewQuestions" MasterPageFile="~/Doctor/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .questions-container {
            margin: 60px auto;
            max-width: 900px;
            background-color: #ffffffd9;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .questions-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            color: #007b7f;
        }

        .questions-table {
            width: 100%;
            border-collapse: collapse;
        }

        .questions-table th,
        .questions-table td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }

        .questions-table th {
            background-color: #007b7f;
            color: white;
        }

        .answer-link {
            padding: 6px 12px;
            background-color: #007b7f;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .answer-link:hover {
            background-color: #005f63;
        }
    </style>

    <div class="questions-container">
        <div class="questions-title">Patient Questions</div>
        <asp:GridView ID="gvQuestions" runat="server" AutoGenerateColumns="False" CssClass="questions-table" EmptyDataText="No questions available.">
            <Columns>
                <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                <asp:BoundField DataField="Question" HeaderText="Question" />
                <asp:BoundField DataField="DateAsked" HeaderText="Date Asked" DataFormatString="{0:dd MMM yyyy}" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a href='AnswerQuestion.aspx?questionId=<%# Eval("QuestionId") %>' class="answer-link">Answer</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
