using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class GenUser_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();
        string role = rbDoctor.Checked ? "Doctor" : "Patient";

        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string tableName = role == "Doctor" ? "Doctors" : "Patients";
            string query = "SELECT Id FROM " + tableName + " WHERE Email=@Email AND Password=@Password";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password); // Passwords should be hashed in real apps

            con.Open();
            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                Session["userId"] = result.ToString();
                Session["role"] = role;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid credentials!";
            }
        }
    }
}
