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
    public partial class addcategory : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            getlist();
        }
        public void getlist()
        {
            cn.Open();
            cmd = new SqlCommand("select categoryname from tblCategory", cn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            cn.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("insert into tblCategory(Categoryname) values(@c) ", cn);
            cmd.Parameters.AddWithValue("@c",txtCate.Text);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}