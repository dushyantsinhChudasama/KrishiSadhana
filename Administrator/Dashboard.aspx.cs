using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace KrishiSadhana.Administrator
{
    public partial class Dashboard : System.Web.UI.Page
    {
        Admin_Class ac = new Admin_Class();
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();
            displayDetails();
        }

        public void displayDetails()
        {
            SqlConnection con = ac.startCon();

            // New Orders (Pending)
            SqlDataAdapter newOrder = new SqlDataAdapter("SELECT COUNT(*) FROM Orders_tbl WHERE Status = 'Pending'", con);
            DataSet dsNewOrder = new DataSet();
            newOrder.Fill(dsNewOrder);
            lblnewOrders.Text = dsNewOrder.Tables[0].Rows[0][0].ToString();

            // Cancelled Orders
            SqlDataAdapter cancelOrder = new SqlDataAdapter("SELECT COUNT(*) FROM Orders_tbl WHERE Status = 'Canceled'", con);
            DataSet dsCancelOrder = new DataSet();
            cancelOrder.Fill(dsCancelOrder);
            lblCancelorder.Text = dsCancelOrder.Tables[0].Rows[0][0].ToString();

            // Delivered Orders
            SqlDataAdapter deliveredOrder = new SqlDataAdapter("SELECT COUNT(*) FROM Orders_tbl WHERE Status = 'Delivered'", con);
            DataSet dsDeliveredOrder = new DataSet();
            deliveredOrder.Fill(dsDeliveredOrder);
            lblshippedorder.Text = dsDeliveredOrder.Tables[0].Rows[0][0].ToString();

            // Total Vehicles
            SqlDataAdapter totalVehicles = new SqlDataAdapter("SELECT COUNT(*) FROM Vehicles_tbl", con);
            DataSet dsVehicles = new DataSet();
            totalVehicles.Fill(dsVehicles);
            lblVehicles.Text = dsVehicles.Tables[0].Rows[0][0].ToString();

            // Vehicle Orders (Pending)
            SqlDataAdapter vehiclesOrder = new SqlDataAdapter("SELECT COUNT(*) FROM Vehicle_order WHERE Status = 'Pending'", con);
            DataSet dsVehicleOrder = new DataSet();
            vehiclesOrder.Fill(dsVehicleOrder);
            lblVehiclesOrder.Text = dsVehicleOrder.Tables[0].Rows[0][0].ToString();

            // Completed Vehicle Orders
            SqlDataAdapter completedVehicle = new SqlDataAdapter("SELECT COUNT(*) FROM Vehicle_order WHERE Status = 'Completed'", con);
            DataSet dsCompletedVehicle = new DataSet();
            completedVehicle.Fill(dsCompletedVehicle);
            lblCompletedVehicleOrder.Text = dsCompletedVehicle.Tables[0].Rows[0][0].ToString();

            // Total Users
            SqlDataAdapter totalUser = new SqlDataAdapter("SELECT COUNT(*) FROM UserDetails_tbl", con);
            DataSet dsUsers = new DataSet();
            totalUser.Fill(dsUsers);
            lblTotalUser.Text = dsUsers.Tables[0].Rows[0][0].ToString();

            // Total User Queries
            SqlDataAdapter totalUserQueries = new SqlDataAdapter("SELECT COUNT(*) FROM User_Queries_tbl", con);
            DataSet dsUserQueries = new DataSet();
            totalUserQueries.Fill(dsUserQueries);
            lblTotalUserQueries.Text = dsUserQueries.Tables[0].Rows[0][0].ToString();

            // Total Admins
            SqlDataAdapter totalAdmins = new SqlDataAdapter("SELECT COUNT(*) FROM AdminDetails_tbl", con);
            DataSet dsAdmins = new DataSet();
            totalAdmins.Fill(dsAdmins);
            lblTotalAdmins.Text = dsAdmins.Tables[0].Rows[0][0].ToString();
        }

    }
}