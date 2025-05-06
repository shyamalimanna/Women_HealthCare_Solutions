<%@ Page Title="My Answers" Language="C#" MasterPageFile="~/Doctor/MasterPage.master" AutoEventWireup="true" CodeFile="viewMyAnswers.aspx.cs" Inherits="Doctor_ViewMyAnswers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .answers-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 25px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .answers-header {
            font-size: 26px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #007b7f;
            padding-bottom: 10px;
        }

        .styled-gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .styled-gridview th, .styled-gridview td {
            padding: 12px 15px;
            border: 1px solid #ccc;
        }

        .styled-gridview th {
            background-color: #007b7f;
            color: white;
            text-align: left;
        }

        .styled-gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .styled-gridview tr:hover {
            background-color: #e6f7f7;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: #888;
            font-style: italic;
        }
    </style>

    <div class="answers-container">
        <div class="answers-header">My Submitted Answers</div>

        <asp:GridView ID="gvAnswers" runat="server" AutoGenerateColumns="False" CssClass="styled-gridview" EmptyDataText="No answers found.">
            <Columns>
                <asp:BoundField DataField="QuestionText" HeaderText="Question" />
                <asp:BoundField DataField="AnswerText" HeaderText="Answer" />
                <asp:BoundField DataField="AnswerDate" HeaderText="Answered On" DataFormatString="{0:dd-MM-yyyy HH:mm}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
