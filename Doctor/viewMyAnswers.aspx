<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewMyAnswers.aspx.cs" Inherits="YourProject.viewMyAnswers" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>My Answers</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>My Questions and Answers</h2>
            <asp:GridView ID="gvMyAnswers" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Question" HeaderText="Question" />
                    <asp:BoundField DataField="Answer" HeaderText="Answer" />
                    <asp:BoundField DataField="AnswerDate" HeaderText="Answered On" DataFormatString="{0:dd MMM yyyy}" />
                </Columns>
            </asp:GridView>


        </div>
    </form>
</body>
</html>
