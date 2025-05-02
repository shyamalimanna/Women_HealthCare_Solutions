using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace YourProject.GenUser
{
    public partial class askQuestion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Code for initial page load, if necessary
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string patientId = Session["PatientId"].ToString(); // Assuming PatientId is stored in session
            string question = txtQuestion.Text.Trim();

            if (string.IsNullOrEmpty(question))
            {
                Response.Write("<script>alert('Please enter a question.');</script>");
                return;
            }

            // Insert the question into the database
            using (SqlConnection conn = new SqlConnection("Your_Connection_String"))
            {
                string query = "INSERT INTO Questions (PatientId, Question, DatePosted) VALUES (@PatientId, @Question, @DatePosted)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PatientId", patientId);
                cmd.Parameters.AddWithValue("@Question", question);
                cmd.Parameters.AddWithValue("@DatePosted", DateTime.Now);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Redirect to home page after submission
            Response.Redirect("Home.aspx");
        }
    }
}
