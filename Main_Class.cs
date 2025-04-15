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
                "values ('" + name + "', '" + email + "', '" + gender + "', '" + phone + "', '" + password + "')", con);

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

        //for adding product to cart from prodcut details page with quantity

        public void insertIntoCartWithQuantity(int user_id, int pro_id, int qty)
        {
            startCon();
            cmd = new SqlCommand("Insert into Cart_tbl (user_id, pro_id, quantity) VALUES ('" + user_id + "' ,'" + pro_id + "', '" + qty + "')", con);
            cmd.ExecuteNonQuery();
        }

        //for adding booking in vehicle order table
        public void insertVehicleOrder(string vehicleID, string vehicleImage, string vehicleName, string startDate, string endDate, string totalDays, string totalPayment, string userId)
        {
            cmd = new SqlCommand("Insert into Vehicle_order (vehicleID, vehicleImage, vehicleName, startDate ,endDate, TotalDays, TotalPayment, User_Id) VALUES ('" + vehicleID + "', '" + vehicleImage + "', '" + vehicleName + "', '" + startDate + "', '" + endDate + "', '" + totalDays + "', '" + totalPayment + "', '" + userId + "')", startCon());
            cmd.ExecuteNonQuery();
        }

        //update user information

        //for update name and gender

        public void updateNameGender(string name, string gender, string id)
        {
            cmd = new SqlCommand("Update UserDetails_tbl set Name = '" + name + "', Gender = '" + gender + "' Where Id = '" + id + "'", startCon());
            cmd.ExecuteNonQuery();
        }

        //for updating email 
        public void updateEmail(string email, string id)
        {
            cmd = new SqlCommand("Update UserDetails_tbl set Email = '" + email + "' Where Id = '" + id + "'", startCon());
            cmd.ExecuteNonQuery();
        }

        //for updating mobilenumber
        public void updateMobileNumber(string mobile, string id)
        {
            cmd = new SqlCommand("Update UserDetails_tbl set Phone = '" + mobile + "' Where Id = '" + id + "'", startCon());
            cmd.ExecuteNonQuery();
        }
    }
}