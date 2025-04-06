using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana
{
    public partial class Product_Details : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Main_Class mc = new Main_Class();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ProId"]))
            {
                ViewState["Pid"] = Request.QueryString["proid"];
                displayDetails();
                
                // Set default quantity only on first page load (not on postback)
                if (!IsPostBack)
                {
                    txtQuantity.Text = "1";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product ID Not Found!');", true);
                Response.Redirect("Home.aspx");
            }

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
            }
            else
            {
                lblName.Text = "Login";
            }
        }

        //method for displaying details
        public void displayDetails()
        {
            ds = new DataSet();
            ds = mc.getProduct(Convert.ToInt32(ViewState["Pid"]));

            mainIamge.ImageUrl = ds.Tables[0].Rows[0][11].ToString();
            lblProName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            lblOrigin.Text = ds.Tables[0].Rows[0]["Origin"].ToString();
            lblCategory.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();
            lblDiscount.Text = ds.Tables[0].Rows[0][5].ToString() + " off";
            lblOri_Prcie.Text = " ₹" + ds.Tables[0].Rows[0][3].ToString() + "/ Kg";
            lblSell_Price.Text = " ₹" + ds.Tables[0].Rows[0][4].ToString() + "/ Kg";
            lblDesc.Text = ds.Tables[0].Rows[0][12].ToString();

        }

       // for add to cart
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                //taking total quantity
                int qty = Convert.ToInt32(txtQuantity.Text);


                int pro_id = Convert.ToInt32(ViewState["Pid"]);
                int user_id = Convert.ToInt32(Session["userId"]);
                mc.insertIntoCartWithQuantity(user_id, pro_id, qty);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Item Added to cart!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to add to cart!');", true);

            }
        }
    }
}