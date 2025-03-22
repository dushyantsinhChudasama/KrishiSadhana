using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace KrishiSadhana
{
    public class Admin_Class
    {
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;

        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public void insert(string name, string email, string gender, string phone, string password)
        {
            startCon();
            cmd = new SqlCommand("insert into UserDetails_tbl (Name, Email, Gender,  Phone, Password) " +
                "values ('" + name + "', '" + email + "', '" + gender + "', '" + phone + "', '" + password + "')", con);

            cmd.ExecuteNonQuery();
        }

        public void startCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public DataSet fillgrid()
        {
            startCon();

            da = new SqlDataAdapter("select * from UserDetails_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        public DataSet select(int id)
        {
            startCon();

            da = new SqlDataAdapter("select * from UserDetails_tbl where Id = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        public void update(int id, string nm, string email, string gen, string phn, string pwd)
        {
            startCon();

            cmd = new SqlCommand("update UserDetails_tbl set Name = '" + nm + "', Email = '" + email + "', Gender = '" + gen + "', Phone = '" + phn + "', Password = '" + pwd + "' where Id = '"+id+"'", con);
            cmd.ExecuteNonQuery();
        }

        public void delete(int id)
        {
            startCon();

            cmd = new SqlCommand("delete from UserDetails_tbl where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
        }


    }
}