using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class post_parents_grid : System.Web.UI.Page
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


                    DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT        dbo.TBL_PARENTS_FEEDBACK.FEEDBACK_ID, dbo.TBL_PARENTS_FEEDBACK.PARENTS_NAME, dbo.TBL_PARENTS_FEEDBACK.STUDENT_NAME, 
                         dbo.TBL_PARENTS_FEEDBACK.COURSE_TYPE, dbo.TBL_PARENTS_FEEDBACK.COURSE_ID, dbo.TBL_PARENTS_FEEDBACK.YEAR_SEM, 
                         dbo.TBL_PARENTS_FEEDBACK.ACADEMIC_YEAR, dbo.TBL_PARENTS_FEEDBACK.CONTACT_NO, dbo.TBL_PARENTS_FEEDBACK.MESSAGE, 
                         dbo.TBL_PARENTS_FEEDBACK.Q_1, dbo.TBL_PARENTS_FEEDBACK.Q_2, dbo.TBL_PARENTS_FEEDBACK.Q_3, dbo.TBL_PARENTS_FEEDBACK.Q_4, 
                         dbo.TBL_PARENTS_FEEDBACK.Q_5, dbo.TBL_PARENTS_FEEDBACK.Q_6, dbo.TBL_PARENTS_FEEDBACK.Q_7, dbo.TBL_PARENTS_FEEDBACK.Q_8, 
                         dbo.TBL_PARENTS_FEEDBACK.Q_9, dbo.TBL_PARENTS_FEEDBACK.Q_10, dbo.TBL_PARENTS_FEEDBACK.Q_11, dbo.tbl_Course.CourseName
FROM            dbo.TBL_PARENTS_FEEDBACK INNER JOIN
                         dbo.tbl_Course ON dbo.TBL_PARENTS_FEEDBACK.COURSE_ID = dbo.tbl_Course.CourseId where dbo.TBL_PARENTS_FEEDBACK.FEEDBACK_ID=" + st_id + "");

                    lbl_id.Text = st_id;
                    txtpname.Text = Server.HtmlDecode(dt_record.Rows[0]["PARENTS_NAME"].ToString());
                    txtsname.Text = Server.HtmlDecode(dt_record.Rows[0]["STUDENT_NAME"].ToString());
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
                    Q6.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_6"].ToString());
                    Q7.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_7"].ToString());
                    Q8.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_8"].ToString());
                    Q9.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_9"].ToString());
                    Q10.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_10"].ToString());
                    Q11.SelectedValue = Server.HtmlDecode(dt_record.Rows[0]["Q_11"].ToString());



                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }




            //ClearMyPage();            
            //GetCourse();
        }

    }
    protected void btn_Save_Click1(object sender, EventArgs e)
    {


        //GenerateNewId();
        //Insert
        string str_update = @"UPDATE [dbo].[TBL_PARENTS_FEEDBACK] set [PARENTS_NAME] = @PARENTS_NAME,[STUDENT_NAME]=@STUDENT_NAME, [COURSE_TYPE] = @COURSE_TYPE ,[COURSE_ID] = @COURSE_ID ,[YEAR_SEM] = @YEAR_SEM, [ACADEMIC_YEAR]=@ACADEMIC_YEAR,
                            [CONTACT_NO]=@CONTACT_NO, [MESSAGE]=@MESSAGE, [Q_1]=@Q_1, [Q_2]=@Q_2, [Q_3]=@Q_3, [Q_4]=@Q_4, [Q_5]=@Q_5, [Q_6]=@Q_6, [Q_7]=@Q_7, [Q_8]=@Q_8, [Q_9]=@Q_9 , [Q_10]=@Q_10 , [Q_11]=@Q_11 
                        WHERE [FEEDBACK_ID] = @FEEDBACK_ID";

        SqlParameter[] sp = new SqlParameter[20];

        

        sp[0] = new SqlParameter("@PARENTS_NAME", SqlDbType.VarChar, 60);
        sp[0].Value = Server.HtmlDecode(txtpname.Text);

        sp[1] = new SqlParameter("@STUDENT_NAME", SqlDbType.VarChar, 60);
        sp[1].Value = Server.HtmlDecode(txtsname.Text);

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

        sp[13] = new SqlParameter("@Q_6", SqlDbType.VarChar, 20);
        sp[13].Value = Server.HtmlDecode(Q6.SelectedValue);

        sp[14] = new SqlParameter("@Q_7", SqlDbType.VarChar, 20);
        sp[14].Value = Server.HtmlDecode(Q7.SelectedValue);

        sp[15] = new SqlParameter("@Q_8", SqlDbType.VarChar, 20);
        sp[15].Value = Server.HtmlDecode(Q8.SelectedValue);

        sp[16] = new SqlParameter("@Q_9", SqlDbType.VarChar, 20);
        sp[16].Value = Server.HtmlDecode(Q9.SelectedValue);

        sp[17] = new SqlParameter("@Q_10", SqlDbType.VarChar, 20);
        sp[17].Value = Server.HtmlDecode(Q10.SelectedValue);

        sp[18] = new SqlParameter("@Q_11", SqlDbType.VarChar, 20);
        sp[18].Value = Server.HtmlDecode(Q11.SelectedValue);

        sp[19] = new SqlParameter("@FEEDBACK_ID", SqlDbType.Int);
        sp[19].Value = Convert.ToInt32(lbl_id.Text);

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Update Successfully')", true);

    }
    
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_parents_feedback_form.aspx");
    }
    protected void btn_main_menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void ClearMyPage()
    {
        txtsname.Text = "";
        txtpname.Text = "";
        
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

  


    protected void GenerateNewId()
    {
        try
        {

            string str_id = "select (isnull(MAX(FEEDBACK_ID),0)+1) as ID from TBL_PARENTS_FEEDBACK";

            object id = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str_id);

            lbl_id.Text = id.ToString();
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error " + ee.Message;
        }
    }

    

    

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }
}