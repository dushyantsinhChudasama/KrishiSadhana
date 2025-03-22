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
            fillCategory();
            txtDiscount.ForeColor = System.Drawing.Color.Red;
            displayProducts();
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

        protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        //Displaying products
        void displayProducts()
        {
            da = new SqlDataAdapter("Select * From Products_tbl", ac.startCon());
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //inserting products
            uploadImage();
            ac.insertProducts(txtName.Text, Convert.ToInt32(ViewState["Category_id"]), txtOriPrice.Text, txtSellprice.Text, txtDiscount.Text, txtQty.Text, txtOrigin.Text, txtSlug.Text, fileName);
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

        //Uploding image and getting file name

        void uploadImage()
        {
            if (FileUpload1.HasFile)
            {
                // Get the correct server path
                string folderPath = Server.MapPath("~/Images/Product_Images/");
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                // Save the file
                fileName = folderPath + FileUpload1.FileName;
                FileUpload1.SaveAs(fileName);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select product image!');", true);
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
    }
}