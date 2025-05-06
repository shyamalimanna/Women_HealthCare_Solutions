<%@ Page Title="Doctor Dashboard" Language="C#" AutoEventWireup="true" CodeFile="DoctorHomePage.aspx.cs" Inherits="Doctor_DoctorHomePage" MasterPageFile="~/Doctor/MasterPage.master" %>

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
    <script>
        console.log(sessionStorage.getItem('userId'));
        console.log(sessionStorage.getItem('role'));

    </script>

    <!-- Dashboard Content -->
    <div class="dashboard-content">
        <!-- Welcome and Doctor's Name -->
        <div class="user-greeting">
            Welcome, Dr. <asp:Label ID="lblDoctorName" runat="server" Text="Name" />
        </div>

      <!-- Profile Section -->
<div class="profile-section">
    <div class="dashboard-title">Your Profile</div>
    <div class="profile-row">
        <span class="profile-item">Name:</span>
        <span class="profile-value">Dr. <asp:Label ID="Label1" runat="server" Text="Name" /></span>
    </div>
    <div class="profile-row">
        <span class="profile-item">Address:</span>
        <span class="profile-value"><asp:Label ID="lblDoctorAddress" runat="server" Text="Address" /></span>
    </div>
    <div class="profile-row">
        <span class="profile-item">Contact Number:</span>
        <span class="profile-value"><asp:Label ID="lblDoctorContact" runat="server" Text="Contact Number" /></span>
    </div>
    <div class="profile-row">
        <span class="profile-item">Email:</span>
        <span class="profile-value"><asp:Label ID="lblDoctorEmail" runat="server" Text="Email" /></span>
    </div>
</div>



        <!-- Links for Dashboard Actions -->
        <div>
           <!--  <a href="viewQuestions.aspx" class="dashboard-link">View Questions</a>
            <a href="viewMyAnswers.aspx" class="dashboard-link">View My Answers</a>
               -->
            <a href="UpdateProfile.aspx" class="dashboard-link">Update Profile</a>
          
        </div>
    </div>

</asp:Content>
