using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace KrishiSadhana
{
    public partial class Address : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();
        string totalAmount;

        protected void Page_Load(object sender, EventArgs e)
        {

            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                lblLogout.Visible = true;
                lblProfile.Visible = true;

                totalAmount = Request.QueryString["grandTotal"];

                if(Request.QueryString["grandTotal"] != null)
                {
                    lblTotalAmount.Text = "Total Amount : " + totalAmount;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Can not fetch total amount!');", true);
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to Continue!');", true);
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrWhiteSpace(txtName.Text) || !string.IsNullOrWhiteSpace(txtPhone.Text) || !string.IsNullOrWhiteSpace(txtEmail.Text) || !string.IsNullOrWhiteSpace(txtAddress.Text) || !string.IsNullOrWhiteSpace(txtCity.Text) || !string.IsNullOrWhiteSpace(txtStates.Text) || !string.IsNullOrWhiteSpace(txtPincode.Text))
            {
                Session["shipName"] = txtName.Text;
                Session["shipPhone"] = txtPhone.Text;
                Session["shipEmail"] = txtEmail.Text;
                Session["shipNote"] = txtNote.Text;
                Session["shipAddress"] = txtAddress.Text;
                Session["shipCity"] = txtCity.Text;
                Session["shipLandmark"] = txtLandmark.Text;
                Session["shipState"] = txtStates.Text;
                Session["shipPincode"] = txtPincode.Text;
                Session["totalPrice"] = totalAmount;
                
                if(txtNote.Text != "")
                {
                    Session["note"] = txtNote.Text;
                }
                else
                {
                    Session["note"] = "No note provided";

                }

                if (txtLandmark.Text != "")
                {
                    Session["landmark"] = txtLandmark.Text;
                }
                else
                {
                    Session["landmark"] = "No Landmark provided";

                }

                Response.Redirect("Checkout.aspx");
                
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill necessary details!');", true);
            }
        }
    }
}