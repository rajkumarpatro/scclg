using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.SqlClient;

using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
public partial class feedback_from_alumni_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GET_DATA();
        //GetCourse();
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
    protected void GET_DATA()
    {
        try
        {
            String str_where = "";
           
            if (ddl_admissionclasstype.SelectedValue != "0")
            {
                str_where = " and COURSE_TYPE=" + ddl_admissionclasstype.SelectedValue + "";
            }
            if (ddl_admissionclass.SelectedValue != "0")
            {
                str_where = " and COURSE_ID=" + ddl_admissionclass.SelectedValue + "";
            }
           
            double total = Convert.ToDouble(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(FEEDBACK_ID) as total from TBL_ALUMNI_FEEDBACK where 1=1 " + str_where + ""));

            lbl_q1_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as st_ag from TBL_ALUMNI_FEEDBACK where Q_1=5 " + str_where + "").ToString();
            lbl_q1_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as ag from TBL_ALUMNI_FEEDBACK where Q_1=4 " + str_where + "").ToString();
            lbl_q1_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as ns from TBL_ALUMNI_FEEDBACK where Q_1=3 " + str_where + "").ToString();
            lbl_q1_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as ds from TBL_ALUMNI_FEEDBACK where Q_1=2 " + str_where + "").ToString();
            lbl_q1_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_1) as st_ds from TBL_ALUMNI_FEEDBACK where Q_1=1 " + str_where + "").ToString();

            lbl_q2_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as st_ag from TBL_ALUMNI_FEEDBACK where Q_2=5 " + str_where + "").ToString();
            lbl_q2_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as ag from TBL_ALUMNI_FEEDBACK where Q_2=4 " + str_where + "").ToString();
            lbl_q2_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as ns from TBL_ALUMNI_FEEDBACK where Q_2=3 " + str_where + "").ToString();
            lbl_q2_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as ds from TBL_ALUMNI_FEEDBACK where Q_2=2 " + str_where + "").ToString();
            lbl_q2_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_2) as st_ds from TBL_ALUMNI_FEEDBACK where Q_2=1 " + str_where + "").ToString();

            lbl_q3_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as st_ag from TBL_ALUMNI_FEEDBACK where Q_3=5 " + str_where + "").ToString();
            lbl_q3_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as ag from TBL_ALUMNI_FEEDBACK where Q_3=4 " + str_where + "").ToString();
            lbl_q3_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as ns from TBL_ALUMNI_FEEDBACK where Q_3=3 " + str_where + "").ToString();
            lbl_q3_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as ds from TBL_ALUMNI_FEEDBACK where Q_3=2 " + str_where + "").ToString();
            lbl_q3_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_3) as st_ds from TBL_ALUMNI_FEEDBACK where Q_3=1 " + str_where + "").ToString();

            lbl_q4_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as st_ag from TBL_ALUMNI_FEEDBACK where Q_4=5 " + str_where + "").ToString();
            lbl_q4_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as ag from TBL_ALUMNI_FEEDBACK where Q_4=4 " + str_where + "").ToString();
            lbl_q4_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as ns from TBL_ALUMNI_FEEDBACK where Q_4=3 " + str_where + "").ToString();
            lbl_q4_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as ds from TBL_ALUMNI_FEEDBACK where Q_4=2 " + str_where + "").ToString();
            lbl_q4_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_4) as st_ds from TBL_ALUMNI_FEEDBACK where Q_4=1 " + str_where + "").ToString();

            lbl_q5_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as st_ag from TBL_ALUMNI_FEEDBACK where Q_5=5 " + str_where + "").ToString();
            lbl_q5_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as ag from TBL_ALUMNI_FEEDBACK where Q_5=4 " + str_where + "").ToString();
            lbl_q5_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as ns from TBL_ALUMNI_FEEDBACK where Q_5=3 " + str_where + "").ToString();
            lbl_q5_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as ds from TBL_ALUMNI_FEEDBACK where Q_5=2 " + str_where + "").ToString();
            lbl_q5_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_5) as st_ds from TBL_ALUMNI_FEEDBACK where Q_5=1 " + str_where + "").ToString();

            lbl_q6_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_6) as st_ag from TBL_ALUMNI_FEEDBACK where Q_6=5 " + str_where + "").ToString();
            lbl_q6_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_6) as ag from TBL_ALUMNI_FEEDBACK where Q_6=4 " + str_where + "").ToString();
            lbl_q6_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_6) as ns from TBL_ALUMNI_FEEDBACK where Q_6=3 " + str_where + "").ToString();
            lbl_q6_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_6) as ds from TBL_ALUMNI_FEEDBACK where Q_6=2 " + str_where + "").ToString();
            lbl_q6_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_6) as st_ds from TBL_ALUMNI_FEEDBACK where Q_6=1 " + str_where + "").ToString();

            lbl_q7_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_7) as st_ag from TBL_ALUMNI_FEEDBACK where Q_7=5 " + str_where + "").ToString();
            lbl_q7_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_7) as ag from TBL_ALUMNI_FEEDBACK where Q_7=4 " + str_where + "").ToString();
            lbl_q7_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_7) as ns from TBL_ALUMNI_FEEDBACK where Q_7=3 " + str_where + "").ToString();
            lbl_q7_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_7) as ds from TBL_ALUMNI_FEEDBACK where Q_7=2 " + str_where + "").ToString();
            lbl_q7_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_7) as st_ds from TBL_ALUMNI_FEEDBACK where Q_7=1 " + str_where + "").ToString();

            lbl_q8_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_8) as st_ag from TBL_ALUMNI_FEEDBACK where Q_8=5 " + str_where + "").ToString();
            lbl_q8_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_8) as ag from TBL_ALUMNI_FEEDBACK where Q_8=4 " + str_where + "").ToString();
            lbl_q8_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_8) as ns from TBL_ALUMNI_FEEDBACK where Q_8=3 " + str_where + "").ToString();
            lbl_q8_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_8) as ds from TBL_ALUMNI_FEEDBACK where Q_8=2 " + str_where + "").ToString();
            lbl_q8_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_8) as st_ds from TBL_ALUMNI_FEEDBACK where Q_8=1 " + str_where + "").ToString();

            lbl_q9_sa_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_9) as st_ag from TBL_ALUMNI_FEEDBACK where Q_9=5 " + str_where + "").ToString();
            lbl_q9_a_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_9) as ag from TBL_ALUMNI_FEEDBACK where Q_9=4 " + str_where + "").ToString();
            lbl_q9_ns_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_9) as ns from TBL_ALUMNI_FEEDBACK where Q_9=3 " + str_where + "").ToString();
            lbl_q9_d_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_9) as ds from TBL_ALUMNI_FEEDBACK where Q_9=2 " + str_where + "").ToString();
            lbl_q9_sd_vot.Text = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select COUNT(Q_9) as st_ds from TBL_ALUMNI_FEEDBACK where Q_9=1 " + str_where + "").ToString();

           
            if (total != 0)
            {
                lbl_q1_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q1_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q1_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q1_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q1_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q1_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q1_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q2_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q2_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q2_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q2_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q2_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q2_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q2_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q3_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q3_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q3_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q3_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q3_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q3_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q3_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q4_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q4_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q4_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q4_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q4_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q4_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q4_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q5_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q5_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q5_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q5_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q5_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q5_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q5_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q6_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q6_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q6_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q6_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q6_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q6_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q6_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q6_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q6_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q6_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q7_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q7_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q7_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q7_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q7_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q7_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q7_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q7_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q7_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q7_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q8_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q8_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q8_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q8_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q8_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q8_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q8_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q8_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q8_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q8_sd_vot.Text) * 100) / total), 2).ToString() + "%";

                lbl_q9_sa_pr.Text = Math.Round(((Convert.ToDouble(lbl_q9_sa_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q9_a_pr.Text = Math.Round(((Convert.ToDouble(lbl_q9_a_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q9_ns_per.Text = Math.Round(((Convert.ToDouble(lbl_q9_ns_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q9_d_per.Text = Math.Round(((Convert.ToDouble(lbl_q9_d_vot.Text) * 100) / total), 2).ToString() + "%";
                lbl_q9_sd_per.Text = Math.Round(((Convert.ToDouble(lbl_q9_sd_vot.Text) * 100) / total), 2).ToString() + "%";

              
            }
            else
            {
                lbl_q1_sa_pr.Text = "0%";
                lbl_q1_a_pr.Text = "0%";
                lbl_q1_ns_per.Text = "0%";
                lbl_q1_d_per.Text = "0%";
                lbl_q1_sd_per.Text = "0%";

                lbl_q2_sa_pr.Text = "0%";
                lbl_q2_a_pr.Text = "0%";
                lbl_q2_ns_per.Text = "0%";
                lbl_q2_d_per.Text = "0%";
                lbl_q2_sd_per.Text = "0%";

                lbl_q3_sa_pr.Text = "0%";
                lbl_q3_a_pr.Text = "0%";
                lbl_q3_ns_per.Text = "0%";
                lbl_q3_d_per.Text = "0%";
                lbl_q3_sd_per.Text = "0%";

                lbl_q4_sa_pr.Text = "0%";
                lbl_q4_a_pr.Text = "0%";
                lbl_q4_ns_per.Text = "0%";
                lbl_q4_d_per.Text = "0%";
                lbl_q4_sd_per.Text = "0%";

                lbl_q5_sa_pr.Text = "0%";
                lbl_q5_a_pr.Text = "0%";
                lbl_q5_ns_per.Text = "0%";
                lbl_q5_d_per.Text = "0%";
                lbl_q5_sd_per.Text = "0%";

                lbl_q6_sa_pr.Text = "0%";
                lbl_q6_a_pr.Text = "0%";
                lbl_q6_ns_per.Text = "0%";
                lbl_q6_d_per.Text = "0%";
                lbl_q6_sd_per.Text = "0%";

                lbl_q7_sa_pr.Text = "0%";
                lbl_q7_a_pr.Text = "0%";
                lbl_q7_ns_per.Text = "0%";
                lbl_q7_d_per.Text = "0%";
                lbl_q7_sd_per.Text = "0%";

                lbl_q8_sa_pr.Text = "0%";
                lbl_q8_a_pr.Text = "0%";
                lbl_q8_ns_per.Text = "0%";
                lbl_q8_d_per.Text = "0%";
                lbl_q8_sd_per.Text = "0%";

                lbl_q9_sa_pr.Text = "0%";
                lbl_q9_a_pr.Text = "0%";
                lbl_q9_ns_per.Text = "0%";
                lbl_q9_d_per.Text = "0%";
                lbl_q9_sd_per.Text = "0%";

                
            }
        }
        catch
        {

        }
    }
    protected void btn_show_Click(object sender, EventArgs e)
    {
        try
        {
            GET_DATA();
        }
        catch
        {

        }
    }

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }

    protected void btn_report_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_feedback_from_alumni.aspx");
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}


