using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class GenUser_patientReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: Add Page_Load logic here if needed
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // Read input values from the form controls
        string name = txtName.Text.Trim();
        string address = txtAddress.Text.Trim();
        string contact = txtContact.Text.Trim();
        string email = txtEmail.Text.Trim();

        // Simple input validation
        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(contact) || string.IsNullOrEmpty(email))
        {
            // Display a validation message (you can use a label or a modal to show this)
            Response.Write("<script>alert('Please fill in all fields');</script>");
            return;
        }

        // Get connection string from Web.config
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        try
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "INSERT INTO Patients (Name, Address, Contact, Email) VALUES (@Name, @Address, @Contact, @Email)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Email", email);

                // Open connection and execute the query
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Optionally, provide feedback to the user
            Response.Write("<script>alert('Registration successful!');</script>");

            // Redirect to login page after successful registration
            Response.Redirect("Login.aspx");
        }
        catch (Exception ex)
        {
            // Log error (consider logging it to a file or database)
            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
        }
    }
}
