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
    public partial class Edit_Vehicle : System.Web.UI.Page
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
                if (!string.IsNullOrEmpty(Request.QueryString["vehicleId"]))
                {
                    ViewState["vehicleId"] = Request.QueryString["vehicleId"];
                    fillData();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product ID Not Found!');", true);
                    Response.Redirect("Vehicle.aspx");
                }
            }
        }

        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {
                isImageUpate = 1;
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

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            uploadImage();
            if (isImageUpate == 1)
            {
                //updating details with image
                ac.updateVehicleImage(txtName.Text, txtCompany.Text, txtProducts.Text, txtRent.Text, txtCity.Text, txtState.Text, fileName, Convert.ToInt32(ViewState["vehicleId"]));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Vehicle Updated Successfully!');", true);
                Response.Redirect("Vehicles.aspx");
            }
            else
            {
                //updating details without image
                ac.updateVehicle(txtName.Text, txtCompany.Text, txtProducts.Text, txtRent.Text, txtCompany.Text, txtState.Text, Convert.ToInt32(ViewState["vehicleId"]));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Vehicle Updated Successfully!');", true);
                Response.Redirect("Vehicles.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vehicles.aspx");
        }

        void fillData()
        {
            ds = new DataSet();
            ds = ac.fetchVehicle(Convert.ToInt32(ViewState["vehicleId"]));

            txtName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtCompany.Text = ds.Tables[0].Rows[0][2].ToString();
            txtProducts.Text = ds.Tables[0].Rows[0][3].ToString();
            txtRent.Text = ds.Tables[0].Rows[0][4].ToString();
            txtCity.Text = ds.Tables[0].Rows[0][5].ToString();
            txtState.Text = ds.Tables[0].Rows[0][6].ToString();

            vehImage.ImageUrl = ResolveUrl("~/" + ds.Tables[0].Rows[0][8].ToString());
        }
    }
}