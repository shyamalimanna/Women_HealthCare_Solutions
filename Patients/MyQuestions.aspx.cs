using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Patients_MyQuestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadQuestions();
        }
    }

    private void LoadQuestions()
    {
        string email = Session["userId"] != null ? Session["userId"].ToString() : "";
        if (string.IsNullOrEmpty(email)) return;

        string connStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT QuestionText, Category, AskedDate, AnswerText FROM QuestionsAnswers WHERE PatientEmail = @Email ORDER BY AskedDate DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptQuestions.DataSource = dt;
            rptQuestions.DataBind();
        }
    }
}
