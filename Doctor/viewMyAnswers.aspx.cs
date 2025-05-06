using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Doctor_ViewMyAnswers : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["yourConnectionStringName"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAnswers();
        }
    }

    private void LoadAnswers()
    {
        string doctorEmail = Session["DoctorEmail"] as string;

        if (string.IsNullOrEmpty(doctorEmail))
        {
            Response.Redirect("~/Login.aspx"); // Session expired or not logged in
            return;
        }

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"
                SELECT 
                    Q.QuestionText, 
                    A.AnswerText, 
                    A.AnswerDate
                FROM 
                    Answers A
                INNER JOIN 
                    Questions Q ON A.QuestionId = Q.QuestionId
                WHERE 
                    A.DoctorEmail = @DoctorEmail
                ORDER BY 
                    A.AnswerDate DESC";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@DoctorEmail", doctorEmail);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvAnswers.DataSource = dt;
            gvAnswers.DataBind();
        }
    }
}
