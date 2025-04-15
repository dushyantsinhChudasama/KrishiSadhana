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
    public partial class MyProfile : System.Web.UI.Page
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();
        string Userid;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                Userid = Session["userId"].ToString();

                lblLogout.Visible = true;
                lblProfile.Visible = true;

                //get and set all the details for profile information
                if(!IsPostBack)
                {
                    getUserDetails();
                }
            }
            else
            {
                lblName.Text = "Login";
                Response.Redirect("Home.aspx");
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void getUserDetails()
        {
            da = new SqlDataAdapter("Select * from UserDetails_tbl where Id = '" + Session["userId"] + "'", mc.startCon());
            ds = new DataSet();

            da.Fill(ds);
            
            lblFullName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();

            rbGender.SelectedValue = ds.Tables[0].Rows[0]["Gender"].ToString();

            txtEmali.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtMobile.Text = ds.Tables[0].Rows[0]["Phone"].ToString();

        }

        protected void btnUpdateNameEmailGender_Click(object sender, EventArgs e)
        {
            mc.updateNameGender(txtName.Text, rbGender.SelectedValue, Userid);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Details Updated Successfully!');", true);
            getUserDetails();
        }

        protected void btnUpdateEmail_Click(object sender, EventArgs e)
        {
            mc.updateEmail(txtEmali.Text, Userid);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email Updated Successfully!');", true);
            getUserDetails();
        }

        protected void btnUpdateMobile_Click(object sender, EventArgs e)
        {
            mc.updateMobileNumber(txtMobile.Text, Userid); 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mobile Number Updated Successfully!');", true);
            getUserDetails();
        }
    }
}