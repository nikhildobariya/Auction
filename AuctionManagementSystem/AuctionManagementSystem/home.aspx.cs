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
    public partial class home : System.Web.UI.Page
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

            cmd = new SqlCommand("SELECT tblItem.itemimg, tblItem.Name, tblAuction.InitPrice, tblBidding.bidprice, tblUser.Email FROM tblAuction INNER JOIN tblBidding ON tblAuction.aid = tblBidding.auctionid INNER JOIN tblBuyer ON tblBidding.Bid = tblBuyer.biddingid INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblUser ON tblBidding.userid = tblUser.id WHERE (tblAuction.Enddate <@d)", cn);
            cmd.Parameters.AddWithValue("@d", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                Panel1.Visible = false;
            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }

            cn.Close();
        }
    }
}