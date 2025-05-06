using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Doctor_ViewQuestions : System.Web.UI.Page
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
        // Replace this with actual database fetch logic
        DataTable dt = new DataTable();
        dt.Columns.Add("QuestionId");
        dt.Columns.Add("PatientName");
        dt.Columns.Add("Question");
        dt.Columns.Add("DateAsked");

        // Sample data
        dt.Rows.Add("1", "Ravi Sharma", "I have chest pain for 2 days.", DateTime.Now.AddDays(-1));
        dt.Rows.Add("2", "Priya Singh", "How to control high blood pressure?", DateTime.Now.AddDays(-2));

        gvQuestions.DataSource = dt;
        gvQuestions.DataBind();
    }
}
