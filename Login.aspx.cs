using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace KrishiSadhana
{
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand cmd;
        int i;
        Main_Class mcls = new Main_Class();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            mcls.startCon();
            cmd = new SqlCommand("Select count(*) from UserDetails_tbl where Email = '" + txtEmail.Text + "' AND Password = '" + txtPassword.Text + "'", mcls.startCon());

            i = Convert.ToInt32(cmd.ExecuteScalar());

            if(i > 0)
            {
                Session["user"] = txtEmail.Text;
                Response.Redirect("Home.aspx");
            }
        }
    }
}