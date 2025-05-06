using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctors_ViewMyAnswers : Page
{
    // Connection string from Web.config
    private string connString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAnsweredQuestions();
        }
    }

    private void LoadAnsweredQuestions()
    {
        // Get doctor email from session
        string doctorEmail = Session["userId"] != null ? Session["userId"].ToString() : "";

        if (string.IsNullOrEmpty(doctorEmail))
        {
            lblMessage.Text = "Session expired. Please log in again.";
            return;
        }

        string query = "SELECT * FROM QuestionsAnswers WHERE DoctorEmail = @DoctorEmail AND AnswerText IS NOT NULL ORDER BY AnsweredDate DESC";

        using (SqlConnection conn = new SqlConnection(connString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@DoctorEmail", doctorEmail);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAnsweredQuestions.DataSource = dt;
            rptAnsweredQuestions.DataBind();
        }
    }

    protected void rptAnsweredQuestions_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "UpdateAnswer")
        {
            int questionId = Convert.ToInt32(e.CommandArgument);
            TextBox txtAnswer = (TextBox)e.Item.FindControl("txtAnswer");

            if (txtAnswer != null)
            {
                string updatedAnswer = txtAnswer.Text.Trim();

                if (string.IsNullOrEmpty(updatedAnswer))
                {
                    lblMessage.Text = "Answer cannot be empty.";
                    return;
                }

                UpdateAnswer(questionId, updatedAnswer, DateTime.Now);
            }
        }
    }

    private void UpdateAnswer(int questionId, string newAnswer, DateTime answeredDate)
    {
        string query = "UPDATE QuestionsAnswers SET AnswerText = @AnswerText, AnsweredDate = @AnsweredDate WHERE QuestionID = @QuestionID";

        using (SqlConnection conn = new SqlConnection(connString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@AnswerText", newAnswer);
            cmd.Parameters.AddWithValue("@AnsweredDate", answeredDate);
            cmd.Parameters.AddWithValue("@QuestionID", questionId);

            conn.Open();
            cmd.ExecuteNonQuery();
        }

        lblMessage.Text = "Answer updated successfully.";
        LoadAnsweredQuestions();
    }
}
