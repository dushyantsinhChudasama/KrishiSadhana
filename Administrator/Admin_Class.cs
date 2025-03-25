using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace KrishiSadhana.Administrator
{
    public class Admin_Class
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;

        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlConnection startCon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        //for cehcking admin is logged in or not
        public static void checkAdmin()
        {
            if (HttpContext.Current.Session["admin"] == null)
            {
                HttpContext.Current.Response.Redirect("Login.aspx");
            }
        }

        public void insertAdmin(string name, string email, string password)
        {
            cmd = new SqlCommand("insert into AdminDetails_tbl (Name, Email, Password) " +
                "values ('" + name + "', '" + email + "', '" + password + "')", con);

            cmd.ExecuteNonQuery();
        }


        //For inserting categories
        public void insertCategories(string name)
        {
            startCon();
            cmd = new SqlCommand("Insert into Categories_tbl (Name) values ('" + name + "')", con);
            cmd.ExecuteNonQuery();
        }

        //deleting category
        public void deleteCategory(int id)
        {
            startCon();
            cmd = new SqlCommand("Delete from Categories_tbl where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        //For inserting new user
        public void insertUser(string name, string email, string gender, string phone, string password)
        {
            startCon();
            cmd = new SqlCommand("Insert into UserDetails_tbl (Name, Email, Gender, Phone, Password) values ('" + name + "', '" + email + "', '" + gender + "', '" + phone + "', '" + password + "')", con);
            cmd.ExecuteNonQuery();
        }

        //for deleting user
        public void deleteUser(int id)
        {
            startCon();
            cmd = new SqlCommand("Delete from UserDetails_tbl where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
        }


        //for inserting admin code is above

        //for deleting admin
        public void deleteAdmin(int id)
        {
            startCon();
            cmd = new SqlCommand("Delete from AdminDetails_tbl where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        //for inserting Products

        public void insertProducts(string name, string category, string ori_price, string selling_price, string dicsount, string qty, string origin, string slug, string image, string desc)
        {
            startCon();
            cmd = new SqlCommand("Insert into Products_tbl (Name, Category, Ori_Price, Sell_Price, Discount, Current_Qty, Origin, Slug, Image, Description) values ('" + name + "', '" + category + "', '" + ori_price + "', '" + selling_price + "', '" + dicsount + "', '" + qty + "', '" + origin + "', '" + slug + "', '" + image + "', '"+desc+"')", con);
            cmd.ExecuteNonQuery();
        }

        //fetching product details for Editing

        public DataSet fetchProduct(int id)
        {
            startCon();
            da = new SqlDataAdapter("Select * from Products_tbl where Id ='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        //updating product details
        public void updateProduct(string Name, string category, string ori_price, string selling_price, string discount, string qty, string origin, string slug, string desc, int id)
        {
            startCon();

            //getting date to update value of LastUpdated column
            DateTime currentDate = DateTime.Today;

            cmd = new SqlCommand("Update Products_tbl set Name = '" + Name + "', Category = '" + category + "', Ori_Price = '" + ori_price + "', Sell_Price = '" + selling_price + "', Discount = '" + discount + "', Current_Qty = '" + qty + "', Origin = '" + origin + "', Slug = '" + slug + "', LastUpdated = '" + currentDate + "', Description = '" + desc + "' Where Id = '"+id+"'", con);
            cmd.ExecuteNonQuery();
        }

    }
}