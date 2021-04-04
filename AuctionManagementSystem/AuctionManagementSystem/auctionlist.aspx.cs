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
    public partial class auctionlist : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null && Session["password"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                getlist();    
            }
            if (Request.QueryString["msg"] != null)
            {
                String ms = Request.QueryString["msg"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('"+ms+"');", true);
            }
            
        }
        public void getlist()
        {
            cn.Open();
            cmd = new SqlCommand("select id from tblUser where email=@em", cn);
            cmd.Parameters.AddWithValue("@em", Session["email"].ToString());
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            int id = Convert.ToInt32(rd["id"]);
            cn.Close();
            cn.Open();
            cmd = new SqlCommand("SELECT tblAuction.aid,tblItem.itemimg, tblItem.Name, tblAuction.InitPrice, tblAuction.Startdate, tblAuction.Enddate FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid WHERE tblItem.sid =@s", cn);
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