using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Data.SqlClient;//1
using System.Data;//2

public partial class GenUser_doctorReg : System.Web.UI.Page
{
    SqlDataAdapter adp = new SqlDataAdapter("select * from [dbo].[Table]", @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\HP\Desktop\Women_HealthCare_Solutions\App_Data\Database.mdf;Integrated Security=True");//3
    DataTable dt = new DataTable();//4
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: You can add Page_Load logic here if needed
        adp.Fill(dt);//5
        SqlCommandBuilder str = new SqlCommandBuilder(adp);//6
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
       
       

        try
        {
            DataRow dr = dt.NewRow();//7
            dr[0] = TextBox4.Text;
            dr[1] = TextBox1.Text;
            dr[2] = TextBox2.Text;
            dr[3] = TextBox3.Text;
            //   dr[4] = FileUpload1;
            dr[4] = TextBoxPassword.Text;
            dt.Rows.Add(dr);//8
            adp.Update(dt);//9

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
