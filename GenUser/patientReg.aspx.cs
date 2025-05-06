using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Data.SqlClient;//1
using System.Data;//2
public partial class GenUser_patientReg : System.Web.UI.Page
{
    SqlDataAdapter adp = new SqlDataAdapter("select * from [dbo].[Patients]", @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\HP\Desktop\Women_HealthCare_Solutions\App_Data\Database.mdf;Integrated Security=True");//3
    DataTable dt = new DataTable();//4
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: Add Page_Load logic here if needed
        adp.Fill(dt);//5
        SqlCommandBuilder str = new SqlCommandBuilder(adp);//6
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            DataRow dr = dt.NewRow();
            dr["Name"] = txtName.Text.Trim();
            dr["Address"] = txtAddress.Text.Trim();
            dr["ContactNo"] = txtContact.Text.Trim();
            dr["Email"] = txtEmail.Text.Trim();
            dr["Password"] = txtPassword.Text.Trim(); // Note: Use hashing in production

            dt.Rows.Add(dr);
            adp.Update(dt);

            // Redirect to login page after successful registration
            Response.Redirect("Login.aspx");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Error during registration: " + ex.Message + "');", true);
        }
    }
    //wait wait
}
