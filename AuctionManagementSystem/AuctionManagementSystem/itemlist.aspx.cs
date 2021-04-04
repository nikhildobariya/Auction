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
    public partial class itemlist : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["msg"] != null)
            {
                String ms = Request.QueryString["msg"].ToString();
                if (ms == "er")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('item is not update at this stage!');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('"+ms+"');", true);
                }
            }
            getlist();
        }

        public void getlist()
        {
            cn.Open();
            cmd = new SqlCommand("select id from tblUser where email=@em",cn);
            cmd.Parameters.AddWithValue("@em", Session["email"].ToString());
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            int id = Convert.ToInt32(rd["id"]);
            cn.Close();
            cn.Open();
            cmd = new SqlCommand("SELECT tblItem.Iid,tblCategory.Categoryname, tblItem.Name, tblItem.itemimg, tblItem.Description FROM tblCategory INNER JOIN tblItem ON tblCategory.cid = tblItem.cid where sid=@s", cn);
            cmd.Parameters.AddWithValue("@s",id);
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
            cn.Open();
            cmd = new SqlCommand("select id from tblUser where email=@em", cn);
            cmd.Parameters.AddWithValue("@em", Session["email"].ToString());
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            int id = Convert.ToInt32(rd["id"]);
            cn.Close();
            cn.Open();
            cmd = new SqlCommand("SELECT tblItem.Iid,tblCategory.Categoryname, tblItem.Name, tblItem.itemimg, tblItem.Description FROM tblCategory INNER JOIN tblItem ON tblCategory.cid = tblItem.cid where sid=@s and Categoryname=@c", cn);
            cmd.Parameters.AddWithValue("@s", id);
            cmd.Parameters.AddWithValue("@c", DropDowncate.Text);
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