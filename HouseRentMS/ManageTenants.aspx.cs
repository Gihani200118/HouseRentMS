using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HouseRentMS
{
    public partial class ManageTenants : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MYdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTenants();
            }
        }

        // Add or Update Tenant
        protected void btnAddTenant_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;

                if (ViewState["TenantId"] == null)
                {
                    // Add new tenant
                    cmd = new SqlCommand("sp_AddTenant", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FullName", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                }
                else
                {
                    // Update tenant
                    cmd = new SqlCommand("sp_UpdateTenant", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(ViewState["TenantId"]));
                    cmd.Parameters.AddWithValue("@FullName", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            ClearForm();
            LoadTenants();
        }

        // Load tenant list
        private void LoadTenants()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_GetTenants", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewTenants.DataSource = dt;
                GridViewTenants.DataBind();
            }
        }

        // Delete tenant
        protected void GridViewTenants_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewTenants.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_DeleteTenant", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadTenants();
        }

        // Edit tenant (populate fields)
        protected void GridViewTenants_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewTenants.SelectedRow;

            ViewState["TenantId"] = GridViewTenants.DataKeys[row.RowIndex].Value.ToString();
            txtName.Text = row.Cells[1].Text;
            txtEmail.Text = row.Cells[2].Text;
            txtPhone.Text = row.Cells[3].Text;

            btnAddTenant.Text = "Update Tenant";
        }

        // Reset form
        private void ClearForm()
        {
            ViewState["TenantId"] = null;
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            btnAddTenant.Text = "Add Tenant";
        }
    }
}
