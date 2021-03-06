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
    public partial class WebForm1 : System.Web.UI.Page
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
    }
}