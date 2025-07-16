using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HouseRentMS
{
    public partial class Dashboard : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["myUsername"] != null)
                {
                    lblLoggedUser.Text = "Welcome, " + Session["myUsername"].ToString();
                }
                else
                {
                    lblLoggedUser.Text = "Welcome, Guest";
                }
            }
        }

        protected void LoginView1_ViewChanged(object sender, EventArgs e)
        {

        }

        protected void btnManageHouses_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageHouses.aspx");
        }

        protected void btnManageUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageTenants.aspx");
        }

        protected void btnViewBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBookings.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}