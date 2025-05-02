using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class GenUser_patientReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        string address = txtAddress.Text;
        string contact = txtContact.Text;
        string email = txtEmail.Text;

        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "INSERT INTO Patients (Name, Address, Contact, Email) VALUES (@Name, @Address, @Contact, @Email)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Contact", contact);
            cmd.Parameters.AddWithValue("@Email", email);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("Login.aspx");
    }
}
