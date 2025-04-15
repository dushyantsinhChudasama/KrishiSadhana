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
            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                lblLogout.Visible = true;
                lblProfile.Visible = true;
            }
            else
            {
                lblName.Text = "Login";
            }
            display();
        }

        void display()
        {

            //da = new SqlDataAdapter("select * from Products_tbl", mc.startCon());

            da = new SqlDataAdapter("SELECT p.* FROM Products_tbl p JOIN Categories_tbl c ON p.Category = c.Id WHERE c.Name = 'Seeds';", mc.startCon());

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

        protected void dataListCrops_ItemCommand(object source, DataListCommandEventArgs e)
        {
            ViewState["proid"] = e.CommandArgument;

            if (e.CommandName == "cmd_view")
            {
                Response.Redirect("Product_Details.aspx?ProId=" + ViewState["proid"]);
            }

            if (e.CommandName == "cmd_cart")
            {

                if (lblName.Text == "Login")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to add to cart!');", true);
                }
                else
                {
                    int pro_id = Convert.ToInt32(ViewState["proid"]);
                    int user_id = Convert.ToInt32(Session["userId"]);
                    mc.insertIntoCart(user_id, pro_id);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Item Added to cart!');", true);
                }


            }
        }

        protected void dataListCrops_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}