using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace ikf
{
    public partial class frmDeleteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                get_emp_list();
            }

        }

        public void get_emp_list()
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["IKFConStr"].ConnectionString);
            SqlCommand sqlcomm = new SqlCommand();

            sqlcomm.Connection = sqlConn;
            using (sqlConn)
            {
                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {

                        // Name of stored procedure
                        sqlcomm.CommandText = "get_emp_list";


                        da.SelectCommand = sqlcomm;
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            rpt_view_emp.DataSource = ds;
                            rpt_view_emp.DataBind();
                        }

                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error: " + e.Message);
                }
            }
            sqlConn.Close();



        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int para_ID = 0;

            if (txtID.Text == "")
            {
                lblErr.Visible = true;               
                lblErr.Text = "<-- Please Enter the ID";
            }
            else
            {
                lblErr.Visible = false;
                lblErr.Text = "";



                int parsedValue;
                if (!int.TryParse(txtID.Text, out parsedValue))
                {
                    lblErr.Visible = true;                  
                    lblErr.Text = "<-- Please Enter Number only ID";
                }
                else
                {
                    para_ID = Convert.ToInt32(txtID.Text);
                    deleteUser(para_ID);

                    get_emp_list();
                }
            }


        }


        protected void deleteUser(int para_ID)
        {

            try
            {
                SqlCommand sqlcomm = new SqlCommand();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IKFConStr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("deleteUser", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@para_ID", SqlDbType.Int).Value = para_ID;


                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                lblErr.Visible = true;
                lblErr.Text = "Deleted successfully.";
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}