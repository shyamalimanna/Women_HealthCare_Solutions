<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewQuestions.aspx.cs" Inherits="YourProject.viewQuestions" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>View Questions</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Questions from Patients</h2>
            <asp:GridView ID="gvQuestions" runat="server" AutoGenerateColumns="False" OnRowCommand="gvQuestions_RowCommand" DataKeyNames="QuestionId">
                <Columns>
                    <asp:BoundField DataField="Question" HeaderText="Question" />
                    <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:TextBox ID="txtAnswer" runat="server" Width="300px"></asp:TextBox>
                            <asp:Button ID="btnAnswer" runat="server" CommandName="Answer" CommandArgument="<%# Container.DataItemIndex %>" Text="Submit Answer" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
