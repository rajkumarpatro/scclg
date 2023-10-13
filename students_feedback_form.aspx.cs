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

            //Q6.DataSource = dt_category;
            //Q6.DataTextField = "OPTION_NAME";
            //Q6.DataValueField = "OPTION_ID";
            //Q6.DataBind();

            //Q7.DataSource = dt_category;
            //Q7.DataTextField = "OPTION_NAME";
            //Q7.DataValueField = "OPTION_ID";
            //Q7.DataBind();

            //Q8.DataSource = dt_category;
            //Q8.DataTextField = "OPTION_NAME";
            //Q8.DataValueField = "OPTION_ID";
            //Q8.DataBind();

            //Q9.DataSource = dt_category;
            //Q9.DataTextField = "OPTION_NAME";
            //Q9.DataValueField = "OPTION_ID";
            //Q9.DataBind();

            //Q10.DataSource = dt_category;
            //Q10.DataTextField = "OPTION_NAME";
            //Q10.DataValueField = "OPTION_ID";
            //Q10.DataBind();

            //Q11.DataSource = dt_category;
            //Q11.DataTextField = "OPTION_NAME";
            //Q11.DataValueField = "OPTION_ID";
            //Q11.DataBind();

            //Q12.DataSource = dt_category;
            //Q12.DataTextField = "OPTION_NAME";
            //Q12.DataValueField = "OPTION_ID";
            //Q12.DataBind();

            //Q13.DataSource = dt_category;
            //Q13.DataTextField = "OPTION_NAME";
            //Q13.DataValueField = "OPTION_ID";
            //Q13.DataBind();

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
            Q_1,Q_2,Q_3,Q_4,Q_5,Q_6,Q_7,Q_8,Q_9,Q_10,Q_11,Q_12 FROM dbo.TBL_STUDENT_FEEDBACK order by FEEDBACK_ID desc";

            DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            s_feedback.DataSource = dt_record;
            s_feedback.DataBind();
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

            string str_id = "select (isnull(MAX(FEEDBACK_ID),0)+1) as ID from TBL_STUDENT_FEEDBACK";

            object id = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str_id);

            lbl_id.Text = id.ToString();
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error " + ee.Message;
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {


        GenerateNewId();
        //Insert
        string insert = @"INSERT INTO [dbo].[TBL_STUDENT_FEEDBACK] ([FEEDBACK_ID] ,[STUDENT_NAME] ,[FATHER_NAME] ,[COURSE_TYPE],[COURSE_ID],[YEAR_SEM] ,[ACADEMIC_YEAR], [CONTACT_NO], [MESSAGE], [Q_1],[Q_2],[Q_3],[Q_4],[Q_5],[Q_6],[Q_7],[Q_8],[Q_9],[Q_10],
                                        [Q_11],[Q_12])
                                    VALUES (@FEEDBACK_ID ,@STUDENT_NAME ,@FATHER_NAME , @COURSE_TYPE, @COURSE_ID, @YEAR_SEM ,@ACADEMIC_YEAR, @CONTACT_NO,@MESSAGE, @Q_1, @Q_2, @Q_3, @Q_4, @Q_5, @Q_6, @Q_7, @Q_8, @Q_9, @Q_10, 
                                                                    @Q_11, @Q_12)";

        SqlParameter[] sp = new SqlParameter[21];

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

        sp[14] = new SqlParameter("@Q_6", SqlDbType.VarChar, 500);
        sp[14].Value = Server.HtmlDecode(Q6.Text);

        sp[15] = new SqlParameter("@Q_7", SqlDbType.VarChar, 500);
        sp[15].Value = Server.HtmlDecode(Q7.Text);

        sp[16] = new SqlParameter("@Q_8", SqlDbType.VarChar, 500);
        sp[16].Value = Server.HtmlDecode(Q8.Text);

        sp[17] = new SqlParameter("@Q_9", SqlDbType.VarChar, 20);
        sp[17].Value = Server.HtmlDecode(Q9.SelectedValue);

        sp[18] = new SqlParameter("@Q_10", SqlDbType.VarChar, 500);
        sp[18].Value = Server.HtmlDecode(Q10.Text);

        sp[19] = new SqlParameter("@Q_11", SqlDbType.VarChar, 20);
        sp[19].Value = Server.HtmlDecode(Q11.SelectedValue);

        sp[20] = new SqlParameter("@Q_12", SqlDbType.VarChar, 500);
        sp[20].Value = Server.HtmlDecode(Q12.Text);

       
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
        //    s_feedback.DataSource = dtExists;
        //    s_feedback.DataBind();
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
            lbl_id.Text = s_feedback.DataKeys[gvrow.RowIndex].Values["FEEDBACK_ID"].ToString();

            string str_delete = "Delete from TBL_STUDENT_FEEDBACK Where FEEDBACK_ID=@FEEDBACK_ID";

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

