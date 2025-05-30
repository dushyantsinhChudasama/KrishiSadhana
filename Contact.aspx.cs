﻿using System;
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
                lblLogout.Visible = false;
                lblProfile.Visible = false;

                lblMessage.Visible = false;

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