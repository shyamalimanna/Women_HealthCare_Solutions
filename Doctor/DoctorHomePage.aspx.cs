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

        //any chnages happen then if u want to update on git u have to do like this. follow me.
        //1. save this by ctrl+s then

        if (true)
        {
            lblUserName.Text = "Shyamali";
        }
    }
}
