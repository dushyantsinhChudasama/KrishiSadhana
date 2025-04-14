using Newtonsoft.Json;
using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana.assets.css
{
    public partial class Checkout : System.Web.UI.Page
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();

        decimal totalPrice = 0;
        decimal shippingCharges = 0;

        //key and private for razorpay payment gateway
        private const string _key = "rzp_test_WMeR23Dk8MlH2R";
        private const string _secret = "8qFHW3Z8R2aEko8NdgDVPc8V";
        private decimal registrationAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();


                if (
                     Session["shipName"] == null || string.IsNullOrWhiteSpace(Session["shipName"].ToString()) ||
                     Session["shipPhone"] == null || string.IsNullOrWhiteSpace(Session["shipPhone"].ToString()) ||
                     Session["shipEmail"] == null || string.IsNullOrWhiteSpace(Session["shipEmail"].ToString()) ||
                     Session["shipAddress"] == null || string.IsNullOrWhiteSpace(Session["shipAddress"].ToString()) ||
                     Session["shipCity"] == null || string.IsNullOrWhiteSpace(Session["shipCity"].ToString()) ||
                     Session["shipState"] == null || string.IsNullOrWhiteSpace(Session["shipState"].ToString()) ||
                     Session["shipPincode"] == null || string.IsNullOrWhiteSpace(Session["shipPincode"].ToString()) ||
                     Session["totalPrice"] == null || string.IsNullOrWhiteSpace(Session["totalPrice"].ToString())
                    )
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Cannot fetch shipping details!');", true);
                    Response.Redirect("Address.aspx");
                    return; // 🔒 Prevents any code after redirect from running
                }
                displayProducts();
                lblShipping.Text = "40";
                lblTotalPrice.Text = Session["totalPrice"].ToString();

                // Remove currency symbols if present and parse values safely
                decimal.TryParse(lblTotalPrice.Text.Replace("₹", "").Trim(), out totalPrice);
                decimal.TryParse(lblShipping.Text.Replace("₹", "").Trim(), out shippingCharges);

                // Calculate net price
                decimal netPrice = totalPrice + shippingCharges;

                // Set Net Price Label
                lblNetPrice.Text = netPrice.ToString();

            }
            else
            {
                Response.Redirect("Home.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to Continue!');", true);
            }

        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            if(btnMakePayment.Text == "Make Payment")
            {
                //razorpay payment gateway
                registrationAmount = Convert.ToDecimal(lblNetPrice.Text);

                //creating session for total amount
                Session["NetAmount"] = registrationAmount;
                Session["paymentMode"] = "Online";

                decimal amountsinSubUnits = registrationAmount * 100;
                string currency = "INR";
                string name = "Krishi Sadhana";
                string description = "Pay securely with us Your details are safe with us!";
                string imageLogo = ""; // optional, can be left empty
                string profileName = Session["shipName"].ToString();
                string profileMobile = Session["shipPhone"].ToString();
                string profileEmail = Session["shipEmail"].ToString();
                Dictionary<string, string> notes = new Dictionary<string, string>()
                {
                    {"note 1", "This is payment note"}, {"note 2","This is another note, max 15 can be added"}
                };

                string orderId = CreateOrder(amountsinSubUnits, currency, notes);

                string jsFunction = $@"OpenPaymentWindow(""{_key}"", {amountsinSubUnits}, ""{currency}"", ""{name}"", ""{description}"", ""{imageLogo}"", ""{orderId}"", ""{profileName}"", ""{profileEmail}"", ""{profileMobile}"", '{JsonConvert.SerializeObject(notes)}');";

                ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);

            }

            else
            {
                //Generate order id
                string orderId = "order_" + GenerateRandomString(13);

                Session["paymentMode"] = "COD";
                Session["NetAmount"] = lblNetPrice.Text;

                Response.Redirect("Success.aspx?"+orderId);
            }
        }

        protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rblPaymentMethod.SelectedIndex == 0)
            {
                btnMakePayment.Text = "Make Payment";
            }
            if (rblPaymentMethod.SelectedIndex == 1)
            {
                btnMakePayment.Text = "Place Orders";
               
            }
        }

        public void displayProducts()
        {
            string query = @"
                            SELECT 
                                c.Id, 
                                p.Name, 
                                CAST(p.Sell_Price AS DECIMAL(10,2)) AS Sell_Price, 
                                p.Image, 
                                CAST(c.quantity AS INT) AS quantity, 
                                (CAST(c.quantity AS INT) * CAST(p.Sell_Price AS DECIMAL(10,2))) AS Total,
                                SUM(CAST(c.quantity AS INT) * CAST(p.Sell_Price AS DECIMAL(10,2))) OVER () AS GrandTotal
                            FROM 
                                Cart_tbl c 
                            JOIN 
                                Products_tbl p ON c.pro_id = p.Id 
                            WHERE 
                                c.user_id = '" + Session["userId"] + "'";

            da = new SqlDataAdapter(query, mc.startCon());
            ds = new DataSet();
            da.Fill(ds);

            // Bind to GridView
            ProductGrid.DataSource = ds;
            ProductGrid.DataBind();
        }

        //function for generating orderid : 

        private static string GenerateRandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                                  .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        //for razorpay
        private string CreateOrder(decimal amountsinSubunits, string currency, Dictionary<string, string> notes)
        {

            try
            {
                int paymentCapture = 1;

                RazorpayClient client = new RazorpayClient(_key, _secret);
                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("amount", amountsinSubunits);
                options.Add("currency", currency);
                options.Add("payment_capture", paymentCapture);
                options.Add("notes", notes);

                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                System.Net.ServicePointManager.Expect100Continue = false;

                Order orderResponse = client.Order.Create(options);
                var orderId = orderResponse.Attributes["id"].ToString();

                return orderId;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }


        }
    }
}