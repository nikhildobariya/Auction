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
    public partial class userlist : System.Web.UI.Page
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
            cmd = new SqlCommand("select * from tblUser", cn);
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
            GridView1.Visible = true;
            cn.Open();
            cmd = new SqlCommand("select * from tblUser where city=@c", cn);
            cmd.Parameters.AddWithValue("@c",DropDowncate.Text);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                html.Append("<center><h1>NO ITEM FOUND !!!</h1></center>");
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                GridView1.Visible = false;
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