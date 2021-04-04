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
    public partial class additem : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["msg"] == "u")
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                if (!IsPostBack)
                {
                    cn.Open();
                    cmd = new SqlCommand("select count(*) as count from tblItem where Iid=@i and status='A'", cn);
                    cmd.Parameters.AddWithValue("@i", id);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    rdr.Read();
                    int count = Convert.ToInt32(rdr["count"].ToString());
                    cn.Close();
                    if (count != 0)
                    {
                        cn.Open();
                        cmd = new SqlCommand("SELECT tblCategory.Categoryname, tblItem.Name, tblItem.itemimg, tblItem.Description FROM tblItem INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid where Iid=@i", cn);
                        cmd.Parameters.AddWithValue("@i", id);
                        rdr = cmd.ExecuteReader();
                        rdr.Read();
                        txtItem.Text = rdr["Name"].ToString();
                        txtDesc.Text = rdr["Description"].ToString();
                        Image1.ImageUrl = rdr["itemimg"].ToString();
                        btnAdd.Text = "UPDATE";
                        rdr.Close();
                        cn.Close();
                    }
                    else
                    {
                        Response.Redirect("itemlist.aspx?msg=er");
                        
                    }
                }
                else
                {
                    String category = DropDownList1.Text;
                    itemImg.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(itemImg.FileName));
                    cn.Open();
                    cmd = new SqlCommand("select cid from tblCategory where categoryname=@cn", cn);
                    cmd.Parameters.AddWithValue("@cn", category);
                    SqlDataReader rd = cmd.ExecuteReader();
                    rd.Read();
                    String cid = rd["cid"].ToString();
                    cn.Close();
                    cn.Open();
                    cmd = new SqlCommand("update tblItem set Name=@n,itemimg=@im,Description=@d,cid=@c,insertdate=@id where Iid=@i", cn);
                    cmd.Parameters.AddWithValue("@n", txtItem.Text);
                    cmd.Parameters.AddWithValue("@im", "Images/" + Path.GetFileName(itemImg.FileName));
                    cmd.Parameters.AddWithValue("@d", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@c", cid);
                    cmd.Parameters.AddWithValue("@id", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
                    cmd.Parameters.AddWithValue("@i", id);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("itemlist.aspx?msg=Item updated successfully");
                    cn.Close(); 
                }
            }
            else
            {
                Image1.Visible = false;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"] == null)
            {
                String email = Session["email"].ToString();
                String category = DropDownList1.Text;
                itemImg.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(itemImg.FileName));
                cn.Open();
                cmd = new SqlCommand("select id from tblUser where email=@em", cn);
                cmd.Parameters.AddWithValue("@em", email);
                SqlDataReader rd = cmd.ExecuteReader();
                rd.Read();
                String sid = rd["id"].ToString();
                cn.Close();
                cn.Open();
                cmd = new SqlCommand("select cid from tblCategory where categoryname=@cn", cn);
                cmd.Parameters.AddWithValue("@cn", category);
                rd = cmd.ExecuteReader();
                rd.Read();
                String cid = rd["cid"].ToString();
                cn.Close();
                cn.Open();
                cmd = new SqlCommand("insert into tblItem(Name,itemimg,Description,cid,sid,insertdate) values(@n,@im,@d,@c,@s,@id)", cn);
                cmd.Parameters.AddWithValue("@n", txtItem.Text);
                cmd.Parameters.AddWithValue("@im", "Images/" + Path.GetFileName(itemImg.FileName));
                cmd.Parameters.AddWithValue("@d", txtDesc.Text);
                cmd.Parameters.AddWithValue("@c", cid);
                cmd.Parameters.AddWithValue("@s", sid);
                cmd.Parameters.AddWithValue("@id", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Item Added Successfully..')</script>");
                cn.Close();
            }
            
        }
    }
}