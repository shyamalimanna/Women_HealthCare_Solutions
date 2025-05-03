<%@ Page Title="Doctor Dashboard" Language="C#" AutoEventWireup="true" CodeFile="DoctorHomePage.aspx.cs" Inherits="Doctor_DoctorHomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Doctor Dashboard - Women's HealthCare Solutions</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-image: url('../Picture/DoctorReg2.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            color: white;
        }

        .dashboard-content {
            padding: 30px;
            margin: 60px auto;
            max-width: 700px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            color: #333;
            text-align: center;
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

        .footer {
            background-color: #007b7f;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Dashboard Content -->
        <div class="dashboard-content">
            <div class="user-greeting">
                Welcome, Dr. <asp:Label ID="lblUserName" runat="server" />
            </div>
            <div>
                <a href="ViewQuestions.aspx" class="dashboard-link">View Questions</a>
                <a href="ViewMyAnswers.aspx" class="dashboard-link">View My Answers</a>
                <a href="Logout.aspx" class="dashboard-link">Logout</a>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Women's HealthCare Solutions. Developed by Shyamali Manna
        </div>
    </form>
</body>
</html>
