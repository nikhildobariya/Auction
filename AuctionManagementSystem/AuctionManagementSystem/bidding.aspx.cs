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
    public partial class bidding : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        int uid, aid, sid, max;
        Boolean flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                startup();

                maxprice();
                if (!IsPostBack)
                {
                    cn.Open();
                    cmd = new SqlCommand("select count(*) from tblBidding where auctionid=@aid and userid=@uid", cn);
                    cmd.Parameters.AddWithValue("@aid",aid);
                    cmd.Parameters.AddWithValue("@uid",uid);
                    int temp=Convert.ToInt32(cmd.ExecuteScalar());
                    if(temp==0)
                    {
                        flag=true;
                        cmd = new SqlCommand("insert into tblBidding(auctionid,userid,bidprice,biddatetime) values(@aid,@uid,@bp,@bdt)", cn);
                        cmd.Parameters.AddWithValue("@aid", aid);
                        cmd.Parameters.AddWithValue("@uid", uid);
                        cmd.Parameters.AddWithValue("@bp",lblinitprice.Text);
                        cmd.Parameters.AddWithValue("@bdt", Convert.ToDateTime(DateTime.Now));
                        cmd.ExecuteNonQuery();
                    }
                    else{
                        flag=false;
                    }
                    cn.Close();
                }
                else if(flag==false)
                {
                    if (Convert.ToInt32(txtBidprice.Text) > max)
                    {
                        cn.Open();
                        cmd = new SqlCommand("update tblBidding set bidprice=@bp,biddatetime=@bdt where userid=@uid and auctionid=@aid", cn);
                        cmd.Parameters.AddWithValue("@bp", txtBidprice.Text);
                        cmd.Parameters.AddWithValue("@aid", aid);
                        cmd.Parameters.AddWithValue("@uid", uid);
                        cmd.Parameters.AddWithValue("@bdt", Convert.ToDateTime(DateTime.Now));
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("update tblMaxprice set maxprice=@mp where aid=@aid", cn);
                        cmd.Parameters.AddWithValue("@mp", txtBidprice.Text);
                        cmd.Parameters.AddWithValue("@aid", aid);
                        cmd.ExecuteNonQuery();
                        txtBidprice.Text = "";
                        cn.Close();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('enter big value than"+max+"');", true);
                    }
                }

                maxprice();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
        public void startup()
        {
            aid = Convert.ToInt32(Request.QueryString["id"].ToString());
            cn.Open();
            cmd = new SqlCommand("select id from tblUser where Email=@em", cn);
            cmd.Parameters.AddWithValue("@em", Session["email"].ToString());
            uid = Convert.ToInt32(cmd.ExecuteScalar());
            cmd = new SqlCommand("SELECT tblItem.Name,tblItem.sid,tblItem.itemimg,tblItem.Description,tblUser.City,tblCategory.Categoryname, tblAuction.InitPrice, tblUser.Firstname, tblUser.Lastname, tblUser.Contactno, tblUser.Email FROM tblAuction INNER JOIN tblItem ON tblAuction.Iid = tblItem.Iid INNER JOIN tblCategory ON tblItem.cid = tblCategory.cid INNER JOIN tblUser ON tblItem.sid = tblUser.id WHERE  tblAuction.aid=@a", cn);
            cmd.Parameters.AddWithValue("@a", aid);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            Image1.ImageUrl = rd["itemimg"].ToString();
            lblItem.Text = rd["Name"].ToString();
            lblcate.Text = rd["Categoryname"].ToString();
            lblinitprice.Text = rd["InitPrice"].ToString();
            lblsname.Text = rd["Firstname"].ToString() + " " + rd["Lastname"].ToString();
            txtdesc.Text = rd["Description"].ToString();
            lblemaill.Text = rd["Email"].ToString();
            lblcno.Text = rd["Contactno"].ToString();
            lblcity.Text = rd["City"].ToString();
            sid = Convert.ToInt32(rd["sid"].ToString());
            rd.Close();
            cn.Close();
        }
        public void maxprice()
        {
            cn.Open();
            cmd = new SqlCommand("select count(*) as count , max(bidprice) as max from tblBidding where auctionid=@aid", cn);
            cmd.Parameters.AddWithValue("@aid", aid);
            SqlDataReader rd=cmd.ExecuteReader();
            rd.Read();
            int count = Convert.ToInt32(rd["count"].ToString());
            if (count!=0)
            {
                max = Convert.ToInt32(rd["max"].ToString());
                rd.Close();
                cmd = new SqlCommand("select biddatetime from tblBidding where bidprice=@bp and auctionid=@aid",cn);
                cmd.Parameters.AddWithValue("@aid", aid);
                cmd.Parameters.AddWithValue("@bp",max.ToString());
                lbltime.Text = Convert.ToString(cmd.ExecuteScalar());
                lbllastprice.Text = max.ToString();
            }
            else
            {
                lbllastprice.Text = lblinitprice.Text;
            }
            cn.Close();
        }
    }
}