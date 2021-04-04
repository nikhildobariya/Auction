using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace AuctionManagementSystem
{
    public partial class activedeactive : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"].ToString()=="item")
            {
                cn.Open();
                cmd = new SqlCommand("select Status from tblAuction where aid=@id", cn);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                String st = cmd.ExecuteScalar().ToString();
                if (st == "A")
                {
                    cmd = new SqlCommand("update tblAuction set Status='D' where aid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    cmd.ExecuteNonQuery();
                }
                else if (st == "D")
                {
                    cmd = new SqlCommand("update tblAuction set Status='A' where aid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    cmd.ExecuteNonQuery();
                }
                cn.Close();
                Response.Redirect("auctionitemlist.aspx");
            }
            if (Request.QueryString["msg"].ToString() == "user")
            {
                cn.Open();
                cmd = new SqlCommand("select Status from tblUser where id=@id", cn);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                String st = cmd.ExecuteScalar().ToString();
                if (st == "A")
                {
                    cmd = new SqlCommand("update tblUser set Status='D' where id=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    cmd.ExecuteNonQuery();
                }
                else if (st == "D")
                {
                    cmd = new SqlCommand("update tblUser set Status='A' where id=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    cmd.ExecuteNonQuery();
                }
                cn.Close();
                Response.Redirect("userlist.aspx");
                cn.Close();
            }
        }

    }
}