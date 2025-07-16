using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HouseRentMS
{
    public partial class ManageHouses : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MYdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHouses();
            }
        }

        // Save (Add or Update)
        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;

                if (hfHouseId.Value == "")
                {
                    // Add with stored procedure
                    cmd = new SqlCommand("sp_AddHouse", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                }
                else
                {
                    // Update with stored procedure
                    cmd = new SqlCommand("sp_UpdateHouse", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(hfHouseId.Value));
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            ClearForm();
            LoadHouses();
        }

        // Load Houses
        private void LoadHouses()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Load Houses with stored procedure
                SqlCommand cmd = new SqlCommand("sp_GetHouses", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewHouses.DataSource = dt;
                GridViewHouses.DataBind();
            }
        }

        // Select (Edit)
        protected void GridViewHouses_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewHouses.SelectedRow;

            hfHouseId.Value = GridViewHouses.DataKeys[row.RowIndex].Value.ToString();
            txtTitle.Text = row.Cells[1].Text;
            txtLocation.Text = row.Cells[2].Text;
            txtPrice.Text = row.Cells[3].Text;
            txtDescription.Text = row.Cells[4].Text;

            btnSave.Text = "Update House";
        }

        // Delete
        protected void GridViewHouses_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewHouses.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_DeleteHouse", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadHouses();
        }

        // Clear fields
        private void ClearForm()
        {
            txtTitle.Text = "";
            txtLocation.Text = "";
            txtPrice.Text = "";
            txtDescription.Text = "";
            hfHouseId.Value = "";
            btnSave.Text = "Save House";
        }
    }
}
