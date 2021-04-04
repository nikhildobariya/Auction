using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Data;
using System.IO;

namespace AuctionManagementSystem
{
    public partial class removeitem : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                String qs = Request.QueryString["id"].ToString();
                id = Convert.ToInt32(qs);
                cn.Open();
                if (Request.QueryString["msg"].ToString() == "il")
                {
                    cmd = new SqlCommand("delete from tblItem where Iid=@i and status='A'", cn);
                    cmd.Parameters.AddWithValue("@i", id);
                    int c = cmd.ExecuteNonQuery();
                    cn.Close();
                    if (c != 0)
                    {
                        Response.Redirect("itemlist.aspx?msg=Item remove succesfully");
                    }
                    else
                    {
                        Response.Redirect("itemlist.aspx?msg=Item is added to auction remove not possible!");
                    }
                }
                if (Request.QueryString["msg"].ToString() == "al")
                {
                    cmd = new SqlCommand("select Startdate,Iid from tblAuction where aid=@i", cn);
                    cmd.Parameters.AddWithValue("@i", id);
                    SqlDataReader rd = cmd.ExecuteReader();
                    rd.Read();
                    int tempid = Convert.ToInt32(rd["Iid"].ToString());

                    DateTime sd = Convert.ToDateTime(rd["Startdate"].ToString());
                    DateTime today = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    rd.Close();
                    cn.Close();
                    int diff = Convert.ToInt32((sd - today).TotalDays.ToString());
                    if (diff>=0)
                    {
                        cn.Open();
                        cmd = new SqlCommand("update tblItem set status='A' where Iid=@iid",cn);
                        cmd.Parameters.AddWithValue("@iid", tempid);
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("delete from tblAuction where aid=@i", cn);
                        cmd.Parameters.AddWithValue("@i", id);
                        cmd.ExecuteNonQuery();
                        cn.Close();
                        Response.Redirect("auctionlist.aspx?msg=Item remove succesfully");
                    }
                    else if (diff < 0)
                    {
                        Response.Redirect("auctionlist.aspx?msg=auction is already done");
                    }
                    else
                    {
                        Response.Redirect("auctionlist.aspx?msg=auction is not cancel at this stage");
                    }
                    

                }
               
            }
            else
            {
                
                Response.Redirect("itemlist.aspx");
            }
        }
    }
}