using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assignment : System.Web.UI.Page
{
    SqlParameter[] sp = null;
    UIHelper uiHelper = new UIHelper();
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
           
            admissionclass();
           

           
            //chk_not.Visible = false;

        }
    }
    protected void admissionclass()
    {
        DataTable dt_admission_class = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT CourseId, CourseName FROM tbl_material_classes WHERE CourseType='UG' AND CourseEnable='Yes' AND CourseId!='23' AND CourseId!='22' ");
        ddl_admissionclass.DataSource = dt_admission_class;
        ddl_admissionclass.DataTextField = "CourseName";
        ddl_admissionclass.DataValueField = "CourseId";
        ddl_admissionclass.DataBind();
        ddl_admissionclass.Items.Insert(0, new ListItem("Select", "0"));
        
    }


    protected void ddl_admissionclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        //GetCourseSubject();
        GetCourseSubject();
    }
    
    //protected void chk_new_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (chk_new.Checked == true)
    //    {
    //        FileUpload1.Visible = true;
    //        img_logo.Visible = false;
    //        chk_not.Visible = true;
    //    }
    //    else
    //    {
    //        FileUpload1.Visible = false;
    //        img_logo.Visible = true;
    //        chk_not.Visible = false;
    //    }
    //}
    
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

            //if (ddl_admissionclass.SelectedValue=="19")
            //{

            //DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT SubjectName,SubjectId FROM tbl_Subject WHERE SubjectId in (377,438,83)", sp);

            //ddl_subject.DataSource = dt_data;
            //ddl_subject.DataTextField = "SUBJECTNAME";
            //ddl_subject.DataValueField = "SUBJECTID";
            //ddl_subject.DataBind();

            //ddl_subject.Items.Insert(0, new ListItem("Select", "0"));
            //}
            //else if (ddl_admissionclass.SelectedValue == "21")
            //{
            //    DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT SubjectName,SubjectId FROM tbl_Subject WHERE SubjectId in (377,438,514)", sp);

            //    ddl_subject.DataSource = dt_data;
            //    ddl_subject.DataTextField = "SUBJECTNAME";
            //    ddl_subject.DataValueField = "SUBJECTID";
            //    ddl_subject.DataBind();

            //    ddl_subject.Items.Insert(0, new ListItem("Select", "0"));
            //}
            //else
            //{
            //    DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT SubjectName,SubjectId FROM tbl_Subject WHERE SubjectId in (377,438,404)", sp);

            //    ddl_subject.DataSource = dt_data;
            //    ddl_subject.DataTextField = "SUBJECTNAME";
            //    ddl_subject.DataValueField = "SUBJECTID";
            //    ddl_subject.DataBind();

            //    ddl_subject.Items.Insert(0, new ListItem("Select", "0"));
            //}

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
           

            string logopath = "";
            int assignment_id = op.generate_id_sql("SELECT ISNULL(MAX(assig_id),0) FROM TBL_ASSIGNMENT_STUDENT");
            lbl_user.Text = assignment_id.ToString();
                    string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                    if (picext == ".pdf" )
                    {
                        logopath = Server.MapPath("newsData/ass-rollno_" + txt_rollno.Text + "_" + ddl_admissionclass.SelectedItem.Text + "_Part_" + ddl_part.SelectedItem.Text + "_" + ddl_subject.SelectedItem.Text + "_" + txt_paper_name.Text + "_" + lbl_user.Text.ToString() + "" + picext);

                        logopath = "newsData/ass-rollno_"+ txt_rollno.Text+"_" + ddl_admissionclass.SelectedItem.Text + "_Part_" + ddl_part.SelectedItem.Text + "_" + ddl_subject.SelectedItem.Text + "_" + txt_paper_name.Text + "_" + lbl_user.Text.ToString() + "" + picext;
                        FileUpload1.PostedFile.SaveAs(MapPath(logopath));
                        Label1.Text = logopath.ToString();
                    }



                   

            string str_insert = @"INSERT INTO [dbo].[TBL_ASSIGNMENT_STUDENT]([assig_id],[CourseId],[Part],[SubjectId],[paper],[rollno],[filepath],UploadDate)
                        VALUES (@assig_id,@CourseId,@Part,@SubjectId,@paper, @rollno,@filepath,GETDATE())";

            sp = new SqlParameter[7];

            sp[0] = new SqlParameter("@assig_id", SqlDbType.Int);
            sp[0].Value = assignment_id;

            sp[1] = new SqlParameter("@CourseId", SqlDbType.NVarChar, 150);
            sp[1].Value = Server.HtmlEncode(ddl_admissionclass.SelectedValue);

            sp[2] = new SqlParameter("@Part", SqlDbType.NVarChar, 150);
            sp[2].Value = Server.HtmlEncode(ddl_part.SelectedValue);

            sp[3] = new SqlParameter("@SubjectId", SqlDbType.NVarChar, -1);
            sp[3].Value = Server.HtmlEncode(ddl_subject.SelectedValue);

            sp[4] = new SqlParameter("@paper", SqlDbType.NVarChar, 10);
            sp[4].Value = Server.HtmlEncode(txt_paper_name.Text);

            sp[5] = new SqlParameter("@rollno", SqlDbType.NVarChar, 150);
            sp[5].Value = Server.HtmlEncode(txt_rollno.Text);

            sp[6] = new SqlParameter("@filepath", SqlDbType.NVarChar, 150);
            sp[6].Value = Server.HtmlEncode(logopath);

           



            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Your Assignment Data Submit Successfully')", true);
            ClearMyPage();
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
            txt_paper_name.Text = "";
            txt_rollno.Text = "";
           ;
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