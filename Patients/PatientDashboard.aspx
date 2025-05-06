<%@ Page Title="Patient Dashboard" Language="C#" AutoEventWireup="true" CodeFile="PatientDashboard.aspx.cs" Inherits="PatientDashboard" MasterPageFile="MasterPage.master" %>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Patient Dashboard - Women's HealthCare Solutions
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .dashboard-content {
            padding: 30px;
            margin: 60px auto;
            max-width: 800px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            color: #333;
        }

        .dashboard-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .profile-section {
            margin-bottom: 30px;
        }

        .profile-item {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .profile-value {
            font-size: 18px;
            color: #555;
        }

        .dashboard-link {
            font-size: 18px;
            font-weight: bold;
            color: #007b7f;
            text-decoration: none;
            padding: 12px 20px;
            display: inline-block;
            margin: 10px;
            border: 2px solid #007b7f;
            border-radius: 6px;
            background-color: white;
            transition: all 0.3s ease;
        }

        .dashboard-link:hover {
            background-color: #007b7f;
            color: white;
        }

        .user-greeting {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .profile-row {
            display: flex;
            margin-bottom: 12px;
        }

        .profile-item {
            width: 180px;
            font-weight: bold;
            color: #222;
        }

        .profile-value {
            flex: 1;
            color: #555;
        }
    </style>

    <!-- Dashboard Content -->
    <div class="dashboard-content">
        <!-- Welcome and Patient's Name -->
        <div class="user-greeting">
            Welcome, <asp:Label ID="lblPatientName" runat="server" Text="Patient Name" />
        </div>

        <!-- Profile Section -->
        <div class="profile-section">
            <div class="dashboard-title">Your Profile</div>
            <div class="profile-row">
                <span class="profile-item">Name:</span>
                <span class="profile-value"><asp:Label ID="Label1" runat="server" Text="Jane Doe" /></span>
            </div>
            <div class="profile-row">
                <span class="profile-item">Address:</span>
                <span class="profile-value"><asp:Label ID="lblPatientAddress" runat="server" Text="123 Health St, City, Country" /></span>
            </div>
            <div class="profile-row">
                <span class="profile-item">Contact Number:</span>
                <span class="profile-value"><asp:Label ID="lblPatientContact" runat="server" Text="+1 234 567 890" /></span>
            </div>
            <div class="profile-row">
                <span class="profile-item">Email:</span>
                <span class="profile-value"><asp:Label ID="lblPatientEmail" runat="server" Text="janedoe@example.com" /></span>
            </div>
        </div>

        <!-- Links for Dashboard Actions -->
        <div>
            <a href="UpdateProfile.aspx" class="dashboard-link">Update Profile</a>
           <!-- <a href="AskQuestion.aspx" class="dashboard-link">Ask a Question</a>
            <a href="MyQuestions.aspx" class="dashboard-link">View My Questions</a>
               -->
        </div>
    </div>
</asp:Content>

