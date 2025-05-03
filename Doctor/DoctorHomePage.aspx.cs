using System;
using System.Web;
using System.Web.UI;

public partial class Doctor_DoctorHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Prevent unauthorized access
        /*
        if (Session["DoctorName"] == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            lblUserName.Text = Session["DoctorName"].ToString();
        }
        */

        if (true)
        {
            lblUserName.Text = "Shyamali";
        }
    }
}
