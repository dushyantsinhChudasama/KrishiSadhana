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
    public partial class MyVehicleBookings : System.Web.UI.Page
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
                displayVehicleOrders();
            }
            else
            {
                lblName.Text = "Login";
                Response.Redirect("Home.aspx");
            }
        }

        public void displayVehicleOrders()
        {
            da = new SqlDataAdapter("Select * From Vehicle_order where User_id = '" + Userid + "'", mc.startCon());
            ds = new DataSet();

            da.Fill(ds);

            VehiclesGrid.DataSource = ds;
            VehiclesGrid.DataBind();
        }
    }
}