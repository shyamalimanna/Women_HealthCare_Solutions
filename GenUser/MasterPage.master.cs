using System;
using System.Web;
using System.Web.UI;

public partial class GenUser_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is logged in
        if (Session["username"] != null)
        {
            lblUserName.Text = "Welcome, " + Session["username"].ToString();
            btnLogout.Visible = true;
        }
        else
        {
            lblUserName.Text = "Welcome, Guest";
            btnLogout.Visible = false;
        }

    }

    // Handle Logout button click
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear session and redirect to login
        Session.Clear();
        Response.Redirect("~/GenUser/Login.aspx");
    }
}
