using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuctionManagementSystem
{
    public partial class indexseller : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null && Session["password"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Label1.Text = Session["email"].ToString();
            }

        }
    }
}