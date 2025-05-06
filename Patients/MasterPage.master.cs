using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patients_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if doctor is logged in
            if (Session["PatientName"] == null)
            {
                // Not logged in, redirect to login
                Response.Redirect("~/GenUser/Login.aspx");
            }
            else
            {
                // Display doctor name (already prefixed with "Dr." in .master)
                lblPatientName.Text = Session["PatientName"].ToString();
            }
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Log out logic (e.g., clear session)
        Session.Clear();
        Response.Redirect("~/Login.aspx"); // Redirect to login page
    }


}

