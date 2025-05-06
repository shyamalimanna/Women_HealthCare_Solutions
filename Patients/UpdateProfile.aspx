<%@ Page Title="Update Profile" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="Patients_UpdateProfile" %>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Update Profile - Women's HealthCare Solutions
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .update-form {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 10px;
            font-family: Arial, sans-serif;
        }

        .update-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-update {
            background-color: #007b7f;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }

        .btn-update:hover {
            background-color: #005f63;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            color: green;
        }
    </style>

    <div class="update-form">
        <h2>Update Your Profile</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="message" />

        <div class="form-group">
            <label class="form-label">Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label class="form-label">Address</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label class="form-label">Contact Number</label>
            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label class="form-label">Email (readonly)</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>

        <div class="form-group">
            <label class="form-label">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
        </div>

        <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn-update" OnClick="btnUpdate_Click" />
    </div>
</asp:Content>


