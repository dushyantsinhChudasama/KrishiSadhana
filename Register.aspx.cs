using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace KrishiSadhana
{
    public partial class Register : System.Web.UI.Page
    {


        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Main_Class mc;

        protected void Page_Load(object sender, EventArgs e)
        {

            lblLogout.Visible = false;
            lblProfile.Visible = false;

            getCon();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            mc.insert(txtName.Text, txtEmail.Text, rbGen.Text, txtMobile.Text, txtPwd.Text);
            Response.Redirect("Login.aspx");
        }

        void getCon()
        {
            mc = new Main_Class();
            mc.startCon();
        }
    }
}