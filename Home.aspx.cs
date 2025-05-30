﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana
{
    public partial class Home : System.Web.UI.Page
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

            displaySeeds();

        }

        public void displaySeeds()
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


            dlSeeds.DataSource = pg;
            dlSeeds.DataBind();
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

        protected void dataListCrops_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}