using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class feedback_from_alumni : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["iamuser"] != null)
                {
                    GetRecord();
                    DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT OPTION_ID, OPTION_NAME FROM dbo.TBL_FEEDBACK_OPTIONS_ALUMNI ORDER BY OPTION_ID desc");                    
                    GetRecord();
                }

                else
                {
                    Response.Redirect("clogin.aspx");
                }
            }
            catch
            {

            }
        }
    }

    

    protected void GetRecord()
    {
        try
        {


            string str_query = @"SELECT        dbo.TBL_ALUMNI_FEEDBACK.FEEDBACK_ID, dbo.TBL_ALUMNI_FEEDBACK.ALUMNUS_NAME, dbo.TBL_ALUMNI_FEEDBACK.ALUMNUS_ADDRESS, 
                         dbo.TBL_ALUMNI_FEEDBACK.COURSE_TYPE, dbo.TBL_ALUMNI_FEEDBACK.COURSE_ID, dbo.TBL_ALUMNI_FEEDBACK.GENDER, 
                         dbo.TBL_ALUMNI_FEEDBACK.AGE, dbo.TBL_ALUMNI_FEEDBACK.OCCUPATION, dbo.TBL_ALUMNI_FEEDBACK.DEPARTMENT, 
                         dbo.TBL_ALUMNI_FEEDBACK.YEAR_OF_COURSE, dbo.TBL_ALUMNI_FEEDBACK.CONTACT_NO, dbo.TBL_ALUMNI_FEEDBACK.MESSAGE, 
                         dbo.tbl_Course.CourseName
FROM            dbo.TBL_ALUMNI_FEEDBACK INNER JOIN
                         dbo.tbl_Course ON dbo.TBL_ALUMNI_FEEDBACK.COURSE_ID = dbo.tbl_Course.CourseId order by FEEDBACK_ID desc";

            DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            a_feedback.DataSource = dt_record;
            a_feedback.DataBind();
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
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            lbl_id.Text = a_feedback.DataKeys[gvrow.RowIndex].Values["FEEDBACK_ID"].ToString();
            Response.Redirect("post_feedback_alumini_grid.aspx?p_id=" + lbl_id.Text);
        }

        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void btn_report_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("feedback_from_alumni_report.aspx");
    }

    protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            lbl_id.Text = a_feedback.DataKeys[gvrow.RowIndex].Values["FEEDBACK_ID"].ToString();

            string str_delete = "Delete from TBL_ALUMNI_FEEDBACK Where FEEDBACK_ID=@FEEDBACK_ID";

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