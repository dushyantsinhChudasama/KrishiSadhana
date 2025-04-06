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
    public partial class Edit_Product : System.Web.UI.Page
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
            if(!IsPostBack)
            {
                if(!string.IsNullOrEmpty(Request.QueryString["ProductId"]))
                {
                    ViewState["productId"] = Request.QueryString["ProductId"];
                    fillCategory();
                    fillData();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product ID Not Found!');", true);
                    Response.Redirect("Products.aspx");
                }
            }
        }


        
        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from Categories_tbl where Name = '" + drpCategory.SelectedValue + "'", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            ViewState["Category_id"] = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
        }

        public void fillCategory()
        {
            da = new SqlDataAdapter("Select * from Categories_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpCategory.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }

        void fillData()
        {
            ds = new DataSet();
            ds = ac.fetchProduct(Convert.ToInt32(ViewState["productId"]));

            txtName.Text = ds.Tables[0].Rows[0][1].ToString();
            //drpCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
            txtOriPrice.Text = ds.Tables[0].Rows[0][3].ToString();
            txtSellprice.Text = ds.Tables[0].Rows[0][4].ToString();
            txtDiscount.Text = ds.Tables[0].Rows[0][5].ToString();
            txtQty.Text = ds.Tables[0].Rows[0][6].ToString();
            txtOrigin.Text = ds.Tables[0].Rows[0][7].ToString();
            txtSlug.Text = ds.Tables[0].Rows[0][8].ToString();
            txtDesc.Text = ds.Tables[0].Rows[0][12].ToString();

            proImage.ImageUrl = ResolveUrl("~/"+ds.Tables[0].Rows[0][11].ToString());

            // Fetch category
            string categoryName = ds.Tables[0].Rows[0][13].ToString().Trim();
            ListItem item = drpCategory.Items.FindByText(categoryName);

            if (item != null)
            {
                drpCategory.ClearSelection();
                item.Selected = true;
            }
            else
            {
                Console.WriteLine("Category Not Found: " + categoryName);
            }

        }

        protected void txtOriPrice_TextChanged(object sender, EventArgs e)
        {
            //check if other textbox is null or not if null show else message
            if (!string.IsNullOrEmpty(txtSellprice.Text))
            {
                calculateDiscount();
            }
            else
            {
                txtDiscount.Text = "Enter both prices";
            }
        }

        protected void txtSellprice_TextChanged(object sender, EventArgs e)
        {
            //check if other textbox is null or not if null show else message
            if (!string.IsNullOrEmpty(txtOriPrice.Text))
            {
                calculateDiscount();
            }
            else
            {
                txtDiscount.Text = "Enter both prices";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }


        //for updating image
        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {

                isImageUpate = 1;
                // Path to Images/Product_Images folder from Administrator
                string folderPath = Server.MapPath("~/Images/Product_Images/");

                // Check and create folder if it doesn't exist
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                // Save image to Product_Images folder
                fileName = "Images/Product_Images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(System.IO.Path.Combine(folderPath, FileUpload1.FileName));

                // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image Uploaded Successfully!');", true);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            uploadImage();
            if(isImageUpate == 1)
            {
                //updating details with image
                ac.updateProductImage(txtName.Text, Convert.ToInt32(ViewState["Category_id"]), txtOriPrice.Text, txtSellprice.Text, txtDiscount.Text, txtQty.Text, txtOrigin.Text, txtSlug.Text, txtDesc.Text, fileName,Convert.ToInt32(ViewState["productId"]));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product Updated Successfully!');", true);
                Response.Redirect("Products.aspx");
            }
            else
            {
                //updating details without image
                ac.updateProduct(txtName.Text, Convert.ToInt32(ViewState["Category_id"]), txtOriPrice.Text, txtSellprice.Text, txtDiscount.Text, txtQty.Text, txtOrigin.Text, txtSlug.Text, txtDesc.Text, Convert.ToInt32(ViewState["productId"]));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product Updated Successfully!');", true);
                Response.Redirect("Products.aspx");
            }

        }


        //calculating total discount from ori_price and selling price and setting it to txtDiscount
        void calculateDiscount()
        {
            if (!string.IsNullOrEmpty(txtOriPrice.Text) && !string.IsNullOrEmpty(txtSellprice.Text))
            {
                try
                {
                    decimal ori_price = Convert.ToDecimal(txtOriPrice.Text);
                    decimal sell_price = Convert.ToDecimal(txtSellprice.Text);

                    if (ori_price > 0 && ori_price >= sell_price)
                    {
                        decimal discount = ((ori_price - sell_price) / ori_price) * 100;
                        txtDiscount.Text = $"{discount:F2}%"; // displaying disc with to decimal point

                    }
                }
                catch (FormatException)
                {
                    txtDiscount.Text = "Invalid Prices";
                }
            }
            else
            {
                txtDiscount.Text = "Enter both Prices";
            }
        }
    }
}