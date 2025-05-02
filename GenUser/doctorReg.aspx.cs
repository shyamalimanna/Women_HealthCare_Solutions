using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class GenUser_doctorReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: You can add Page_Load logic here
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // Read input values from form controls
        string name = TextBox1.Text;
        string address = TextBox2.Text;
        string contact = TextBox3.Text;
        string email = TextBox4.Text;

        // Get connection string from Web.config
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

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
}
