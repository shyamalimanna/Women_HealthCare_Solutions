<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="askQuestion.aspx.cs" Inherits="YourProject.GenUser.askQuestion" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Ask Question</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Ask a Question</h2>
            <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Rows="5" Columns="50" placeholder="Type your question here"></asp:TextBox><br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Question" OnClick="btnSubmit_Click" /><br /><br />
        </div>
    </form>
</body>
</html>
