using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace KrishiSadhana.assets.css
{
    public partial class Cart : System.Web.UI.Page
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Main_Class mc = new Main_Class();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
            }
            else
            {
                Response.Redirect("Home.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to view cart!');", true);
            }

            if (!IsPostBack)
            {
                displayProducts();
            }

        }

        protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if(e.CommandName  == "cmd_rem")
            {
                cmd = new SqlCommand("Delete from Cart_tbl where Id = '" + id + "'", mc.startCon());
                cmd.ExecuteNonQuery();
                displayProducts();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Item Removed from Cart!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Cannot remove item from Cart!');", true);

            }
        }

        //fetch cart details
        //public void displayProducts()
        //{
        //    da = new SqlDataAdapter("SELECT c.Id, p.Name, CAST(p.Sell_Price AS DECIMAL(10,2)) AS Sell_Price, p.Image, CAST(c.quantity AS INT) AS quantity, (CAST(c.quantity AS INT) * CAST(p.Sell_Price AS DECIMAL(10,2))) AS Total FROM Cart_tbl c JOIN Products_tbl p ON c.pro_id = p.Id WHERE c.user_id = '" + Session["userId"] + "'", mc.startCon());
        //    ds = new DataSet();
        //    da.Fill(ds);

        //    ProductGrid.DataSource = ds;
        //    ProductGrid.DataBind();
        //}

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

            // Set GrandTotal to Label
            if (ds.Tables[0].Rows.Count > 0)
            {
                decimal grandTotal = Convert.ToDecimal(ds.Tables[0].Rows[0]["GrandTotal"]);
                lblTotalCartAmount.Text = "₹ " + grandTotal.ToString("0.00");
            }
            else
            {
                lblTotalCartAmount.Text = "₹ 0.00";
            }
        }


        protected override void Render(HtmlTextWriter writer)
        {
            foreach (GridViewRow row in ProductGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    ImageButton editButton = (ImageButton)row.FindControl("ImageButton1");
                    if (editButton != null)
                    {
                        Page.ClientScript.RegisterForEventValidation(editButton.UniqueID, editButton.CommandArgument);
                    }
                }
            }
            base.Render(writer);
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {

        }
    }
}