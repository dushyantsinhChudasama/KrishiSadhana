using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace KrishiSadhana.Administrator
{
    public partial class Categoreis : System.Web.UI.Page
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
            dispCategories();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ac.insertCategories(txtName.Text);


            //closing the modal
            ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", @"
            var myModal = bootstrap.Modal.getInstance(document.getElementById('crudModal'));
            if (myModal) {
                myModal.hide();
            }
            alert('New Category Added Successfully!');

            ", true);

            txtName.Text = null;
           dispCategories();

        }



        //Displaying Categories

        void dispCategories()
        {
            da = new SqlDataAdapter("Select * From Categories_tbl", ac.startCon());
            ds = new DataSet();
            da.Fill(ds);

            CategoryGrid.DataSource = ds;
            CategoryGrid.DataBind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {

        }

        protected void CategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if(e.CommandName == "cmd_dlt")
            {
                ac.deleteCategory(id);
                dispCategories();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('ID not found!');", true);
            }
        }


    }
}