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
    public partial class auctionitemlist : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            getlist();
        }
        public void getlist()
        {
            cn.Open();
            cmd = new SqlCommand("SELECT tblAuction.aid,tblItem.itemimg, tblItem.Name, tblAuction.InitPrice, tblCategory.Categoryname, tblAuction.Startdate, tblAuction.Enddate, tblAuction.Status, tblUser.Email FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid INNER JOIN tblUser ON tblItem.sid = tblUser.id where tblAuction.startdate>@d", cn);
            cmd.Parameters.AddWithValue("@d", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                html.Append("<center><h1>NO ITEM FOUND !!!</h1></center>");
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            cn.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            itemlist.Visible = true;
            pnclosed.Visible = false;
            pncurrent.Visible = false;
            pnupcoming.Visible = false;
            cn.Open();
           cmd = new SqlCommand("SELECT tblAuction.aid,tblItem.itemimg, tblItem.Name, tblAuction.InitPrice, tblCategory.Categoryname, tblAuction.Startdate, tblAuction.Enddate, tblAuction.Status, tblUser.Email FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid INNER JOIN tblUser ON tblItem.sid = tblUser.id where categoryname=@c", cn);
           cmd.Parameters.AddWithValue("@c",DropDowncate.Text);
           cmd.Parameters.AddWithValue("@d", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                html.Append("<center><h1>NO ITEM FOUND !!!</h1></center>");
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            cn.Close();
        }

        protected void btnCa_Click(object sender, EventArgs e)
        {
            itemlist.Visible = false;
            pnclosed.Visible = false;
            pnupcoming.Visible = false;
            pncurrent.Visible = true;
            cn.Open();
          
                cmd = new SqlCommand("SELECT tblAuction.aid,tblItem.itemimg, tblItem.Name, tblCategory.Categoryname, tblAuction.InitPrice, tblAuction.Startdate, tblAuction.Enddate, tblMaxprice.maxprice FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid INNER JOIN tblMaxprice ON tblAuction.aid = tblMaxprice.aid WHERE (tblAuction.Startdate <=@d) and (tblAuction.Enddate >= @d) and tblAuction.Status='A'", cn);
                 cmd.Parameters.AddWithValue("@d", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count == 0)
                {

                }
                else
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            
            cn.Close();
        }

        protected void btnUa_Click(object sender, EventArgs e)
        {
            itemlist.Visible = false;
            pnclosed.Visible = false;
            pnupcoming.Visible = true;
            pncurrent.Visible = false;
            cn.Open();
            cmd = new SqlCommand("SELECT tblItem.itemimg, tblItem.Name, tblCategory.Categoryname, tblAuction.InitPrice, tblAuction.Startdate, tblAuction.Enddate FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid WHERE (tblAuction.Startdate > { fn NOW() }) and tblAuction.Status='A'", cn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {

            }
            else
            {
                Repeater3.DataSource = dt;
                Repeater3.DataBind();
            }
            cn.Close();
        }

        protected void btnCla_Click(object sender, EventArgs e)
        {
            itemlist.Visible = false;
            pnclosed.Visible = true;
            pnupcoming.Visible = false;
            pncurrent.Visible = false;
            cn.Open();
            cmd = new SqlCommand("SELECT DISTINCT tblItem.itemimg, tblMaxprice.maxprice, tblAuction.InitPrice, tblItem.Name, tblCategory.Categoryname FROM tblAuction INNER JOIN tblBidding ON tblAuction.aid = tblBidding.auctionid INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid INNER JOIN tblMaxprice ON tblAuction.aid = tblMaxprice.aid WHERE (tblAuction.Enddate <@d)", cn);
            cmd.Parameters.AddWithValue("@d", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {

            }
            else
            {
                Repeater2.DataSource = dt;
                Repeater2.DataBind();
            }
            cn.Close();
        }
        
    }
}