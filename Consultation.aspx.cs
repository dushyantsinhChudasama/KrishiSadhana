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
    public partial class Consultation : System.Web.UI.Page
    {


        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        Main_Class mc = new Main_Class();

        protected void Page_Load(object sender, EventArgs e)
        {

            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                lblLogout.Visible = true;
                lblProfile.Visible = true;
            }
            else
            {
                lblName.Text = "Login";
            }
            display();
        }

        public void display()
        {
            da = new SqlDataAdapter("select * from Doctors_tbl", mc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            dlDoctors.DataSource = ds;
            dlDoctors.DataBind();
        }
    }
}