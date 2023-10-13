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
            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {


                    string st_id = Request.QueryString["p_id"];


                    DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT  dbo.TBL_FEEDBACK_ABOUT_TEACHER.FEEDBACK_ID, dbo.TBL_FEEDBACK_ABOUT_TEACHER.STUDENT_NAME, 
                         dbo.TBL_FEEDBACK_ABOUT_TEACHER.FATHER_NAME, dbo.TBL_FEEDBACK_ABOUT_TEACHER.COURSE_TYPE, 
                         dbo.TBL_FEEDBACK_ABOUT_TEACHER.COURSE_ID, dbo.TBL_FEEDBACK_ABOUT_TEACHER.YEAR_SEM, 
                         dbo.TBL_FEEDBACK_ABOUT_TEACHER.ACADEMIC_YEAR, dbo.TBL_FEEDBACK_ABOUT_TEACHER.CONTACT_NO, 
                         dbo.TBL_FEEDBACK_ABOUT_TEACHER.MESSAGE, dbo.TBL_FEEDBACK_ABOUT_TEACHER.Q_1, dbo.TBL_FEEDBACK_ABOUT_TEACHER.Q_2, 
                         dbo.TBL_FEEDBACK_ABOUT_TEACHER.Q_3, dbo.TBL_FEEDBACK_ABOUT_TEACHER.Q_4, dbo.TBL_FEEDBACK_ABOUT_TEACHER.Q_5, 
                         dbo.tbl_Course.CourseName
FROM            dbo.TBL_FEEDBACK_ABOUT_TEACHER INNER JOIN
                         dbo.tbl_Course ON dbo.TBL_FEEDBACK_ABOUT_TEACHER.COURSE_ID = dbo.tbl_Course.CourseId where dbo.TBL_FEEDBACK_ABOUT_TEACHER.FEEDBACK_ID=" + st_id + "");

                    lbl_id.Text = st_id;
                    txtsname.Text = Server.HtmlDecode(dt_record.Rows[0]["STUDENT_NAME"].ToString());
                    txtfname.Text = Server.HtmlDecode(dt_record.Rows[0]["FATHER_NAME"].ToString());
                    ddl_admissionclasstype.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["COURSE_TYPE"].ToString());
                    GetCourse();
                    ddl_admissionclass.SelectedValue = dt_record.Rows[0]["COURSE_ID"].ToString();
                    ddl_part.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["YEAR_SEM"].ToString());
                    Y_option.Text = Server.HtmlDecode(dt_record.Rows[0]["ACADEMIC_YEAR"].ToString());                   
                    txtcno.Text = Server.HtmlDecode(dt_record.Rows[0]["CONTACT_NO"].ToString());
                    txtmsg.Text = Server.HtmlDecode(dt_record.Rows[0]["MESSAGE"].ToString());
                    Q1.SelectedValue = dt_record.Rows[0]["Q_1"].ToString();
                    Q2.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_2"].ToString());
                    Q3.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_3"].ToString());
                    Q4.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_4"].ToString());
                    Q5.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_5"].ToString());
                    



                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
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

   



    protected void btn_Save_Click1(object sender, EventArgs e)
    {
       
        //Insert
        string str_update = @"UPDATE [dbo].[TBL_FEEDBACK_ABOUT_TEACHER] set [STUDENT_NAME] = @STUDENT_NAME,[FATHER_NAME]=@FATHER_NAME, [COURSE_TYPE] = @COURSE_TYPE ,[COURSE_ID] = @COURSE_ID ,[YEAR_SEM] = @YEAR_SEM, [ACADEMIC_YEAR]=@ACADEMIC_YEAR,
                            [CONTACT_NO]=@CONTACT_NO, [MESSAGE]=@MESSAGE, [Q_1]=@Q_1, [Q_2]=@Q_2, [Q_3]=@Q_3, [Q_4]=@Q_4, [Q_5]=@Q_5 WHERE [FEEDBACK_ID] = @FEEDBACK_ID";

        SqlParameter[] sp = new SqlParameter[14];        

        sp[0] = new SqlParameter("@STUDENT_NAME", SqlDbType.VarChar, 60);
        sp[0].Value = Server.HtmlDecode(txtsname.Text);

        sp[1] = new SqlParameter("@FATHER_NAME", SqlDbType.VarChar, 60);
        sp[1].Value = Server.HtmlDecode(txtfname.Text);

        sp[2] = new SqlParameter("@COURSE_TYPE", SqlDbType.VarChar, 3);
        sp[2].Value = Server.HtmlDecode(ddl_admissionclasstype.SelectedValue);

        sp[3] = new SqlParameter("@COURSE_ID", SqlDbType.Int);
        sp[3].Value = Convert.ToInt32(ddl_admissionclass.SelectedValue);

        sp[4] = new SqlParameter("@YEAR_SEM", SqlDbType.Int);
        sp[4].Value = Convert.ToInt32(ddl_part.SelectedValue);

        sp[5] = new SqlParameter("@ACADEMIC_YEAR", SqlDbType.VarChar, 10);
        sp[5].Value = Server.HtmlDecode(Y_option.Text);

        sp[6] = new SqlParameter("@CONTACT_NO", SqlDbType.VarChar, 10);
        sp[6].Value = Server.HtmlDecode(txtcno.Text);

        sp[7] = new SqlParameter("@MESSAGE", SqlDbType.VarChar, 500);
        sp[7].Value = Server.HtmlDecode(txtmsg.Text);

        sp[8] = new SqlParameter("@Q_1", SqlDbType.VarChar, 20);
        sp[8].Value = Server.HtmlDecode(Q1.SelectedValue);

        sp[9] = new SqlParameter("@Q_2", SqlDbType.VarChar, 20);
        sp[9].Value = Server.HtmlDecode(Q2.SelectedValue);

        sp[10] = new SqlParameter("@Q_3", SqlDbType.VarChar, 20);
        sp[10].Value = Server.HtmlDecode(Q3.SelectedValue);

        sp[11] = new SqlParameter("@Q_4", SqlDbType.VarChar, 20);
        sp[11].Value = Server.HtmlDecode(Q4.SelectedValue);

        sp[12] = new SqlParameter("@Q_5", SqlDbType.VarChar, 20);
        sp[12].Value = Server.HtmlDecode(Q5.SelectedValue);

        sp[13] = new SqlParameter("@FEEDBACK_ID", SqlDbType.Int);
        sp[13].Value = Convert.ToInt32(lbl_id.Text);

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Saved Successfully')", true);

    }


    

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_students_feedback_form_about_Teachers.aspx");
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}
