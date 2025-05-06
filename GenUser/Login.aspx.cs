using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class GenUser_Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Check if the user is already logged in (Session should be cleared)
        if (Session["role"] != null || Session["userId"] != null)
        {
            // Clear the existing session to log the user out
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();  // Optional: Clear cookies to remove session data
        }

        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();
        string role = ddlRole.SelectedValue;

        if (role != "Doctor" && role != "Patient")
        {
            lblMessage.Text = "Please select a valid role.";
            return;
        }

        string tableName = (role == "Doctor") ? "[dbo].[Table]" : "[dbo].[Patients]";
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        DataTable dt = new DataTable();

        try
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM " + tableName + " WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // Reminder: use hash in real apps

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // Set session variables for the logged-in user
                    Session["userId"] = dt.Rows[0]["Email"].ToString();
                    Session["role"] = role;

                    // Redirect based on role
                    if (role == "Doctor")
                    {
                        Session["DoctorName"] = dt.Rows[0]["Name"].ToString(); // Store doctor's name for display
                        Response.Redirect("~/Doctor/DoctorHomePage.aspx");
                    }
                    else
                    {
                        Session["PatientName"] = dt.Rows[0]["Name"].ToString();
                        Response.Redirect("~/Patients/PatientDashboard.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Login error: " + ex.Message.Replace("'", "\\'") + "');", true);
        }
    }
}
