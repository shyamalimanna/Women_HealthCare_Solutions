<%@ Page Title="View My Questions" Language="C#" MasterPageFile="~/GenUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="ViewQuestions.aspx.cs" Inherits="Patients_ViewQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding: 40px; width: 600px; margin: auto; background-color: #f5f5f5;">
        <h2 style="text-align: center;">My Questions</h2>

        <asp:GridView ID="gvQuestions" runat="server" AutoGenerateColumns="False" 
            OnRowDataBound="gvQuestions_RowDataBound" Width="100%">
            <Columns>
                <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                <asp:BoundField DataField="DatePosted" HeaderText="Date Posted" SortExpression="DatePosted" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnViewAnswer" runat="server" Text="View Answer" OnClick="btnViewAnswer_Click" CommandArgument='<%# Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>
