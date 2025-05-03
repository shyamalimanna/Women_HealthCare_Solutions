using System;
using System.Web;
using System.Web.UI;

public partial class GenUser_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 
        // Run only on initial load, not on postbacks
        if (!IsPostBack)
        {
            // Example: Check if user is logged in and personalize
            if (Session["userId"] != null && Session["role"] != null)
            {
                string role = Session["role"].ToString();
                string welcomeMessage = "Welcome, " + role;
                // You can assign this to a label if needed
                // lblWelcome.Text = welcomeMessage;
            }

            // You could also load announcements, dashboard data, etc., here
        }
 
    }

    // Future search handling logic can go here
    // protected void btnSearch_Click(object sender, EventArgs e)
    // {
    //     string query = TextBox1.Text.Trim();
    //     // Redirect or filter results accordingly
    // }
}
