using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Patients_AskQuestion : System.Web.UI.Page
{
    // Fixed category list (ID can be arbitrary, used only for UI)
    private static readonly Dictionary<string, string> Categories = new Dictionary<string, string>
    {
        { "1", "Menstrual Health" },
        { "2", "Pregnancy" },
        { "3", "PCOS" },
        { "4", "Menopause" },
        { "5", "Fertility" },
        { "6", "Birth Control" },
        { "7", "Urinary Health" },
        { "8", "Sexual Wellness" },
        { "9", "Breast Health" },
        { "10", "STIs" },
        { "11", "Endometriosis" },
        { "12", "Pelvic Pain" },
        { "13", "Nutrition" },
        { "14", "Mental Health" },
        { "15", "Skin Issues" },
        { "16", "Thyroid" },
        { "17", "Weight Concerns" },
        { "18", "Hair Loss" },
        { "19", "Low Libido" },
        { "20", "Other" }
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategories();
            txtQuestion.Text = "";                  // Clear question field
            ddlCategories.ClearSelection();         // Clear selected categories
            litSelectedCategories.Text = "";        // Clear category tags
            if (Session["SubmitSuccess"] != null && (bool)Session["SubmitSuccess"])
            {
                lblMessage.CssClass = "message";
                lblMessage.Text = "Question submitted successfully.";
                Session.Remove("SubmitSuccess");
            }
        }
    }

    private void LoadCategories()
    {
        ddlCategories.Items.Clear();

        foreach (var cat in Categories)
        {
            ddlCategories.Items.Add(new ListItem(cat.Value, cat.Key));
        }
    }

    protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        var selected = ddlCategories.Items.Cast<ListItem>()
            .Where(i => i.Selected)
            .Select(i => "<span class='selected-category'>" + i.Text + "</span>")
            .ToList();

        litSelectedCategories.Text = string.Join("", selected);
    }

    




protected void btnSubmit_Click(object sender, EventArgs e)
{
    string question = txtQuestion.Text.Trim();
    string email = Session["userId"] != null ? Session["userId"].ToString() : "";

    if (string.IsNullOrEmpty(question) || string.IsNullOrEmpty(email))
    {
        lblMessage.CssClass = "error-message";
        lblMessage.Text = "Please enter a question.";
        return;
    }

    List<string> selectedCategories = new List<string>();
    foreach (ListItem item in ddlCategories.Items)
    {
        if (item.Selected)
        {
            selectedCategories.Add(item.Text);
        }
    }

    if (selectedCategories.Count == 0)
    {
        lblMessage.CssClass = "error-message";
        lblMessage.Text = "Please select at least one category.";
        return;
    }

    string categories = string.Join(", ", selectedCategories);
   // string connStr = ConfigurationManager.ConnectionStrings["Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\HP\\Desktop\\Women_HealthCare_Solutions\\App_Data\\Database.mdf;Integrated Security=True"
//].ConnectionString;
    string connStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;


    try
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM QuestionsAnswers"; // Match your table
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            SqlCommandBuilder cb = new SqlCommandBuilder(adp);
            DataSet ds = new DataSet();
            adp.Fill(ds, "QA");

            DataTable dt = ds.Tables["QA"];
            DataRow dr = dt.NewRow();

            dr["PatientEmail"] = email;
            dr["QuestionText"] = question;
            dr["Category"] = categories;
            dr["AnswerText"] = DBNull.Value; // Or "" if nullable
            dr["DoctorEmail"] = DBNull.Value;
            dr["AskedDate"] = DateTime.Now;

            dt.Rows.Add(dr);
            adp.Update(ds, "QA");

            Session["SubmitSuccess"] = true;
            Response.Redirect(Request.RawUrl); // PRG pattern

        }
    }
    catch (Exception ex)
    {
        lblMessage.CssClass = "error-message";
        lblMessage.Text = "Error while submitting: " + ex.Message;
    }
}

}
