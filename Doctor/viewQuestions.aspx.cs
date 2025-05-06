using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Doctors_ViewQuestions : System.Web.UI.Page
{
    // Connection string from web.config
    string connStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUnansweredQuestions();
        }
    }

    // Load all unanswered questions
    private void LoadUnansweredQuestions()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM QuestionsAnswers WHERE AnswerText IS NULL";

            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptQuestions.DataSource = dt;
                rptQuestions.DataBind();
            }
        }
    }

    // Handle the submission of an answer to a question
    protected void rptQuestions_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Answer")
        {
            // Retrieve the QuestionID and answer text
            int questionId = Convert.ToInt32(e.CommandArgument);
            TextBox txtAnswer = (TextBox)e.Item.FindControl("txtAnswer");
            string answer = txtAnswer != null ? txtAnswer.Text.Trim() : "";
            string doctorEmail = Session["userId"] != null ? Session["userId"].ToString() : "";

            // Input validation
            if (string.IsNullOrEmpty(answer) || string.IsNullOrEmpty(doctorEmail))
            {
                lblMessage.Text = "Answer or session is empty.";
                return;
            }

            // Update the answer in the database using DataAdapter and DataTable
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM QuestionsAnswers WHERE QuestionID = @QuestionID", con);
                da.SelectCommand.Parameters.AddWithValue("@QuestionID", questionId);

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    dr["AnswerText"] = answer;
                    dr["DoctorEmail"] = doctorEmail;
                    dr["AnsweredDate"] = DateTime.Now;

                    // Push the update to the database
                    da.Update(dt);

                    lblMessage.Text = "Answer submitted successfully.";
                    LoadUnansweredQuestions(); // Refresh
                }
                else
                {
                    lblMessage.Text = "Question not found.";
                }
            }
        }
    }
}
