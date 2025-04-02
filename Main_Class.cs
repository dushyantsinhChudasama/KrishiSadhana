using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace KrishiSadhana
{
    public class Main_Class
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


        //Registering user
        public void insert(string name, string email, string gender, string phone, string password)
        {
            startCon();
            cmd = new SqlCommand("insert into UserDetails_tbl (Name, Email, Gender,  Phone, Password) " +
                "values ('" + name + "', '" + email + "', '"+gender+"', '" + phone + "', '" + password + "')", con);

            cmd.ExecuteNonQuery();
        }

        //for contact detasils
        public void insertUserQuery(string name, string email, string phone, string subject, string message)
        {
            startCon();
            cmd = new SqlCommand("Insert into User_Queries_tbl (Name, Email, Phone, Subject, Message) values('" + name + "', '" + email + "', '" + phone + "', '" + subject + "', '" + message + "')", con);
            cmd.ExecuteNonQuery();
        }

        //method to fetch product details for Product_Detasils.aspx
        public DataSet getProduct(int id)
        {
            startCon();
            da = new SqlDataAdapter("SELECT p.*, c.Name AS CategoryName FROM products_tbl p JOIN Categories_tbl c ON p.Category = c.Id where p.Id = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        //for adding product to cart from product page not from product details page
        public void insertIntoCart(int user_id, int pro_id)
        {
            startCon();
            cmd = new SqlCommand("Insert into Cart_tbl (user_id, pro_id) VALUES ('" + user_id + "' ,'" + pro_id + "')", con);
            cmd.ExecuteNonQuery();
        }

    }
}