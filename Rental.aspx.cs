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
    public partial class Rental : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        
        Main_Class mc = new Main_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            display();
        }

        public void display()
        {
            da = new SqlDataAdapter("select * from Vehicles_tbl", mc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            dlVehicles.DataSource = ds;
            dlVehicles.DataBind();
        }
    }
}