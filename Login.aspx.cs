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

            if (i > 0)
            {
                cmd = new SqlCommand("Select Id from UserDetails_tbl where Email = '" + txtEmail.Text + "' AND Password = '" + txtPassword.Text + "'", mcls.startCon());
                object user_id = cmd.ExecuteScalar();

                if(user_id != null)
                {
                    Session["userId"] = user_id;
                }
                Session["user"] = txtEmail.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid Login credentials!');", true);
            }



            //object result = cmd.ExecuteScalar();

            //if (result != null)
            //{
            //    Session["user"] = txtEmail.Text;
            //    Session["userId"] = result.ToString(); // Storing UserId in session
            //    Response.Redirect("Home.aspx");
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid Login credentials!');", true);
            //}

        }
    }
}