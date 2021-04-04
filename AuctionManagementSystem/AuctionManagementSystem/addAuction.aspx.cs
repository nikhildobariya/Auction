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
    public partial class addAuction : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtcdate.Text = DateTime.Now.ToShortDateString();
       
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
           
                if (Request.QueryString["msg"] == "u")
                {
                    

                    if(!IsPostBack)
                    {
                        if (Request.QueryString["id"] != null)
                        {
                            Label1.Text = "UPDATE DETAILS";
                            cn.Open();
                          
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
                            if (diff > 1)
                            {
                                cn.Open();
                                cmd = new SqlCommand("SELECT tblItem.itemimg, tblItem.Name, tblAuction.InitPrice, tblAuction.Startdate, tblAuction.Enddate FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid where aid=@id", cn);
                                cmd.Parameters.AddWithValue("@id", id);
                                rd = cmd.ExecuteReader();
                                rd.Read();
                                iImg.ImageUrl = rd["itemImg"].ToString();
                                txtItemname.Text = rd["Name"].ToString();
                                txtSdate.Text = rd["Startdate"].ToString();
                                txtEdate.Text = rd["Enddate"].ToString();
                                txtBidprice.Text = rd["InitPrice"].ToString();
                                btn_addauction.Text = "UPDATE";
                                rd.Close();
                                cn.Close();
                            }
                            else if (diff < 0)
                            {
                                Response.Redirect("auctionlist.aspx?msg=auction is already done");
                            }
                            else
                            {
                                Response.Redirect("auctionlist.aspx?msg=auction is not update at this stage");
                            }
                        }
                       
                        
                    }
                    else
                    {
                        cn.Open();
                        cmd = new SqlCommand("update tblAuction set initPrice=@ip,Startdate=@sd,Enddate=@ed,insertdate=@id where aid=@i", cn);
                        cmd.Parameters.AddWithValue("@i", id);
                        cmd.Parameters.AddWithValue("@ip", txtBidprice.Text);
                        cmd.Parameters.AddWithValue("@sd", txtSdate.Text);
                        cmd.Parameters.AddWithValue("@ed", txtEdate.Text);
                        cmd.Parameters.AddWithValue("@id", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("insert into tblMaxprice values(@a,@mp)", cn);
                        cmd.Parameters.AddWithValue("@a", id);
                        cmd.Parameters.AddWithValue("@mp", txtBidprice.Text);
                        cn.Close();
                        Response.Redirect("auctionlist.aspx?msg=auction is updated successfully!!");
                    }
                }
                 else
                 {
                    if (Request.QueryString["id"] != null)
                    {
                        String qs = Request.QueryString["id"].ToString();
                        id = Convert.ToInt32(qs);
                        cn.Open();
                        cmd = new SqlCommand("select count(*) as count from tblItem where Iid=@id and status='A'", cn);
                        cmd.Parameters.AddWithValue("@id", id);
                        SqlDataReader rd = cmd.ExecuteReader();
                        rd.Read();
                        int count = Convert.ToInt32(rd["count"]);
                        rd.Close();
                        cn.Close();
                        if (count == 1)
                        {
                            cn.Open();
                            cmd = new SqlCommand("select Name,itemImg from tblItem where Iid=@id and status='A'", cn);
                            cmd.Parameters.AddWithValue("@id", id);
                            rd = cmd.ExecuteReader();
                            rd.Read();
                            iImg.ImageUrl = rd["itemImg"].ToString();
                            txtItemname.Text = rd["Name"].ToString();
                            rd.Close();
                            cn.Close();
                        }
                        else
                        {
                            Response.Redirect("itemlist.aspx?msg=item already in auction");
                        }
                    }
                    else
                    {
                        Response.Redirect("itemlist.aspx");
                    }
                 }
        }


        protected void btn_addauction_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"]=="u")
            {
              

            }
            else
            {
                cn.Open();
                cmd = new SqlCommand("insert into tblAuction(tblAuction.Iid,initPrice,Startdate,Enddate,insertdate) values(@i,@ip,@sd,@ed,@id)", cn);
                cmd.Parameters.AddWithValue("@i", id);
                cmd.Parameters.AddWithValue("@ip", txtBidprice.Text);
                cmd.Parameters.AddWithValue("@sd", txtSdate.Text);
                cmd.Parameters.AddWithValue("@ed", txtEdate.Text);
                cmd.Parameters.AddWithValue("@id", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("select aid from tblAuction where Iid=@i",cn);
                cmd.Parameters.AddWithValue("@i", id);
                int tempid = Convert.ToInt32(cmd.ExecuteScalar());
                cmd = new SqlCommand("insert into tblMaxprice values(@a,@mp)",cn);
                cmd.Parameters.AddWithValue("@a", tempid);
                cmd.Parameters.AddWithValue("@mp", txtBidprice.Text);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("update tblItem set status='D' where Iid=@i", cn);
                cmd.Parameters.AddWithValue("@i", id);
                cmd.ExecuteNonQuery();
                
                Response.Write("<script>alert('Item Added Successfully..')</script>");
                Response.Redirect("sellerdesk.aspx");
                cn.Close();
            }
            
            
        }

    }
}