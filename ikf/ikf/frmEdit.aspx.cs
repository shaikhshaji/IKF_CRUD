using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ikf
{
    public partial class frmEdit : System.Web.UI.Page
    {

        string skillSet = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind_Designation_list();

            }

            if (!IsPostBack)
            {
                get_emp_list();
            }
        }




        protected void bind_Designation_list()
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
                        //   sqlcomm.CommandText = "get_skill_list";
                        sqlcomm.CommandText = "get_Designation_list";

                        da.SelectCommand = sqlcomm;
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dd_designation.DataSource = ds;
                        dd_designation.DataBind();
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine("Error: " + e.Message);
                }
            }

        }





        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            skillSet = "";
            int errCode = 0;

            errCode = Validate_input();

            if (errCode == 0)
            {
                int id = Convert.ToInt32(Session["ID"].ToString());
                EditEmp(id, txtFullName.Text, txtDOB.Text, dd_designation.SelectedItem.Text, txtSkills.Text);
                Response.Write("<script>alert('New Employee Inserted successfully!')</script>");
                Response.Redirect("frmViewAll.aspx", false);
            }

        }

        protected int Validate_input()
        {
            int err = 0;

            if (txtFullName.Text == "")
            {
                lbl_er1.Visible = true;
                err++;
            }
            else
            {
                lbl_er1.Visible = false;
            }

            if (txtDOB.Text == "")
            {
                lbl_er2.Visible = true;
                err++;
            }
            else
            {
                lbl_er2.Visible = false;
            }




            if (dd_designation.SelectedItem.Value == "")
            {
                lbl_er3.Visible = true;
                err++;
            }
            else
            {
                lbl_er3.Visible = false;
            }

            if (txtSkills.Text == "")
            {
                lbl_er4.Visible = true;
                err++;
            }
            else
            {
                lbl_er4.Visible = false;
            }


            return err; ;
        }

        protected void EditEmp(int Para_ID, string Para_Name, string Para_DOB, string para_desig, string para_skill)
        {

            try
            {
                SqlCommand sqlcomm = new SqlCommand();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IKFConStr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("EditEmp", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Para_ID", SqlDbType.Int).Value = Para_ID;
                        cmd.Parameters.Add("@Para_Name", SqlDbType.NVarChar).Value = Para_Name;
                        cmd.Parameters.Add("@Para_DOB", SqlDbType.NVarChar).Value = Para_DOB;
                        cmd.Parameters.Add("@Para_Designation", SqlDbType.NChar).Value = para_desig;
                        cmd.Parameters.Add("@Para_skillset", SqlDbType.NVarChar).Value = para_skill;

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblErr.Visible = true;
                lblErr.Text = "Updated successfully.";
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }

        protected void ckbx_skill_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSkills.Text = skillSet;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
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
                    GetEditUserData(para_ID);
                    Session["ID"] = para_ID;
                    get_emp_list();
                }
            }
        }

        protected void GetEditUserData(int para_ID)
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
                        sqlcomm.CommandText = "GetEditUserData";
                        da.SelectCommand = sqlcomm;
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlcomm.Parameters.Add("@para_ID", SqlDbType.Int).Value = para_ID;
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            txtFullName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                            txtDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                            txtSkills.Text = ds.Tables[0].Rows[0]["skillset"].ToString();                           
                        }
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error: " + e.Message);
                }
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