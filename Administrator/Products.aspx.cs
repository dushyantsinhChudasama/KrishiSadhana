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
    public partial class Products : System.Web.UI.Page
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
            txtDiscount.ForeColor = System.Drawing.Color.Red;

            if (!IsPostBack)
            {
                fillCategory();
                displayProducts();
            }
        }

        //calculating total discount from ori_price and selling price and setting it to txtDiscount
        void calculateDiscount()
        {
            if(!string.IsNullOrEmpty(txtOriPrice.Text) && !string.IsNullOrEmpty(txtSellprice.Text))
            {
                try
                {
                    decimal ori_price = Convert.ToDecimal(txtOriPrice.Text);
                    decimal sell_price = Convert.ToDecimal(txtSellprice.Text);

                    if(ori_price > 0 && ori_price >= sell_price)
                    {
                        decimal discount = ((ori_price - sell_price) / ori_price) * 100;
                        txtDiscount.Text = $"{discount:F2}%"; // displaying disc with to decimal point

                    }
                }
                catch(FormatException)
                {
                    txtDiscount.Text = "Invalid Prices";
                }
            }
            else
            {
                txtDiscount.Text = "Enter both Prices";
            }
        }


        //for this method the method is downside of """Render""" which is completing method as because there is imagebutton
        protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if(e.CommandName == "cmd_edt")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Edit_Product.aspx?ProductId=" + productId);
                
            }
            else
            {

                int id = Convert.ToInt32(e.CommandArgument);
                cmd = new SqlCommand("Delete From Products_tbl where Id = '" + id + "'", ac.startCon());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product Removed!');", true);

            }
        }

        //Displaying products
        void displayProducts()
        {
            //da = new SqlDataAdapter("select p.*, c.name as CatName FROM Products_tbl p JOIN Categories_tbl c ON p.Category = c.Id; ", ac.startCon());
            da = new SqlDataAdapter("select * FROM Products_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            ProductGrid.DataSource = ds;
            ProductGrid.DataBind();
        }
        

        //getting id of selected 
        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from Categories_tbl where Name = '" + drpCategory.SelectedValue + "'", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            ViewState["Category_id"] = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
        }

        //Uploding image and getting file name

        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {
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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image Uploaded Successfully!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select a product image!');", true);
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            //inserting products
            uploadImage();
            ac.insertProducts(txtName.Text, drpCategory.SelectedValue, txtOriPrice.Text, txtSellprice.Text, txtDiscount.Text, txtQty.Text, txtOrigin.Text, txtSlug.Text, fileName, txtDesc.Text);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('New Product Added!');", true);

            txtName.Text = null;
            drpCategory.ClearSelection();
            txtOriPrice.Text = null;
            txtSellprice.Text = null;
            txtDiscount.Text = null;
            txtOrigin.Text = null;
            txtSlug.Text = null;

            displayProducts();

        }

        public void fillCategory()
        {
            da = new SqlDataAdapter("Select * from Categories_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            for(int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpCategory.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }




        //checking and adding disccount after inserting values
        protected void txtOriPrice_TextChanged(object sender, EventArgs e)
        {
            //check if other textbox is null or not if null show else message
            if(!string.IsNullOrEmpty(txtSellprice.Text))
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
            if(!string.IsNullOrEmpty(txtOriPrice.Text))
            {
                calculateDiscount();
            }
            else
            {
                txtDiscount.Text = "Enter both prices";
            }
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