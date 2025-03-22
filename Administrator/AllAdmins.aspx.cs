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
    public partial class AllAdmins : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Admin_Class ac = new Admin_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_Class.checkAdmin();
            displayAdmins();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text == txtConfirmPassword.Text)
            {
                ac.insertAdmin(txtName.Text, txtEmail.Text, txtPassword.Text);
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", @"
                var myModal = bootstrap.Modal.getInstance(document.getElementById('crudModal'));
                if (myModal) {
                    myModal.hide();
                }
                alert('New Admin Added Successfully!');

                ", true);

                txtName.Text = null;
                txtEmail.Text = null;            
                txtPassword.Text = null;
                txtConfirmPassword.Text = null;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password are not matching!');", true);
            }
        }

        void displayAdmins()
        {
            da = new SqlDataAdapter("select * from AdminDetails_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            AdminGrid.DataSource = ds;
            AdminGrid.DataBind();
        }

        protected void AdminGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if(e.CommandName == "cmd_dlt")
            {
                ac.deleteAdmin(id);
                displayAdmins();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Admin Removed!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Id not found row command!');", true);

            }
        }
    }
}