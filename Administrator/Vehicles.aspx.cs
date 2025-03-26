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
    public partial class Vehicles : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                displayVehicles();
            }
        }

        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {
                // Path to Images/Product_Images folder from Administrator
                string folderPath = Server.MapPath("~/Images/Vehicle_Image/");

                // Check and create folder if it doesn't exist
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                // Save image to Product_Images folder
                fileName = "Images/Vehicle_Image/" + FileUpload1.FileName;
                FileUpload1.SaveAs(System.IO.Path.Combine(folderPath, FileUpload1.FileName));

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select a Doctor image!');", true);
            }
        }

        void displayVehicles()
        {
            da = new SqlDataAdapter("Select * from Vehicles_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            VehicleGrid.DataSource = ds;
            VehicleGrid.DataBind();
        }


        protected override void Render(HtmlTextWriter writer)
        {
            foreach (GridViewRow row in VehicleGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    ImageButton editButton = (ImageButton)row.FindControl("ImageButton1");
                    ImageButton deleteButton = (ImageButton)row.FindControl("ImageButton2");

                    if (editButton != null)
                    {
                        Page.ClientScript.RegisterForEventValidation(VehicleGrid.UniqueID, editButton.CommandArgument);
                    }

                    if (deleteButton != null)
                    {
                        Page.ClientScript.RegisterForEventValidation(VehicleGrid.UniqueID, deleteButton.CommandArgument);
                    }
                }
            }
            base.Render(writer);
        }

        protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "cmd_edt")
            {
                int vehicleId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Edit_Vehicle.aspx?vehicleId=" + vehicleId);
            }
            else
            {
                int id = Convert.ToInt32(e.CommandArgument);
                cmd = new SqlCommand("Delete from Vehicles_tbl where Id = '" + id + "'", ac.startCon());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Vehicle removed!');", true);
                displayVehicles();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Check if any field is empty
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtCompany.Text) ||
                string.IsNullOrWhiteSpace(txtProduct.Text) ||
                string.IsNullOrWhiteSpace(txtRent.Text) ||
                string.IsNullOrWhiteSpace(txtCity.Text) ||
                string.IsNullOrWhiteSpace(txtState.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter all the fields');", true);
            }
            else
            {
                uploadImage();
                ac.insertVehicle(txtName.Text, txtCompany.Text, txtProduct.Text, txtRent.Text, txtCity.Text, txtState.Text, fileName);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('New Vehicle Added!');", true);

                displayVehicles();

                txtName.Text = "";
                txtCompany.Text = "";
                txtProduct.Text = "";
                txtRent.Text = "";
                txtCity.Text = "";
                txtState.Text = "";

            }
        }
    }
}