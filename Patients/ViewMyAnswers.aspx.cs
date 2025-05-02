using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Patients_ViewMyAnswers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int questionId = Convert.ToInt32(Request.QueryString["QuestionId"]);
            BindAnswer(questionId);
        }
    }

    private void BindAnswer(int questionId)
    {
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "SELECT q.Question, a.Answer FROM Questions q JOIN Answers a ON q.Id = a.QuestionId WHERE q.Id=@QuestionId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@QuestionId", questionId);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    lblQuestion.Text = "Question: " + reader["Question"].ToString();
                    lblAnswerText.Text = "Answer: " + reader["Answer"].ToString();
                }
                else
                {
                    lblAnswerText.Text = "No answer available for this question yet.";
                }
            }
            catch (Exception ex)
            {
                // Handle error
            }
        }
    }
}
