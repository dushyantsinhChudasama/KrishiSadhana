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
    public partial class VehiclesDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac = new Admin_Class();
        string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();

            //fetching data
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["orderId"]))
                {
                    orderId = Request.QueryString["orderId"];

                    displayDetails();
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
            try
            {
                string query = @"SELECT 
                            U.Name AS CustomerName,
                            U.Email AS CustomerEmail,
                            U.Phone AS CustomerPhone,
                            VO.startDate AS OrderDate,
                            V.Name AS VehicleName,
                            V.Company AS VehicleCompany,
                            V.Product AS VehicleProduct,
                            V.State AS VehicleState,
                            V.City AS VehicleCity,
                            VO.TotalDays,
                            VO.TotalPayment
                         FROM Vehicle_order VO
                         INNER JOIN UserDetails_tbl U ON VO.User_Id = CAST(U.Id AS NVARCHAR)
                         INNER JOIN Vehicles_tbl V ON VO.vehicleID = CAST(V.Id AS NVARCHAR)
                         WHERE VO.Id = @OrderId";

                da = new SqlDataAdapter(query, ac.startCon());
                da.SelectCommand.Parameters.AddWithValue("@OrderId", orderId);

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];

                    txtName.Text = row["CustomerName"].ToString();
                    txtEmail.Text = row["CustomerEmail"].ToString();
                    txtPhone.Text = row["CustomerPhone"].ToString();
                    txtOrderDate.Text = row["OrderDate"].ToString();
                    txtvehicelName.Text = row["VehicleName"].ToString();
                    txtCompany.Text = row["VehicleCompany"].ToString();
                    txtProduct.Text = row["VehicleProduct"].ToString();
                    txtState.Text = row["VehicleState"].ToString();
                    txtCity.Text = row["VehicleCity"].ToString();
                    txtTotalDays.Text = row["TotalDays"].ToString();
                    txtTotalPayments.Text = row["TotalPayment"].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order not found!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vehicles_Orders.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("Update Vehicle_order set Status = '" + drpOrderStatus.SelectedValue + "' where Id = '" + Request.QueryString["orderId"] + "'", ac.startCon());
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order Status Updated!');", true);

        }
    }
}