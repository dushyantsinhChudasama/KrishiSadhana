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
    public partial class Vehicles_Orders : System.Web.UI.Page
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

        public void displayOrder()
        {
            da = new SqlDataAdapter("Select * From Vehicle_order", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            VehiclesGrid.DataSource = ds;
            VehiclesGrid.DataBind();
        }
    }
}