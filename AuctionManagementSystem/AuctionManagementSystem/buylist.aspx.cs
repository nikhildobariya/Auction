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
    public partial class buylist : System.Web.UI.Page
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
            cmd = new SqlCommand("select id from tblUser where email=@em", cn);
            cmd.Parameters.AddWithValue("@em", Session["email"].ToString());
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            int id = Convert.ToInt32(rd["id"]);
            rd.Close();
            cn.Close();
            cn.Open();
            cmd = new SqlCommand("SELECT tblItem.itemimg, tblAuction.InitPrice, tblUser.Email, tblAuction.Startdate, tblAuction.Enddate, tblBidding.bidprice, tblItem.Name FROM tblAuction INNER JOIN tblBidding ON tblAuction.aid = tblBidding.auctionid INNER JOIN tblBuyer ON tblBidding.Bid = tblBuyer.biddingid INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblUser ON tblItem.sid = tblUser.id WHERE (tblBidding.userid = @s)", cn);
            cmd.Parameters.AddWithValue("@s", id);
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
    }
}