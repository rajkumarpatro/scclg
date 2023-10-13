using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class student_feedback_about_Teacher_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GET_DATA();
        GetCourse();

    }


    protected void GetCourse()
    {
        try
        {
            string str_query = "select CourseId,CourseName from tbl_Course where CourseType='" + ddl_admissionclasstype.SelectedValue + "'";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_admissionclass.DataSource = dt;
            ddl_admissionclass.DataTextField = "CourseName";
            ddl_admissionclass.DataValueField = "CourseId";
            ddl_admissionclass.DataBind();
        }
        catch (Exception ee)
        {

        }
    }

    protected void btn_show_Click(object sender, EventArgs e)
    {
        GET_DATA();
    }


    protected void GET_DATA()
    {

        try
        {
            String str_where = "";
            if (Y_option.SelectedValue != "0")
            {
                str_where += " and ACADEMIC_YEAR='" + Y_option.SelectedValue + "'";
            }
            if (ddl_admissionclasstype.SelectedValue != "0")
            {
                str_where = " and COURSE_TYPE=" + ddl_admissionclasstype.SelectedValue + "";
            }
            if (ddl_admissionclass.SelectedValue != "0")
            {
                str_where = " and COURSE_ID=" + ddl_admissionclass.SelectedValue + "";
            }
            if (ddl_part.SelectedValue != "0")
            {
                str_where = " and YEAR_SEM=" + ddl_part.SelectedValue + "";
            }
            double total = Convert.ToDouble(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(FEEDBACK_ID) as total from TBL_FEEDBACK_ABOUT_TEACHER where 1=1 " + str_where + ""));

            lbl_q1_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as st_ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_1=4 " + str_where + "").ToString();
            lbl_q1_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_1=3 " + str_where + "").ToString();
            lbl_q1_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as ns from TBL_FEEDBACK_ABOUT_TEACHER where Q_1=2 " + str_where + "").ToString();
            lbl_q1_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as ds from TBL_FEEDBACK_ABOUT_TEACHER where Q_1=1 " + str_where + "").ToString();
        

            lbl_q2_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as st_ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_2=4 " + str_where + "").ToString();
            lbl_q2_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_2=3 " + str_where + "").ToString();
            lbl_q2_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as ns from TBL_FEEDBACK_ABOUT_TEACHER where Q_2=2 " + str_where + "").ToString();
            lbl_q2_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as ds from TBL_FEEDBACK_ABOUT_TEACHER where Q_2=1 " + str_where + "").ToString();
        

            lbl_q3_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as st_ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_3=4 " + str_where + "").ToString();
            lbl_q3_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_3=3 " + str_where + "").ToString();
            lbl_q3_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as ns from TBL_FEEDBACK_ABOUT_TEACHER where Q_3=2 " + str_where + "").ToString();
            lbl_q3_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as ds from TBL_FEEDBACK_ABOUT_TEACHER where Q_3=1 " + str_where + "").ToString();


            lbl_q4_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as st_ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_4=4 " + str_where + "").ToString();
            lbl_q4_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_4=3 " + str_where + "").ToString();
            lbl_q4_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as ns from TBL_FEEDBACK_ABOUT_TEACHER where Q_4=2 " + str_where + "").ToString();
            lbl_q4_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as ds from TBL_FEEDBACK_ABOUT_TEACHER where Q_4=1 " + str_where + "").ToString();
      

            lbl_q5_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as st_ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_5=4 " + str_where + "").ToString();
            lbl_q5_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as ag from TBL_FEEDBACK_ABOUT_TEACHER where Q_5=3 " + str_where + "").ToString();
            lbl_q5_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as ns from TBL_FEEDBACK_ABOUT_TEACHER where Q_5=2 " + str_where + "").ToString();
            lbl_q5_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as ds from TBL_FEEDBACK_ABOUT_TEACHER where Q_5=1 " + str_where + "").ToString();
     

           

            if (total != 0)
            {
                lbl_q1_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q1_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q1_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q1_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q1_d_vot.Text) * 100) / total), 2).ToString() + "%";
          

                lbl_q2_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q2_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q2_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q2_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q2_d_vot.Text) * 100) / total), 2).ToString() + "%";
         

                lbl_q3_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q3_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q3_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q3_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q3_d_vot.Text) * 100) / total), 2).ToString() + "%";
       

                lbl_q4_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q4_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q4_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q4_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q4_d_vot.Text) * 100) / total), 2).ToString() + "%";
         

                lbl_q5_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q5_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q5_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q5_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q5_d_vot.Text) * 100) / total), 2).ToString() + "%";
          

              


            }
            else
            {
                lbl_q1_sa_pr.Text = "0%";
                lbl_q1_a_pr.Text = "0%";
                lbl_q1_ns_per.Text = "0%";
                lbl_q1_d_per.Text = "0%";
             

                lbl_q2_sa_pr.Text = "0%";
                lbl_q2_a_pr.Text = "0%";
                lbl_q2_ns_per.Text = "0%";
                lbl_q2_d_per.Text = "0%";
          

                lbl_q3_sa_pr.Text = "0%";
                lbl_q3_a_pr.Text = "0%";
                lbl_q3_ns_per.Text = "0%";
                lbl_q3_d_per.Text = "0%";
            

                lbl_q4_sa_pr.Text = "0%";
                lbl_q4_a_pr.Text = "0%";
                lbl_q4_ns_per.Text = "0%";
                lbl_q4_d_per.Text = "0%";
          

                lbl_q5_sa_pr.Text = "0%";
                lbl_q5_a_pr.Text = "0%";
                lbl_q5_ns_per.Text = "0%";
                lbl_q5_d_per.Text = "0%";
           

               
            }

        }
        catch
        {

        }

    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        GET_DATA();
    }

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }
    protected void btn_report_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_students_feedback_form_about_Teachers.aspx");
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}


