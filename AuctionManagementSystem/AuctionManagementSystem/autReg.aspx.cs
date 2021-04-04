using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace AuctionManagementSystem
{
    public partial class autReg : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"] == "1")
                {
                    html.Append("user already exists try another email");
                    PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("select count(*) as count from tblUser where Email=@em",cn);
            cmd.Parameters.AddWithValue("@em", txtEmail.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            int count=Convert.ToInt32(rd["count"]);
            rd.Close();
            cn.Close();
            if(count==0)
            {
                cn.Open();
            cmd = new SqlCommand("insert into tblUser(Firstname,Lastname,Address,City,Gender,Contactno,Email,Role,Password) values(@fn,@ln,@add,@city,@gen,@con,@em,@role,@pass)", cn);
            cmd.Parameters.AddWithValue("@fn", txtFname.Text);
            cmd.Parameters.AddWithValue("@ln", txtLname.Text);
            cmd.Parameters.AddWithValue("@add", txtAddress.Text);
            cmd.Parameters.AddWithValue("@city", dropdowncity.Text);
            if(rbtMale.Checked)
            cmd.Parameters.AddWithValue("@gen", "M");
            else
                cmd.Parameters.AddWithValue("@gen","F");

            cmd.Parameters.AddWithValue("@em", txtEmail.Text);
            cmd.Parameters.AddWithValue("@con", txtContact.Text);

            if(rbtSeller.Checked)
            cmd.Parameters.AddWithValue("@role", "S");
            else
                cmd.Parameters.AddWithValue("@role", "A");

            String pass = CalculateMD5Hash(txtPass.Text);

            Console.Write(pass.Length);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.ExecuteNonQuery();
            cn.Close();
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Redirect("autReg.aspx?msg=1");
            }
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