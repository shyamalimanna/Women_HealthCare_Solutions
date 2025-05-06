using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

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
        string email = Session["userId"] != null ? Session["userId"].ToString() : string.Empty; // Fixed null check

        if (string.IsNullOrEmpty(question))
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please enter your question.";
            return;
        }

        List<string> selectedCategories = new List<string>();

        foreach (ListItem item in ddlCategories.Items)
        {
            if (item.Selected)
            {
                selectedCategories.Add(item.Text);  // or item.Value for IDs
            }
        }

        if (selectedCategories.Count == 0)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please select at least one category.";
            return;
        }

        // Simulated database save (replace with actual logic)
        // string questionId = SaveQuestionToDatabase(email, question, selectedCategories);

        lblMessage.ForeColor = System.Drawing.Color.Green;
        lblMessage.Text = "Your question has been submitted successfully!";
        txtQuestion.Text = string.Empty;

        // Deselect all categories after submitting
        foreach (ListItem item in ddlCategories.Items)
        {
            item.Selected = false;
        }

        litSelectedCategories.Text = string.Empty;
    }
}
