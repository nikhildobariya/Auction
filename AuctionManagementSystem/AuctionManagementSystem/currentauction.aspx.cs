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
    public partial class currentauction : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        DateTime today = Convert.ToDateTime(DateTime.Now.ToShortDateString());

        protected void Page_Load(object sender, EventArgs e)
        {
            getlist();
        }
        public void getlist()
        {
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
    }
}