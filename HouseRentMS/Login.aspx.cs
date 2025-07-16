using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.ModelBinding;

namespace HouseRentMS
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MYdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Select * from Admin where username=@username and password=@password", con);
                cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
                cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "Admin");
                if (ds.Tables["Admin"].Rows.Count == 0)
                {
                    Response.Write("Invalid user");
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }

        }

        protected void BtnLogin_Click1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=DESKTOP-K92J903;Database=HouseRentalDB;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("Select * from Admin where username=@username and password=@password", con);
            cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
            cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Admin");
            if (ds.Tables["Admin"].Rows.Count == 0)
            {
                Response.Write("Invalid user");
            }
            else
            {
                Session["myUsername"] = TxtUsername.Text;
                Response.Redirect("Dashboard.aspx");
                
            }

        }
    }
}