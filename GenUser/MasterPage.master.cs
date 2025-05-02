using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenUser_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    // Handle dropdown redirection
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string url = DropDownList1.SelectedValue;
        if (!string.IsNullOrEmpty(url))
        {
            Response.Redirect(url);
        }
    }

   
}
