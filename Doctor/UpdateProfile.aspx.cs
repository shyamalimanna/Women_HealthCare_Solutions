using System;
using System.Data;
using System.Data.SqlClient;

public partial class Doctor_UpdateProfile : System.Web.UI.Page
{
    string conStr = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\HP\Desktop\Women_HealthCare_Solutions\App_Data\Database.mdf;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure the user is logged in
        if (Session["userId"] == null || Session["role"] == null || Session["role"].ToString() != "Doctor")
        {
            Response.Redirect("~/GenUser/Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadDoctorProfile();
        }
    }

    private void LoadDoctorProfile()
    {
        string email = Session["userId"].ToString();

        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "SELECT * FROM [dbo].[Table] WHERE Email = @Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtName.Text = reader["Name"].ToString();
                txtAddress.Text = reader["Address"].ToString();
                txtContact.Text = reader["Contact No"].ToString();
                // Leave password field empty so the user has to re-enter only if they want to change it
                txtPassword.Attributes["value"] = reader["Password"].ToString();
            }
            con.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string email = Session["userId"].ToString();

        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query;
            SqlCommand cmd;

            if (!string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                // Update password if entered
                query = @"UPDATE [dbo].[Table] 
                          SET Name = @Name, Address = @Address, [Contact No] = @Contact, [Password] = @Password 
                          WHERE Email = @Email";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            }
            else
            {
                // Do not update password if left blank
                query = @"UPDATE [dbo].[Table] 
                          SET Name = @Name, Address = @Address, [Contact No] = @Contact 
                          WHERE Email = @Email";
                cmd = new SqlCommand(query, con);
            }

            // Common parameters
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", email);

            try
            {
                con.Open();
                int rows = cmd.ExecuteNonQuery();
                con.Close();

                if (rows > 0)
                {
                    lblMessage.Text = "Profile updated successfully.";
                    Response.Redirect("DoctorHomePage.aspx");
                }
                else
                {
                    lblMessage.Text = "Update failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}
