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
    public partial class Rental : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        
        Main_Class mc = new Main_Class();

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

        public void display()
        {
            da = new SqlDataAdapter("select * from Vehicles_tbl", mc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            dlVehicles.DataSource = ds;
            dlVehicles.DataBind();
        }


        protected void btnBook_Command(object sender, CommandEventArgs e)
        {
            int vehicleID = Convert.ToInt32(e.CommandArgument.ToString());
            ViewState["vehicleID"] = vehicleID;

            // Fetch data based on ID from your DB
            DataTable dt = GetVehicleDetailsById(vehicleID); // Your custom function

            if (dt.Rows.Count > 0)
            {
                lblVehicleName.Text = dt.Rows[0]["Name"].ToString();
                lblRentPerDay.Text = "₹" + dt.Rows[0]["Rent_Per_Day"].ToString() + "/day";

                // Store rent for later calculation
                ViewState["RentPerDay"] = Convert.ToDecimal(dt.Rows[0]["Rent_Per_Day"]);
                //store vehicle image
                ViewState["VehicleImage"] = dt.Rows[0]["Image"].ToString();
                

                // Open the modal using JavaScript
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#vehicleBookingModal').modal('show');", true);
            }
        }


        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            // Clear all fields
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            lblTotalDays.Text = "";
            lblTotalPayment.Text = "";

            // Optional: also clear vehicle info if needed
            lblVehicleName.Text = "";
            lblRentPerDay.Text = "";
            ViewState["RentPerDay"] = null;


            // Close the modal via JS (optional)
            ScriptManager.RegisterStartupScript(this, this.GetType(), "HideModal", "$('#vehicleBookingModal').modal('hide');", true);
        }



        private DataTable GetVehicleDetailsById(int vehicleId)
        {
            SqlConnection con = mc.startCon(); // assuming you have mc.startCon() returning SqlConnection
            SqlCommand cmd = new SqlCommand("SELECT Name, Rent_Per_Day,Image FROM Vehicles_tbl WHERE Id = @Id", con);

            SqlParameter idParam = new SqlParameter("@Id", SqlDbType.Int);
            idParam.Value = vehicleId;
            cmd.Parameters.Add(idParam);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

          
            da.Fill(ds);
           
            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }

            return new DataTable(); // Return empty table if no results
        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
            {
                DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
                DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

                if (endDate >= startDate)
                {
                    int totalDays = (endDate - startDate).Days + 1; // +1 to include both start and end date
                    lblTotalDays.Text = "Total Days: " + totalDays.ToString();

                    if (ViewState["RentPerDay"] != null)
                    {
                        decimal rentPerDay = Convert.ToDecimal(ViewState["RentPerDay"]);
                        decimal totalPayment = totalDays * rentPerDay;

                        //viewstater for total payment
                        ViewState["totalPayment"] = totalPayment;

                        lblTotalPayment.Text = "Total Payment: ₹" + totalPayment.ToString("0.00");
                    }
                    else
                    {
                        lblTotalPayment.Text = "Rent not found.";
                    }
                }
                else
                {
                    lblTotalDays.Text = "Invalid date range.";
                    lblTotalPayment.Text = "";
                }

                // Reopen modal on postback
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#vehicleBookingModal').modal('show');", true);
            }
        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
            {
                DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
                DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

                if (endDate >= startDate)
                {
                    int totalDays = (endDate - startDate).Days + 1;
                    lblTotalDays.Text = "Total Days: " + totalDays.ToString();

                    if (ViewState["RentPerDay"] != null)
                    {
                        decimal rentPerDay = Convert.ToDecimal(ViewState["RentPerDay"]);
                        decimal totalPayment = totalDays * rentPerDay;

                        //viewstater for total payment
                        ViewState["totalPayment"] = totalPayment;

                        lblTotalPayment.Text = "Total Payment: ₹" + totalPayment.ToString("0.00");
                    }
                    else
                    {
                        lblTotalPayment.Text = "Rent not available.";
                    }
                }
                else
                {
                    lblTotalDays.Text = "Invalid date range.";
                    lblTotalPayment.Text = "";
                }

                // Reopen modal on postback
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#vehicleBookingModal').modal('show');", true);
            }
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            if (lblName.Text == "Login")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to book a vehicle!');", true);
                return;
            }

            if (ViewState["totalPayment"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Total payment is missing.');", true);
                return;
            }

            if (ViewState["vehicleID"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Vehicle ID is missing.');", true);
                return;
            }

            if (ViewState["VehicleImage"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Vehicle Image is missing.');", true);
                return;
            }

            // If everything is okay
            string totalDays = lblTotalDays.Text.Replace("Total Days: ", "").Trim();
            string totalPayment = lblTotalPayment.Text.Replace("Total Payment: ₹", "").Trim();

            mc.insertVehicleOrder(
                ViewState["vehicleID"].ToString(),
                ViewState["VehicleImage"].ToString(),
                lblVehicleName.Text,
                txtStartDate.Text,
                txtEndDate.Text,
                totalDays,
                totalPayment,
                Session["userId"].ToString()
            );

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessMsg", "setTimeout(function() { alert('Thank you! Vehicle is booked, we\\'ll contact you soon.'); }, 500);", true);


        }

    }
}