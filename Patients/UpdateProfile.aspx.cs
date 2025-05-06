using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Patients_UpdateProfile : System.Web.UI.Page
{
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userId"] == null || Session["role"] == null || Session["role"].ToString() != "Patient")
            {
                Response.Redirect("~/GenUser/Login.aspx");
                return;
            }

            // Load data for the current patient
            LoadPatientData();
        }
    }

    private void LoadPatientData()
    {
        string email = Session["userId"].ToString();
        adp = new SqlDataAdapter("SELECT * FROM [dbo].[Patients] WHERE Email = @Email", conStr);
        adp.SelectCommand.Parameters.AddWithValue("@Email", email);

        adp.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            txtName.Text = dr["Name"].ToString();
            txtAddress.Text = dr["Address"].ToString();
            txtContact.Text = dr["ContactNo"].ToString();
            txtEmail.Text = dr["Email"].ToString();
           
            // Leave password field empty so the user has to re-enter only if they want to change it
            txtPassword.Attributes["value"] = dr["Password"].ToString();

        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string email = Session["userId"].ToString();
            adp = new SqlDataAdapter("SELECT * FROM [dbo].[Patients] WHERE Email = @Email", conStr);
            adp.SelectCommand.Parameters.AddWithValue("@Email", email);

            SqlCommandBuilder builder = new SqlCommandBuilder(adp);
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                dr["Name"] = txtName.Text.Trim();
                dr["Address"] = txtAddress.Text.Trim();
                dr["ContactNo"] = txtContact.Text.Trim();
              //  dr["Password"] = txtPassword.Text.Trim(); // NOTE: In production, use hashing
                // Only update password if the user entered a new one
                if (!string.IsNullOrWhiteSpace(txtPassword.Text))
                {
                    dr["Password"] = txtPassword.Text.Trim(); // NOTE: hash in production
                }
                adp.Update(dt);

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Profile updated successfully!";
                Response.Redirect("PatientDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Update failed: patient not found.";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}
