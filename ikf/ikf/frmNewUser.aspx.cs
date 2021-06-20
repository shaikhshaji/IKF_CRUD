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
    public partial class frmNewUser : System.Web.UI.Page
    {

        string skillSet = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind_Designation_list();
                bind_skill_list();
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
        protected void bind_skill_list()
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
                        sqlcomm.CommandText = "get_skill_list";


                        da.SelectCommand = sqlcomm;
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ckbx_skill_list.DataSource = ds;
                            ckbx_skill_list.DataTextField = "Skill";
                            ckbx_skill_list.DataValueField = "id";
                            ckbx_skill_list.DataBind();
                        }

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
            int sklSet = 0;
            int errCode = 0;

            foreach (ListItem li in ckbx_skill_list.Items)
            {
                if (li.Selected)
                {
                    if (sklSet == 0)
                    {
                        skillSet +=  li;
                        sklSet++;
                    }
                    else
                    {
                        skillSet += "," + li;
                    }
                }
            }




            errCode = Validate_input();


            if (errCode == 0)
            {
                AddData(txtFullName.Text, txtDOB.Text, dd_designation.SelectedItem.Text, skillSet);
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

            if (skillSet == "")
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

        protected void AddData(string Para_Name, string Para_DOB, string para_desig, string para_skill)
        {

            try
            {
                SqlCommand sqlcomm = new SqlCommand();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IKFConStr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("addEmp", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@Para_Name", SqlDbType.NVarChar).Value = Para_Name;
                        cmd.Parameters.Add("@Para_DOB", SqlDbType.NVarChar).Value = Para_DOB;
                        cmd.Parameters.Add("@Para_Designation", SqlDbType.NChar).Value = para_desig;
                        cmd.Parameters.Add("@Para_skillset", SqlDbType.NVarChar).Value = para_skill;

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
              
              
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
    }
}