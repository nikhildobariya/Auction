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
    public partial class index : System.Web.UI.MasterPage
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            winner();
            if (Session["email"]!=null && Session["password"]!=null)
            {
                Label1.Text = Session["email"].ToString();
                html.Append("<br><a href='profile.aspx'><li>PROFILE</li></a><a href='buylist.aspx'><li>ITEMS LIST</li></a><a href='logout.aspx'><input type='button' name='' value='LOGOUT'></a>");
            }
            else
            {
                html.Append("<a href='login.aspx'><input type='button' name='' value='LOGIN'></a>"
                    + "<a href='autReg.aspx'><input type='button' name='' value='REGISTRATION'></a>");
                
            }
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
        public void winner()
        {
            cn.Open();
            cmd = new SqlCommand("SELECT tblBidding.Bid, tblBidding.userid, tblItem.sid, tblBidding.auctionid FROM tblAuction INNER JOIN tblBidding ON tblAuction.aid = tblBidding.auctionid INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblMaxprice ON tblAuction.aid = tblMaxprice.aid AND tblBidding.bidprice = tblMaxprice.maxprice WHERE (tblAuction.Enddate <@d) AND (tblAuction.Status = 'A') ",cn);
            cmd.Parameters.AddWithValue("@d",Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            int count=dt.Rows.Count;
            int i=0;
            while (count> i)
            {
                cmd = new SqlCommand("insert into tblBuyer(biddingid) values(@bi)",cn);
                cmd.Parameters.AddWithValue("@bi",dt.Rows[i]["Bid"].ToString());
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("update tblAuction set Status='S' where aid=@a", cn);
                cmd.Parameters.AddWithValue("@a", dt.Rows[i]["auctionid"].ToString());
                cmd.ExecuteNonQuery();
                i++;
            }
            cn.Close();
        }
    }
}