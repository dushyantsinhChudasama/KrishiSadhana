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
    public partial class Orders : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac = new Admin_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();
            lblAdminName.Text = "Hello " + Session["admin"].ToString();


            if (!IsPostBack)
            {
                displayOrder();
            }
        }

        protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        public void displayOrder()
        {
            da = new SqlDataAdapter("SELECT o.Order_Id,MAX(CONVERT(DATE, od.Created_At)) AS OrderDate,MAX(o.CustTotalAmount) AS TotalAmount,SUM(od.Product_Qty) AS TotalItems,MAX(o.PaymentMode) AS PaymentMode,MAX(o.CustCity + ', ' + o.CustState) AS DeliverTo,MAX(o.Status) AS Status FROM Orders_tbl o JOIN OrderDetails_tbl od ON o.Order_Id = od.Order_Id GROUP BY o.Order_Id ORDER BY MAX(od.Created_At) DESC", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            OrdersGrid.DataSource = ds;
            OrdersGrid.DataBind();
        }
    }
}