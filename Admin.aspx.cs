using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace KrishiSadhana
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;

        Admin_Class ac;

        protected void Page_Load(object sender, EventArgs e)
        {
            getCon();
            fillGrid();
        }

        public void getCon()
        {
            ac = new Admin_Class();
            ac.startCon();
        }

        public void fillGrid()
        {
            ac = new Admin_Class();
            getCon();
            GridView1.DataSource = ac.fillgrid();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            ViewState["id"] = id;
            if(e.CommandName == "cmd_edt")
            {
                Button1.Text = "Update";
                filltext();
            }
            else
            {
                ac = new Admin_Class();
                ac.delete(Convert.ToInt32(ViewState["id"]));
                fillGrid();
            }
        }

        void filltext()
        {
            ac = new Admin_Class();
            getCon();

            ds = new DataSet();
            ds = ac.select(Convert.ToInt32(ViewState["id"]));

            txtNm.Text = ds.Tables[0].Rows[0][1].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0][2].ToString();
            txtGender.Text = ds.Tables[0].Rows[0][3].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0][4].ToString();
            txtPassword.Text = ds.Tables[0].Rows[0][5].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getCon();
            if(Button1.Text == "Save")
            {
                ac = new Admin_Class();
                ac.insert(txtNm.Text, txtEmail.Text, txtGender.Text, txtPhone.Text, txtPassword.Text);
                fillGrid();
            }
            else
            {
                ac = new Admin_Class();
                ac.update(Convert.ToInt32(ViewState["id"]), txtNm.Text, txtEmail.Text, txtGender.Text, txtPhone.Text, txtPassword.Text);
                fillGrid();
            }
        }
    }
}