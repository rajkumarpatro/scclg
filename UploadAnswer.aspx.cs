using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadAnswer : System.Web.UI.Page
{
    SqlParameter[] sp = null;
    UIHelper uiHelper = new UIHelper();
    sql_operations op = new sql_operations();
    SendMsg msg = new SendMsg();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCourse();
            GetCourseSubject();
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

            ddl_part.Items.Clear();
            ddl_part.Items.Insert(0, new ListItem("1", "1"));
            ddl_part.Items.Insert(1, new ListItem("2", "2"));
            ddl_part.Items.Insert(2, new ListItem("3", "3"));

            lbl_yearsem.Text = "वर्ष";
            if (ddl_admissionclasstype.SelectedValue == "PG")
            {
                ddl_part.Items.Insert(3, new ListItem("4", "4"));
                lbl_yearsem.Text = "सेमेस्टर";
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in GetCourse " + ee.Message + "')", true);
        }
    }

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
        GetCourseSubject();
    }


    protected void ddl_admissionclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourseSubject();
    }
    
    
    
    protected void GetCourseSubject()
    {
        try
        {
            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@SubjectId", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(ddl_admissionclass.SelectedValue);

            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT SubjectName,SubjectId FROM tbl_Subject WHERE COURSEID=" + ddl_admissionclass.SelectedValue + " and PART=" + ddl_part.SelectedValue + " order by SubjectName", sp);

            ddl_subject.Items.Clear();
            ddl_subject.DataSource = dt_data;
            ddl_subject.DataTextField = "SUBJECTNAME";
            ddl_subject.DataValueField = "SUBJECTID";
            ddl_subject.DataBind();

            ddl_subject.Items.Insert(0, new ListItem("Select", "0"));
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while GetCourseSubject " + ee.Message + "')", true);
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);

            if (picext == ".pdf")
            {
                string logopath = "";
                int assignment_id = op.generate_id_sql("SELECT ISNULL(MAX(AnsId),0) FROM TBL_EXAM_ANSWER");
                lbl_user.Text = assignment_id.ToString();


                logopath = Server.MapPath("ExamAns/" + txt_rollno.Text + "_" + ddl_admissionclass.SelectedItem.Text + "_Part_" + ddl_part.SelectedItem.Text + "_" + ddl_subject.SelectedItem.Text + "_" + ddl_paper.SelectedValue + "_" + lbl_user.Text.ToString() + "" + picext);

                logopath = "ExamAns/" + txt_rollno.Text + "_" + ddl_admissionclass.SelectedItem.Text + "_Part_" + ddl_part.SelectedItem.Text + "_" + ddl_subject.SelectedItem.Text + "_" + ddl_paper.SelectedValue + "_" + lbl_user.Text.ToString() + "" + picext;
                FileUpload1.PostedFile.SaveAs(MapPath(logopath));
                Label1.Text = logopath.ToString();

                string str_insert = @"INSERT INTO [dbo].[TBL_EXAM_ANSWER]
                                   ([AnsId] ,[CourseId] ,[Part] ,[SubjectId] ,[paper]
                                   ,[rollno] ,[mobile] ,[filepath] ,[AYear] ,[UploadDate])
                                    VALUES (@AnsId ,@CourseId ,@Part ,@SubjectId ,@paper
                                   ,@rollno ,@mobile ,@filepath ,YEAR(GETDATE()) ,GETDATE())";

                sp = new SqlParameter[8];

                sp[0] = new SqlParameter("@AnsId", SqlDbType.Int);
                sp[0].Value = assignment_id;

                sp[1] = new SqlParameter("@CourseId",SqlDbType.Int);
                sp[1].Value = Convert.ToInt32(ddl_admissionclass.SelectedValue);

                sp[2] = new SqlParameter("@Part", SqlDbType.Int);
                sp[2].Value = Convert.ToInt32(ddl_part.SelectedValue);

                sp[3] = new SqlParameter("@SubjectId", SqlDbType.Int);
                sp[3].Value = Convert.ToInt32(ddl_subject.SelectedValue);

                sp[4] = new SqlParameter("@paper", SqlDbType.VarChar, 10);
                sp[4].Value = Server.HtmlEncode(ddl_paper.SelectedValue);

                sp[5] = new SqlParameter("@rollno", SqlDbType.VarChar, 50);
                sp[5].Value = Server.HtmlEncode(txt_rollno.Text);

                sp[6] = new SqlParameter("@mobile", SqlDbType.VarChar, 10);
                sp[6].Value = Server.HtmlEncode(txt_mobile.Text);

                sp[7] = new SqlParameter("@filepath", SqlDbType.NVarChar, 300);
                sp[7].Value = Server.HtmlEncode(logopath);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                string str_msg = "You have successfully submited your answer sheet for " + ddl_admissionclass.SelectedItem.Text + " Part " + ddl_part.SelectedValue + ", "+ddl_subject.SelectedItem.Text+"-" + ddl_paper.SelectedValue + "";

                msg.Send(txt_mobile.Text, str_msg);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('"+str_msg+"')", true);
                ClearMyPage();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('केवल पी.डी.ऍफ़. फाइल अपलोड करें |')", true);
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Save Details " + ee.Message + "')", true);
        }
    }
    protected void ClearMyPage()
    {
        try
        {
            ddl_subject.SelectedValue = "0";
            txt_rollno.Text = "";
            txt_mobile.Text = "";
        }
        catch (Exception ee)
        {

        }
    }
    protected void ddl_part_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourseSubject();
    }
}