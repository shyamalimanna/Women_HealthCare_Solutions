using System;

public partial class Doctor_DoctorMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if doctor is logged in
            if (Session["DoctorName"] == null)
            {
                // Not logged in, redirect to login
                Response.Redirect("~/GenUser/Login.aspx");
            }
            else
            {
                // Display doctor name (already prefixed with "Dr." in .master)
                lblUserName.Text = "Dr. " + Session["DoctorName"].ToString();
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear session and redirect to login
        Session.Clear();
        Session.Abandon();

        // Optional: To ensure that all session cookies are also cleared
        Response.Cookies.Clear();

        // Redirect to the login page after logout
        Response.Redirect("~/GenUser/Login.aspx");
    }
}
