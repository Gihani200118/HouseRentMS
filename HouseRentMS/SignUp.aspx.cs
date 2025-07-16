using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HouseRentMS
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {


            string fullname = TxtFullName.Text.Trim();
            string username = TxtUsername.Text.Trim();
            string email = TxtEmail.Text.Trim();
            string password = TxtPassword.Text.Trim();
            string confirmPassword = TxtConfirmPassword.Text.Trim();

            if (password != confirmPassword)
            {
                LblMessage.ForeColor = System.Drawing.Color.Red;
                LblMessage.Text = "Passwords do not match!";
                return;
            }

            string connectionString = "Data Source=DESKTOP-K92J903;Initial Catalog=HouseRentalDB;Integrated Security=True";



            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "INSERT INTO UserSignUp (FullName, Username, Email, Password) VALUES (@FullName, @Username, @Email, @Password)";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@FullName", fullname);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        LblMessage.ForeColor = System.Drawing.Color.LightGreen;
                        LblMessage.Text = "Registration successful!";
                    }
                    else
                    {
                        LblMessage.ForeColor = System.Drawing.Color.Red;
                        LblMessage.Text = "Registration failed.";
                    }
                }
                catch (Exception ex)
                {
                    LblMessage.ForeColor = System.Drawing.Color.Red;
                    LblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
          
        }
    }