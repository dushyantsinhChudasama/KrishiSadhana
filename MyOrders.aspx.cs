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
    public partial class MyOrders : System.Web.UI.Page
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();
        string Userid;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                Userid = Session["userId"].ToString();

                da = new SqlDataAdapter("Select * from UserDetails_tbl where Id = '" + Session["userId"] + "'", mc.startCon());
                ds = new DataSet();

                da.Fill(ds);

                lblFullName.Text = ds.Tables[0].Rows[0]["Name"].ToString();

                lblLogout.Visible = true;
                lblProfile.Visible = true;
                displayOrders();
            }
            else
            {
                lblName.Text = "Login";
                Response.Redirect("Home.aspx");
            }
        }

        protected void OrdersGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        public void displayOrders()
        {
            da = new SqlDataAdapter("SELECT o.Order_Id, MAX(o.Status) AS Status, MAX(o.PaymentMode) AS PaymentMode, MAX(o.CustTotalAmount) AS TotalAmount, MAX(o.Id) AS OrderNumber, MAX(o.User_Id) AS UserId, MAX(CONVERT(DATE, od.Created_At)) AS OrderDate, SUM(od.Product_Qty) AS TotalItems FROM Orders_tbl o JOIN OrderDetails_tbl od ON o.Order_Id = od.Order_Id WHERE o.User_Id = '" + Session["userId"] + "' GROUP BY o.Order_Id ORDER BY MAX(od.Created_At) DESC", mc.startCon());
            ds = new DataSet();

            da.Fill(ds);

            OrdersGrid.DataSource = ds;
            OrdersGrid.DataBind();
        }
    }
}