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
    public partial class Crops : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pg;
        Main_Class mc = new Main_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            display();
        }

        void display()
        {

            da = new SqlDataAdapter("select * from Products_tbl", mc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            pg = new PagedDataSource();
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.AllowPaging = true;
            pg.PageSize = 2;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["PageIndex"]);


            dataListCrops.DataSource = ds;
            dataListCrops.DataBind();
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {

        }

        protected void dataListCrops_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {

        }
    }
}