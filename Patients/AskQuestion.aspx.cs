using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Patients_AskQuestion : System.Web.UI.Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string question = txtQuestion.Text.Trim();
        int patientId = Convert.ToInt32(Session["userId"]); // Assuming the patient is logged in

        if (string.IsNullOrEmpty(question))
        {
            lblMessage.Text = "Question cannot be empty.";
            return;
        }

        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "INSERT INTO Questions (PatientId, Question) VALUES (@PatientId, @Question)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PatientId", patientId);
            cmd.Parameters.AddWithValue("@Question", question);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Your question has been submitted successfully.";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred. Please try again.";
            }
        }
    }
}
