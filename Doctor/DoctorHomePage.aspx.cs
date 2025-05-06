using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Doctor_DoctorHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            // Check if user is logged in
            if (Session["userId"] == null || Session["role"] == null || Session["role"].ToString() != "Doctor")
            {
                Response.Redirect("~/GenUser/Login.aspx");
                return;
            }

            string email = Session["userId"].ToString();
            string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM [dbo].[Table] WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblDoctorName.Text = reader["Name"].ToString();
                    Label1.Text = reader["Name"].ToString();
                    lblDoctorEmail.Text = reader["Email"].ToString();
                    lblDoctorAddress.Text = reader["Address"].ToString();
                    lblDoctorContact.Text = reader["Contact No"].ToString();
                }
                else
                {
                    lblDoctorName.Text = "Unknown";
                    lblDoctorEmail.Text = "Unknown";
                    lblDoctorAddress.Text = "Unknown";
                    lblDoctorContact.Text = "Unknown";
                }

                reader.Close();
            }
        }
    }
}
