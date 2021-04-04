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
namespace AuctionManagementSystem
{
    public partial class admindesk : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("select count(*) from tblUser where Role='S'", cn);
            String count = cmd.ExecuteScalar().ToString();
            Label3.Text = count;
            cmd = new SqlCommand("select count(*) from tblUser where Role='A'", cn);
            count = cmd.ExecuteScalar().ToString();
            Label1.Text = count;
            cmd = new SqlCommand("select count(*) from tblAuction",cn);
            Label2.Text = count;
            cn.Close();
        }
    }
}