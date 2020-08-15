using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Models
{
    public class Books
    {public int BookId { get; set; }
        public string BookName { get; set; }
        public string Description { get; set; }
        public int Cost { get; set; }
        public string Category { get; set; }
        public int AuthorId { get; set; }
        public string AuthorName { get; set; }
       public DateTime PublishDate {get;set;}
       public int Quantity { get; set; }
        public bool isbookavailable { get; set; }
      public DateTime CreatedDate { get; set; }
       public int  ModifiedBy { get; set; }
    public DateTime ModifiedDate { get; set; }
    public int CreatedBy { get; set; }
    }

    public class Bookdetails
    {
        // this class is used for database connectivity

        SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;Initial Catalog=Library_Management_System;Integrated Security=true");



        public List<Books> getbooks()
        {
            List<Books> listobj = new List<Books>();

            SqlCommand cmd = new SqlCommand("sp_Books", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                Books obj = new Books();
                obj.BookName = Convert.ToString(dr["BookName"]);
                obj.Category = Convert.ToString(dr["Category"]);
                obj.AuthorName = Convert.ToString(dr["AuthName"]);
                obj.PublishDate = Convert.ToDateTime(dr["publishdate"]);
                listobj.Add(obj);
            }

            return listobj;

        }


        public int insertbooks(Books bk)
        {
            SqlCommand cmd = new SqlCommand("spr_insertBook", con);
            
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@BookName",bk.BookName);
            cmd.Parameters.AddWithValue("@Description", bk.Description);
            cmd.Parameters.AddWithValue("@Cost", bk.Cost);
            cmd.Parameters.AddWithValue("@Category", bk.Category);
            cmd.Parameters.AddWithValue("@AuthorId", bk.AuthorId);
            cmd.Parameters.AddWithValue("@PublishDate", bk.PublishDate);
            cmd.Parameters.AddWithValue("@Quantity", bk.Quantity);
            cmd.Parameters.AddWithValue("@isbookvaialable", bk.isbookavailable);
            cmd.Parameters.AddWithValue("@ModifiedBy", 1);
            cmd.Parameters.AddWithValue("@CreatedBy",1);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }

        public int UpdateBooks(Books bk)
        {
            SqlCommand cmd = new SqlCommand("spr_updateBookDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@BookId", bk.BookId);
            cmd.Parameters.AddWithValue("@BookName", bk.BookName);
            cmd.Parameters.AddWithValue("@Description", bk.Description);
            cmd.Parameters.AddWithValue("@Cost", bk.Cost);
            cmd.Parameters.AddWithValue("@Category", bk.Category);
            cmd.Parameters.AddWithValue("@AuthorId", bk.AuthorId);
            cmd.Parameters.AddWithValue("@PublishDate", bk.PublishDate);
            cmd.Parameters.AddWithValue("@Quantity", bk.Quantity);
            cmd.Parameters.AddWithValue("@isbookvaialable", bk.isbookavailable);
            cmd.Parameters.AddWithValue("@ModifiedBy", bk.ModifiedBy);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;

        }


        public int DeleteBooks(int? id)
        {
            SqlCommand cmd = new SqlCommand("spr_deleteBookDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("BookId", id);

            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;

        }

    }


}