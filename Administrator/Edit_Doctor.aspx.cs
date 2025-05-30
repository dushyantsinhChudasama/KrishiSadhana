﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana.Administrator
{
    public partial class Edit_Doctor : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac = new Admin_Class();

        //for image updating
        string fileName;
        int isImageUpate = 0; // this variable will be 1 if new image is there and base on it query will be fired

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();

            //fetching data
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["doctorId"]))
                {
                    ViewState["doctorId"] = Request.QueryString["doctorId"];
                    fillData();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product ID Not Found!');", true);
                    Response.Redirect("Products.aspx");
                }
            }
        }

        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {
                isImageUpate = 1;
                // Path to Images/Product_Images folder from Administrator
                string folderPath = Server.MapPath("~/Images/Doctor_Images/");

                // Check and create folder if it doesn't exist
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                // Save image to Product_Images folder
                fileName = "Images/Doctor_Images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(System.IO.Path.Combine(folderPath, FileUpload1.FileName));

            }
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            uploadImage();
            if (isImageUpate == 1)
            {
                //updating details with image
                ac.updateDoctorImage(txtName.Text, txtExperience.Text, txtSpecialization.Text, txtStudy.Text, txtCity.Text, txtState.Text, fileName, Convert.ToInt32(ViewState["doctorId"]));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Doctor Updated Successfully!');", true);
                Response.Redirect("Doctors.aspx");
            }
            else
            {
                //updating details without image
                ac.updateDoctor(txtName.Text, txtExperience.Text, txtSpecialization.Text, txtStudy.Text, txtCity.Text, txtState.Text,Convert.ToInt32(ViewState["doctorId"]));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Doctor Updated Successfully!');", true);
                Response.Redirect("Doctors.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctors.aspx");
        }

        public void fillData()
        {
            ds = new DataSet();
            ds = ac.fetchDoctor(Convert.ToInt32(ViewState["doctorId"]));

            txtName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtExperience.Text = ds.Tables[0].Rows[0][2].ToString();
            txtSpecialization.Text = ds.Tables[0].Rows[0][3].ToString();
            txtStudy.Text = ds.Tables[0].Rows[0][4].ToString();
            txtCity.Text = ds.Tables[0].Rows[0][5].ToString();
            txtState.Text = ds.Tables[0].Rows[0][6].ToString();

            docImage.ImageUrl = ResolveUrl("~/" + ds.Tables[0].Rows[0][7].ToString());
        }
    }
}