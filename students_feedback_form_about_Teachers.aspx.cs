using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class students_feedback_form_about_Teachers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT OPTION_ID, OPTION_NAME FROM dbo.TBL_FEEDBACK_OPTIONS ORDER BY OPTION_ID desc");
            //Q1.DataSource = dt_category;
            //Q1.DataTextField = "OPTION_NAME";
            //Q1.DataValueField = "OPTION_ID";
            //Q1.DataBind();

            //Q2.DataSource = dt_category;
            //Q2.DataTextField = "OPTION_NAME";
            //Q2.DataValueField = "OPTION_ID";
            //Q2.DataBind();

            //Q3.DataSource = dt_category;
            //Q3.DataTextField = "OPTION_NAME";
            //Q3.DataValueField = "OPTION_ID";
            //Q3.DataBind();

            //Q4.DataSource = dt_category;
            //Q4.DataTextField = "OPTION_NAME";
            //Q4.DataValueField = "OPTION_ID";
            //Q4.DataBind();

            //Q5.DataSource = dt_category;
            //Q5.DataTextField = "OPTION_NAME";
            //Q5.DataValueField = "OPTION_ID";
            //Q5.DataBind();

          

            ClearMyPage();
            GetRecord();
            GetCourse();
        }

    }


    protected void ClearMyPage()
    {
        txtsname.Text = "";
        txtfname.Text = "";
      
        txtcno.Text = "";
        Y_option.Text = "";
        txtmsg.Text = "";
        lbl_id.Text = "";



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

    protected void GetRecord()
    {
        try
        {


            string str_query = @"SELECT FEEDBACK_ID, STUDENT_NAME, FATHER_NAME, COURSE_TYPE,COURSE_ID,YEAR_SEM, ACADEMIC_YEAR,CONTACT_NO, MESSAGE, 
            Q_1,Q_2,Q_3,Q_4,Q_5 FROM dbo.TBL_FEEDBACK_ABOUT_TEACHER order by FEEDBACK_ID desc";

            DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            p_feedback.DataSource = dt_record;
            p_feedback.DataBind();
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }


    protected void GenerateNewId()
    {
        try
        {

            string str_id = "select (isnull(MAX(FEEDBACK_ID),0)+1) as ID from TBL_FEEDBACK_ABOUT_TEACHER";

            object id = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str_id);

            lbl_id.Text = id.ToString();
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error " + ee.Message;
        }
    }

    protected void btn_Save_Click1(object sender, EventArgs e)
    {
        GenerateNewId();
        //Insert
        string insert = @"INSERT INTO [dbo].[TBL_FEEDBACK_ABOUT_TEACHER] ([FEEDBACK_ID] ,[STUDENT_NAME] ,[FATHER_NAME] ,[COURSE_TYPE],[COURSE_ID],[YEAR_SEM] ,[ACADEMIC_YEAR], [CONTACT_NO], [MESSAGE], [Q_1],[Q_2],[Q_3],[Q_4],[Q_5])
                                    VALUES (@FEEDBACK_ID ,@STUDENT_NAME ,@FATHER_NAME , @COURSE_TYPE, @COURSE_ID, @YEAR_SEM ,@ACADEMIC_YEAR, @CONTACT_NO,@MESSAGE, @Q_1, @Q_2, @Q_3, @Q_4, @Q_5)";

        SqlParameter[] sp = new SqlParameter[14];

        sp[0] = new SqlParameter("@FEEDBACK_ID", SqlDbType.Int);
        sp[0].Value = Convert.ToInt32(lbl_id.Text);

        sp[1] = new SqlParameter("@STUDENT_NAME", SqlDbType.VarChar, 60);
        sp[1].Value = Server.HtmlDecode(txtsname.Text);

        sp[2] = new SqlParameter("@FATHER_NAME", SqlDbType.VarChar, 60);
        sp[2].Value = Server.HtmlDecode(txtfname.Text);

        sp[3] = new SqlParameter("@COURSE_TYPE", SqlDbType.VarChar, 3);
        sp[3].Value = Server.HtmlDecode(ddl_admissionclasstype.SelectedValue);

        sp[4] = new SqlParameter("@COURSE_ID", SqlDbType.Int);
        sp[4].Value = Convert.ToInt32(ddl_admissionclass.SelectedValue);

        sp[5] = new SqlParameter("@YEAR_SEM", SqlDbType.Int);
        sp[5].Value = Convert.ToInt32(ddl_part.SelectedValue);

        sp[6] = new SqlParameter("@ACADEMIC_YEAR", SqlDbType.VarChar, 10);
        sp[6].Value = Server.HtmlDecode(Y_option.Text);

        sp[7] = new SqlParameter("@CONTACT_NO", SqlDbType.VarChar, 10);
        sp[7].Value = Server.HtmlDecode(txtcno.Text);

        sp[8] = new SqlParameter("@MESSAGE", SqlDbType.VarChar, 500);
        sp[8].Value = Server.HtmlDecode(txtmsg.Text);

        sp[9] = new SqlParameter("@Q_1", SqlDbType.VarChar, 20);
        sp[9].Value = Server.HtmlDecode(Q1.SelectedValue);

        sp[10] = new SqlParameter("@Q_2", SqlDbType.VarChar, 20);
        sp[10].Value = Server.HtmlDecode(Q2.SelectedValue);

        sp[11] = new SqlParameter("@Q_3", SqlDbType.VarChar, 20);
        sp[11].Value = Server.HtmlDecode(Q3.SelectedValue);

        sp[12] = new SqlParameter("@Q_4", SqlDbType.VarChar, 20);
        sp[12].Value = Server.HtmlDecode(Q4.SelectedValue);

        sp[13] = new SqlParameter("@Q_5", SqlDbType.VarChar, 20);
        sp[13].Value = Server.HtmlDecode(Q5.SelectedValue);

        



        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, insert, sp);
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Saved Successfully')", true);


        //lbl_msg.Text = "Record Submited Successfully";

        Response.Redirect("thanks.aspx");
    }


    protected void fill_grid()
    {
        //try
        //{
        //    DataTable dtExists = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT  OPTION_ID, OPTION_NAME FROM dbo.TBL_FEEDBACK_OPTIONS ORDER BY  dbo.TBL_FEEDBACK_OPTIONS.OPTION_ID asc ");
        //    p_feedback.DataSource = dtExists;
        //    p_feedback.DataBind();
        //}
        //catch (Exception ee)
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Fill Grid<br>" + ee.Message + "')", true);
        //}
    }

    protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            lbl_id.Text = p_feedback.DataKeys[gvrow.RowIndex].Values["FEEDBACK_ID"].ToString();

            string str_delete = "Delete from TBL_FEEDBACK_ABOUT_TEACHER Where FEEDBACK_ID=@FEEDBACK_ID";

            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@FEEDBACK_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(lbl_id.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Deleted Successfully')", true);

            ClearMyPage();
            GetRecord();

        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error - " + ee.Message;
        }
    }

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }
}
