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
using System.Security.Cryptography;

namespace AuctionManagementSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["amsdb"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        StringBuilder html = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                cn.Open();
                cmd = new SqlCommand("select * from tblUser where Email=@eid", cn);
                cmd.Parameters.AddWithValue("@eid", Session["email"].ToString());
                SqlDataReader rd = cmd.ExecuteReader();
                rd.Read();
                lblfn.Text = rd["Firstname"].ToString();
                lblln.Text = rd["Lastname"].ToString();
                lblemail.Text = rd["Email"].ToString();
                lblcity.Text = rd["City"].ToString();
                lblcn.Text = rd["Contactno"].ToString();
                txtaddress.Text = rd["Address"].ToString();
                cn.Close();
                if (!IsPostBack)
                {
                    txtfn.Text = lblfn.Text;
                    txtln.Text = lblln.Text;
                    txtcn.Text = lblcn.Text;
                    txtemail.Text = lblemail.Text;
                }
                else
                {
                    if(btnupdate.Visible==true)
                    {
                    cn.Open();
                    cmd=new SqlCommand("update tblUser set Firstname=@fn,Lastname=@ln,Address=@add,City=@c,Contactno=@cn,Email=@em where Email=@eid",cn);
                    cmd.Parameters.AddWithValue("@fn", txtfn.Text);
                    cmd.Parameters.AddWithValue("@ln", txtln.Text);
                    cmd.Parameters.AddWithValue("@add",txtaddress.Text);
                    cmd.Parameters.AddWithValue("@c",DropDowncity.Text);
                    cmd.Parameters.AddWithValue("@cn",txtcn.Text);
                    cmd.Parameters.AddWithValue("@em", txtemail.Text);
                    cmd.Parameters.AddWithValue("@eid", Session["email"].ToString());
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    btnupdate.Visible = false;
                    }
                    
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btncp_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void btnup_Click(object sender, EventArgs e)
        {
            lblfn.Visible = false;
            lblln.Visible = false;
            lblemail.Visible = false;
            lblcity.Visible = false;
            lblcn.Visible = false;

            txtaddress.ReadOnly = false;
            txtcn.Visible = true;
            txtemail.Visible = true;
            txtfn.Visible = true;
            txtln.Visible = true;
            DropDowncity.Visible = true;

            btnup.Visible = false;
            btnupdate.Visible = true;
            Panel1.Visible = false;

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            btnup.Visible = true;
            lblfn.Visible = true;
            lblln.Visible = true;
            lblemail.Visible = true;
            lblcity.Visible = true;
            lblcn.Visible = true;

            txtaddress.ReadOnly = true;
            txtcn.Visible = false;
            txtemail.Visible = false;
            txtfn.Visible = false;
            txtln.Visible = false;
            DropDowncity.Visible = false;
            Panel1.Visible = false;

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("update tblUser set Password=@pass where Password=@opass and Email=@em", cn);
            String opass = CalculateMD5Hash(txtoldPass.Text);
            String pass = CalculateMD5Hash(txtnewPass.Text);
            cmd.Parameters.AddWithValue("@pass",pass);
            cmd.Parameters.AddWithValue("@opass", opass);
            cmd.Parameters.AddWithValue("@em", lblemail.Text);
            cmd.ExecuteNonQuery();
            cn.Close();
            Panel1.Visible = false;
            btnup.Visible = true;
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