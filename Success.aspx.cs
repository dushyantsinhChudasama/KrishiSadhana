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
    public partial class Success : System.Web.UI.Page
    {

        SqlCommand cmd;

        SqlDataAdapter da;
        Main_Class mc = new Main_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                lblLogout.Visible = true;
                lblProfile.Visible = true;

                if (Session["paymentMode"].ToString() == "Online")
                {
                    if (Request.QueryString["orderId"] == null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Can not fetch Order Id!');", true);
                    }
                    else if ((Request.QueryString["paymentId"] == null))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Can not fetch Payment Id!');", true);
                    }
                    else
                    {
                        lblOrderID.Text = Request.QueryString["orderId"].ToString();
                        lblPaymentID.Text = Request.QueryString["paymentId"].ToString();
                    }
                }
                else
                {
                    lblPaymentID.Visible = false;
                    lblPaymentID.Text = "COD";
                }

                insertOrder();
            }
            else
            {
                Response.Redirect("Home.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to Continue!');", true);
            }
        }



        //inserting order data into database

        public void insertOrder()
        {
            //for add order information in Orders_tbl
            cmd = new SqlCommand("Insert into Orders_tbl (Order_Id, payment_Id, CustName, CustEmail, CustPhone, CustAddress, CustCity, CustState, CustPincode, CustTotalAmount, CustLandmark, CustNote, PaymentMode, User_Id) values ('" + lblOrderID.Text + "', '" + lblPaymentID.Text + "', '" + Session["shipName"].ToString() + "', '" + Session["shipEmail"].ToString() + "', '" + Session["shipPhone"].ToString() + "', '" + Session["shipAddress"].ToString() + "', '" + Session["shipCity"].ToString() + "', '" + Session["shipState"].ToString() + "', '" + Session["shipPincode"].ToString() + "', '" + Session["NetAmount"].ToString() + "', '" + Session["landmark"].ToString() + "', '" + Session["note"].ToString() + "', '" + Session["paymentMode"].ToString() + "', '" + Session["userId"].ToString() + "')", mc.startCon());
            cmd.ExecuteNonQuery();

            //for add order details of products in OrderDetails_tbl
            string userID = Session["userId"].ToString();
            string orderID = lblOrderID.Text;

            da = new SqlDataAdapter("SELECT p.Id AS Product_Id, p.Name AS Product_Name, CAST(p.Sell_Price AS DECIMAL(10, 2)) AS Sell_Price, CAST(c.quantity AS INT) AS quantity FROM Cart_tbl c JOIN Products_tbl p ON c.pro_id = p.Id WHERE c.user_id = '" + userID + "'",mc.startCon());

            DataSet Orderds = new DataSet();
            da.Fill(Orderds);

            //looping in ds to insert all the selected products in db

            foreach (DataRow row in Orderds.Tables[0].Rows)
            {
                string productId = row["Product_Id"].ToString();
                string productName = row["Product_Name"].ToString();
                string productPrice = row["Sell_Price"].ToString();
                string productQty = row["quantity"].ToString();

                string insertQuery = @"INSERT INTO OrderDetails_tbl 
                (Order_Id, Product_Id, Product_Name, Product_Price, Product_Qty)
                VALUES ('" + orderID + "', '" + productId + "', '" + productName + "', '" + productPrice + "', '" + productQty + "')";

                SqlCommand insertCmd = new SqlCommand(insertQuery, mc.startCon());
                insertCmd.ExecuteNonQuery();
            }

            SqlCommand clearCart = new SqlCommand("DELETE FROM Cart_tbl WHERE user_id = '" + userID + "'", mc.startCon());
            clearCart.ExecuteNonQuery();

            Session["shipName"] = null;
            Session["shipPhone"] = null;
            Session["shipEmail"] = null;
            Session["shipNote"] = null;
            Session["shipAddress"] = null;
            Session["shipCity"] = null;
            Session["shipLandmark"] = null;
            Session["shipState"] = null;
            Session["shipPincode"] = null;
            Session["totalPrice"] = null;
            Session["note"] = null;
            Session["landmark"] = null;
            Session["NetAmount"] = null;
            Session["paymentMode"] = null;


        }
    }
}