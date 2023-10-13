using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class students_feedback_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["iamuser"] != null)
        {
            GetRecord();
        }
        else
        {
            Response.Redirect("clogin.aspx");
        }
    }

    protected void btn_report_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_feedback_report.aspx");
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }


    protected void GetRecord()
    {
        try
        {


            string str_query = @"SELECT        dbo.TBL_STUDENT_FEEDBACK.FEEDBACK_ID, dbo.TBL_STUDENT_FEEDBACK.STUDENT_NAME, dbo.TBL_STUDENT_FEEDBACK.FATHER_NAME, 
                         dbo.TBL_STUDENT_FEEDBACK.COURSE_TYPE, dbo.TBL_STUDENT_FEEDBACK.COURSE_ID, dbo.TBL_STUDENT_FEEDBACK.YEAR_SEM, 
                         dbo.TBL_STUDENT_FEEDBACK.ACADEMIC_YEAR, dbo.TBL_STUDENT_FEEDBACK.CONTACT_NO, dbo.TBL_STUDENT_FEEDBACK.MESSAGE, 
                         dbo.TBL_STUDENT_FEEDBACK.Q_1, dbo.TBL_STUDENT_FEEDBACK.Q_2, dbo.TBL_STUDENT_FEEDBACK.Q_3, dbo.TBL_STUDENT_FEEDBACK.Q_4, 
                         dbo.TBL_STUDENT_FEEDBACK.Q_5, dbo.TBL_STUDENT_FEEDBACK.Q_6, dbo.TBL_STUDENT_FEEDBACK.Q_7, dbo.TBL_STUDENT_FEEDBACK.Q_8, 
                         dbo.TBL_STUDENT_FEEDBACK.Q_9, dbo.TBL_STUDENT_FEEDBACK.Q_10, dbo.TBL_STUDENT_FEEDBACK.Q_11, dbo.TBL_STUDENT_FEEDBACK.Q_12, 
                         dbo.tbl_Course.CourseName FROM dbo.TBL_STUDENT_FEEDBACK INNER JOIN
                         dbo.tbl_Course ON dbo.TBL_STUDENT_FEEDBACK.COURSE_ID = dbo.tbl_Course.CourseId order by dbo.TBL_STUDENT_FEEDBACK.FEEDBACK_ID desc";

            DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            s_feedback.DataSource = dt_record;
            s_feedback.DataBind();
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }

    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;
            lbl_id.Text = s_feedback.DataKeys[gvrow.RowIndex].Values["FEEDBACK_ID"].ToString();
            Response.Redirect("post_students_feedbsck_grid.aspx?p_id=" + lbl_id.Text);
        }

        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }
    

 protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            lbl_id.Text = s_feedback.DataKeys[gvrow.RowIndex].Values["FEEDBACK_ID"].ToString();

            string str_delete = "Delete from TBL_STUDENT_FEEDBACK Where FEEDBACK_ID=@FEEDBACK_ID";

            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@FEEDBACK_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(lbl_id.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Deleted Successfully')", true);

            
            GetRecord();

        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }

  
}

