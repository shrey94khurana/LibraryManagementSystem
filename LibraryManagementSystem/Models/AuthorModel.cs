using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LibraryManagementSystem.Models
{
    public class AuthorModel
    {
        public int AuthorId { get; set; }
        public string AuthorName { get; set; }
        public string AuthorDesc { get; set; }

    }



    public class AuthorContext {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        public List<AuthorModel> GetAuthors()
        {
            List<AuthorModel> listobj = new List<AuthorModel>();
            SqlCommand cmd = new SqlCommand("spr_getAuthorDetails",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                AuthorModel obj = new AuthorModel();
                obj.AuthorId = Convert.ToInt32(dr[0]);
                obj.AuthorName = Convert.ToString(dr[1]);
                obj.AuthorDesc = Convert.ToString(dr[2]);
                listobj.Add(obj);
            }

            return listobj;
           

        }

        public int SaveAuthor(AuthorModel obj)
        {
            SqlCommand cmd = new SqlCommand("spr_insertAuthor", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@AuthName", obj.AuthorName);
            cmd.Parameters.AddWithValue("@Description", obj.AuthorDesc);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;

        }

        public AuthorModel GetAuthorById(int? id)
        {
            AuthorModel obj = new AuthorModel();
            SqlCommand cmd = new SqlCommand("spr_getAuthorDetailsbyId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AuthId", id);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                obj.AuthorId = Convert.ToInt32(dr[0]);
                obj.AuthorName = Convert.ToString(dr[1]);
                obj.AuthorDesc = Convert.ToString(dr[2]);


            }

            return obj;
        }

        public int UpdateAuthor(AuthorModel obj)
        {
            SqlCommand cmd = new SqlCommand("spr_updateAuthorDetails", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@AuthId", obj.AuthorId);
            cmd.Parameters.AddWithValue("@AuthName", obj.AuthorName);
            cmd.Parameters.AddWithValue("@Description", obj.AuthorDesc);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;

        }


        public int DeleteAuthor(int? id)
        {
            SqlCommand cmd = new SqlCommand("spr_deleteAuthorDetails", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("AuthId", id);

            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;

        }



    }
}