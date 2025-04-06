using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana.Administrator
{
    public partial class Doctors : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac = new Admin_Class();

        string fileName;

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();
            lblAdminName.Text = "Hello " + Session["admin"].ToString();
            if (!IsPostBack)
            {
                displayDoctors();
            }
        }

        protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "cmd_edt")
            {
                int doctorId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Edit_Doctor.aspx?doctorId=" + doctorId);
            }
            else
            {
                int id = Convert.ToInt32(e.CommandArgument);
                cmd = new SqlCommand("Delete from Doctors_tbl where Id = '" + id + "'", ac.startCon());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Doctor removed!');", true);
                displayDoctors();
            }
        }

        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {
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
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select a Doctor image!');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Check if any field is empty
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtExperience.Text) ||
                string.IsNullOrWhiteSpace(txtSpeciality.Text) ||
                string.IsNullOrWhiteSpace(txtStudy.Text) ||
                string.IsNullOrWhiteSpace(txtCity.Text) ||
                string.IsNullOrWhiteSpace(txtState.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter all the fields');", true);
            }
            else
            {
                uploadImage();
                ac.insertDoctor(txtName.Text, txtExperience.Text, txtSpeciality.Text, txtStudy.Text, txtCity.Text, txtState.Text, fileName);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('New Doctor Added!');", true);

                // Clear the fields
                txtName.Text = "";
                txtExperience.Text = "";
                txtSpeciality.Text = "";
                txtStudy.Text = "";
                txtCity.Text = "";
                txtState.Text = "";
            }
        }

        public void displayDoctors()
        {
            da = new SqlDataAdapter("Select * from Doctors_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            ProductGrid.DataSource = ds;
            ProductGrid.DataBind();
        }

        protected override void Render(HtmlTextWriter writer)
        {
            foreach (GridViewRow row in ProductGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    ImageButton editButton = (ImageButton)row.FindControl("ImageButton1");
                    ImageButton deleteButton = (ImageButton)row.FindControl("ImageButton2");

                    if (editButton != null)
                    {
                        Page.ClientScript.RegisterForEventValidation(ProductGrid.UniqueID, editButton.CommandArgument);
                    }

                    if (deleteButton != null)
                    {
                        Page.ClientScript.RegisterForEventValidation(ProductGrid.UniqueID, deleteButton.CommandArgument);
                    }
                }
            }
            base.Render(writer);
        }
    }
}