using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenUser_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
<<<<<<< HEAD
       
=======
        // Display username if user is logged in
        if (Session["username"] != null)
        {
            lblUserName.Text = "Welcome, " + Session["username"].ToString();
            btnLogout.Visible = true;  // Show logout button if logged in
        }
        else
        {
            lblUserName.Text = "Welcome, Guest";
            btnLogout.Visible = false; // Hide logout button if not logged in
        }
>>>>>>> 181909b7de07d0ab45e8101fc90f356718706fe5
    }

    // Handle dropdown redirection
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string url = DropDownList1.SelectedValue;
        if (!string.IsNullOrEmpty(url))
        {
            Response.Redirect(url);
        }
    }

<<<<<<< HEAD
   
=======
    // Logout functionality
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear(); // Clear all session data
        Response.Redirect("~/GenUser/Login.aspx"); // Redirect to login page
    }
>>>>>>> 181909b7de07d0ab45e8101fc90f356718706fe5
}
