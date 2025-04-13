using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
            }
            else
            {
                Response.Redirect("Home.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to Continue!');", true);
            }
        }
    }
}