using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace KrishiSadhana.Administrator
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac;


        protected void Page_Load(object sender, EventArgs e)
        {
            getCon();
        }

        void getCon()
        {
            ac = new Admin_Class();
            ac.startCon();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ac.insertAdmin(txtName.Text, txtEmail.Text, txtPassword.Text);
            Response.Redirect("Login.aspx");
        }
    }
}