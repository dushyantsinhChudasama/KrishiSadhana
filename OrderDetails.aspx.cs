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
    public partial class OrderDetails : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();
        string Userid;
        string OrderDetail;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                Userid = Session["userId"].ToString();
                OrderDetail = Request.QueryString["orderId"];

                da = new SqlDataAdapter("Select * from UserDetails_tbl where Id = '" + Session["userId"] + "'", mc.startCon());
                ds = new DataSet();

                da.Fill(ds);

                lblFullName.Text = ds.Tables[0].Rows[0]["Name"].ToString();

                if(string.IsNullOrWhiteSpace(OrderDetail))
                {
                    Response.Redirect("MyOrders.aspx");
                }

                lblLogout.Visible = true;
                lblProfile.Visible = true;
                displayOrderDetails();
            }
            else
            {
                lblName.Text = "Login";
                Response.Redirect("Home.aspx");
            }
        }

        public void displayOrderDetails()
        {
            da = new SqlDataAdapter("SELECT od.Id,od.Order_Id,p.Name,p.Image,od.Product_Qty,od.Product_Price, (od.Product_Qty * od.Product_Price) AS TotalPrice FROM OrderDetails_tbl od JOIN Products_tbl p ON od.Product_Id = p.Id WHERE od.Order_Id = '" + OrderDetail + "' ", mc.startCon());
            ds = new DataSet();

            da.Fill(ds);

            OrderDetailsGrid.DataSource = ds;
            OrderDetailsGrid.DataBind();
        }
    }
}