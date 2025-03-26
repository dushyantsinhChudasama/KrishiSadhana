using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana.assets.css
{
    public partial class Contact : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pg;
        Main_Class mc = new Main_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtName.Text == "" || txtEmail.Text == "" || txtPhone.Text == "" || txtSubject.Text == "" || txtMessage.Text == "")
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please Enter all the feilds";
            }
            else
            {
                lblMessage.Visible = false;
                mc.insertUserQuery(txtName.Text, txtEmail.Text, txtPhone.Text, txtSubject.Text, txtMessage.Text);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thank you for contacting us!');", true);

                txtName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
        }
    }
}