using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PatientDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if user is logged in
            if (Session["userId"] == null || Session["role"] == null || Session["role"].ToString() != "Patient")
            {
                Response.Redirect("~/GenUser/Login.aspx");
                return;
            }

            string email = Session["userId"].ToString();
            string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM [dbo].[Patients] WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblPatientName.Text = reader["Name"].ToString();
                    Label1.Text = reader["Name"].ToString();
                    lblPatientEmail.Text = reader["Email"].ToString();
                    lblPatientAddress.Text = reader["Address"] != DBNull.Value ? reader["Address"].ToString() : "Address not available";
                    lblPatientContact.Text = reader["ContactNo"] != DBNull.Value ? reader["ContactNo"].ToString() : "Contact number not available";
                }
                else
                {
                    lblPatientName.Text = "Unknown";
                    lblPatientEmail.Text = "Unknown";
                    lblPatientAddress.Text = "Unknown";
                    lblPatientContact.Text = "Unknown";
                }

                reader.Close();
            }
        }
    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        // Redirect to the edit profile page or open a modal for editing profile information
        Response.Redirect("EditPatientProfile.aspx");
    }
}
