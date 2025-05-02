using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Patients_ViewQuestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindQuestions();
        }
    }

    private void BindQuestions()
    {
        int patientId = Convert.ToInt32(Session["userId"]);
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "SELECT Id, Question, DatePosted FROM Questions WHERE PatientId=@PatientId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                gvQuestions.DataSource = reader;
                gvQuestions.DataBind();
            }
            catch (Exception ex)
            {
                // Handle error
            }
        }
    }

    protected void btnViewAnswer_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int questionId = Convert.ToInt32(btn.CommandArgument);
        Response.Redirect($"ViewMyAnswers.aspx?QuestionId={questionId}");
    }
}
