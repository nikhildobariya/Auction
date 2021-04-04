using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

namespace AuctionManagementSystem
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"] != null)
            {
                if(Request.QueryString["msg"]=="1")
                {
                    html.Append("user name and password are wrong");
                    PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd=new SqlCommand("select count(*) as count1 from tblUser where Email=@em and Password=@pass and Role='A' and Status='A'",cn);
            cmd.Parameters.AddWithValue("@em",txtEmail.Text);
             String pass=CalculateMD5Hash(txtPasswd.Text);
             cmd.Parameters.AddWithValue("@pass", pass);

             SqlDataReader rd = cmd.ExecuteReader();
             rd.Read();
             if (rd["count1"].ToString() == "1")
             {
                 Session["email"] = txtEmail.Text;
                 Session["password"] = txtPasswd.Text;
                 Response.Redirect("home.aspx");
             }
             else if(txtPasswd.Text=="admin" && txtEmail.Text=="admin@gmail.com")
             {
                 Session["email"] = txtEmail.Text;
                 Session["password"]= txtPasswd.Text;
                 Response.Redirect("admindesk.aspx");
             }
             else
             {
                 cn.Close();
                 cn.Open();
                 cmd = new SqlCommand("select count(*) as count2 from tblUser where Email=@em and Password=@pass and Role='S' and Status='A'", cn);
                 cmd.Parameters.AddWithValue("@em", txtEmail.Text);
                 pass = CalculateMD5Hash(txtPasswd.Text);
                 cmd.Parameters.AddWithValue("@pass", pass);
                 rd = cmd.ExecuteReader();
                 rd.Read();
                 if (rd["count2"].ToString() == "1")
                 {
                     Session["email"] = txtEmail.Text;
                     Session["password"] = txtPasswd.Text;
                     Response.Redirect("SellerDesk.aspx");
                 }
                 else
                 {
                     Response.Redirect("login.aspx?msg=1");
                 }
             }
             
             cn.Close();
             
        }
        public string CalculateMD5Hash(string input)
        {
            // step 1, calculate MD5 hash from input
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString());
            }
            return sb.ToString();
        }
        
    }
}