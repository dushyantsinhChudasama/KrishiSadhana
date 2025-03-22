using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace KrishiSadhana.Administrator
{
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand cmd;
        int i;
        Admin_Class ac = new Admin_Class();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ac.startCon();

            cmd = new SqlCommand("select count(*) from AdminDetails_tbl where Name = '" + txtname.Text + "' AND Password = '" + txtPassword.Text + "'", ac.startCon());

            i = Convert.ToInt32(cmd.ExecuteScalar());

            if(i > 0)
            {
                Session["admin"] = txtname.Text;
                Response.Redirect("Dashboard.aspx");
            }
        }
    }
}