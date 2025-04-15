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
    public partial class OrderDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        string orderId;


        Admin_Class ac = new Admin_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtName.Enabled = false;
            txtEmail.Enabled = false;
            txtPhone.Enabled = false;
            txtPincode.Enabled = false;
            txtOrderId.Enabled = false;
            txtPaymentId.Enabled = false;
            txtaddress.Enabled = false;
            txtLandmark.Enabled = false;

            Admin_Class.checkAdmin();

            //fetching data
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["orderId"]))
                {
                    orderId = Request.QueryString["orderId"];

                    displayDetails();
                    displayOrderDetails();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product ID Not Found!');", true);
                    Response.Redirect("Orders.aspx");
                }
            }

        }

        public void displayDetails()
        {
            da = new SqlDataAdapter("SELECT od.Id,od.Order_Id,p.Name,p.Image,od.Product_Qty,od.Product_Price, (od.Product_Qty * od.Product_Price) AS TotalPrice FROM OrderDetails_tbl od JOIN Products_tbl p ON od.Product_Id = p.Id WHERE od.Order_Id = '" + orderId + "' ", ac.startCon());
            ds = new DataSet();

            da.Fill(ds);

            OrderDetailsGrid.DataSource = ds;
            OrderDetailsGrid.DataBind();
        }

        public void displayOrderDetails()
        {
            da = new SqlDataAdapter("Select * From Orders_tbl where Order_Id = '" + orderId + "' ", ac.startCon());
            ds = new DataSet();

            da.Fill(ds);

            txtName.Text = ds.Tables[0].Rows[0]["CustName"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["CustEmail"].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0]["CustPhone"].ToString();
            txtPincode.Text = ds.Tables[0].Rows[0]["CustPincode"].ToString();
            txtOrderId.Text = ds.Tables[0].Rows[0]["Order_Id"].ToString();
            txtPaymentId.Text = ds.Tables[0].Rows[0]["Payment_Id"].ToString();
            txtaddress.Text = ds.Tables[0].Rows[0]["CustAddress"].ToString();
            txtLandmark.Text = ds.Tables[0].Rows[0]["CustLandmark"].ToString();
            txtTotalAmount.Text = ds.Tables[0].Rows[0]["CustTotalAmount"].ToString();
            txtNote.Text = ds.Tables[0].Rows[0]["CustNote"].ToString();
            drpOrderStatus.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();
        }

        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("Update Orders_tbl set Status = '" + drpOrderStatus.SelectedValue + "' where Order_Id = '" + Request.QueryString["orderId"] + "'", ac.startCon());
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order Status Updated!');", true);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.apsx");
        }
    }
}