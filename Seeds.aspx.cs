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
    public partial class Seeds : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();

        PagedDataSource pg;
        int p, row;

        protected void Page_Load(object sender, EventArgs e)
        {
            display();
        }

        void display()
        {

            da = new SqlDataAdapter("select * from Products_tbl", mc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
            pg.AllowPaging = true;
            pg.PageSize = 5;
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);


            dataListCrops.DataSource = pg;
            dataListCrops.DataBind();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            btnPrev.Enabled = true;
            p += Convert.ToInt32(ViewState["pid"]) - 1;
            ViewState["pid"] = Convert.ToInt32(p);
            if (p == 0)
            {
                btnPrev.Enabled = false;
                //LinkButton4.Enabled = false;
            }
            display();

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            btnNext.Enabled = true;

            p += Convert.ToInt32(ViewState["pid"]) + 1;
            ViewState["pid"] = Convert.ToInt32(p);
            int temp = row / pg.PageSize;
            if (p == temp)
            {
                btnNext.Enabled = false;
            }
            display();

        }

        protected void btnView_Click(object sender, EventArgs e)
        {

        }

        protected void btnCart_Click(object sender, EventArgs e)
        {

        }

        protected void dataListCrops_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}