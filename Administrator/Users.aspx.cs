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
    public partial class Users : System.Web.UI.Page
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
            displayUsers();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text == txtConfirmPassword.Text)
            {
                ac.insertUser(txtName.Text, txtEmail.Text, rbGender.SelectedValue, txtMobile.Text, txtPassword.Text);
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", @"
                var myModal = bootstrap.Modal.getInstance(document.getElementById('crudModal'));
                if (myModal) {
                    myModal.hide();
                }
                alert('New User Added Successfully!');

                ", true);

                txtName.Text = null;
                txtEmail.Text = null;
                txtMobile.Text = null;
                txtPassword.Text = null;
                txtConfirmPassword.Text = null;
                rbGender.ClearSelection();
                displayUsers();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password are not matching!');", true);
            }
        }

        void displayUsers()
        {
            da = new SqlDataAdapter("select * from UserDetails_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            UserGrid.DataSource = ds;
            UserGrid.DataBind();
        }

        protected void CategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if(e.CommandName == "cmd_dlt")
            {
                ac.deleteUser(id);
                displayUsers();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User removed!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('ID not found!');", true);
            }
        }
    }
}