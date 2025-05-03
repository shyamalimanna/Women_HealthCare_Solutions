using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class GenUser_doctorReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: You can add Page_Load logic here if needed
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // Read input values from form controls
        string name = TextBox1.Text.Trim();
        string address = TextBox2.Text.Trim();
        string contact = TextBox3.Text.Trim();
        string email = TextBox4.Text.Trim();

        // Validate the input fields
        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(contact) || string.IsNullOrEmpty(email))
        {
            // Show error message if any field is empty
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all the fields.');", true);
            return;
        }

        // Validate contact number format (basic check for length)
        if (contact.Length != 10)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid 10-digit contact number.');", true);
            return;
        }

        // Get connection string from Web.config
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        try
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "INSERT INTO Doctors (Name, Address, Contact, Email) VALUES (@Name, @Address, @Contact, @Email)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Redirect to login page after successful registration
            Response.Redirect("Login.aspx");
        }
        catch (Exception ex)
        {
            // Log or handle the error as necessary
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error during registration: " + ex.Message + "');", true);
        }
    }
}
