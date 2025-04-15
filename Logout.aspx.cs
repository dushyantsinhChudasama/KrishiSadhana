using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana.assets
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                Session["userId"] = null;
                Session["user"] = null;

                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}