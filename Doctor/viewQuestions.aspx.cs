using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Doctor_viewQuestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT QuestionId, Question FROM Questions WHERE Answer IS NULL";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvQuestions.DataSource = dt;
                gvQuestions.DataBind();
            }
        }
    }

    protected void gvQuestions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Answer")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvQuestions.Rows[index];

            TextBox txtAnswer = (TextBox)row.FindControl("txtAnswer");
            string answer = txtAnswer.Text.Trim();
            int questionId = Convert.ToInt32(gvQuestions.DataKeys[index].Value);

            if (!string.IsNullOrEmpty(answer))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Questions SET Answer = @Answer, AnswerDate = @AnswerDate WHERE QuestionId = @QuestionId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Answer", answer);
                    cmd.Parameters.AddWithValue("@AnswerDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@QuestionId", questionId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("viewQuestions.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please enter an answer.');</script>");
            }
        }
    }
}
