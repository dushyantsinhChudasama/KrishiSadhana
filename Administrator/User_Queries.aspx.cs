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
    public partial class User_Queries : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac = new Admin_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();
            displayQueries();
        }

        public void displayQueries()
        {
            da = new SqlDataAdapter("Select * from User_Queries_tbl where Seen = 0", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            UserQueriesGrid.DataSource = ds;
            UserQueriesGrid.DataBind();
        }

        protected void CategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "cmd_dlt")
            {
                cmd = new SqlCommand("Update User_Queries_tbl set Seen = '" + 1 + "' where Id = '" + id + "'", ac.startCon());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Marked as readed!');", true);
                displayQueries();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('ID not found!');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}