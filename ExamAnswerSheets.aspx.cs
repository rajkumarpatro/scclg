using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;

public partial class ExamAnswerSheets : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    string saveLocation;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["iamuser"].ToString() == "")
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    try
                    {
                        //SearchAssignment("");
                        txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

                        GetCourse();
                        GetCourseSubject();
                    }
                    catch (Exception ee)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Fill Grid<br>" + ee.Message + "')", true);
                    }
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

    

    protected void SearchAssignment(string where)
    {
        try
        {
            string str_query = @"SELECT dbo.TBL_EXAM_ANSWER.AnsId, dbo.TBL_EXAM_ANSWER.CourseId, dbo.tbl_Course.CourseName, 
                         dbo.TBL_EXAM_ANSWER.Part, dbo.TBL_EXAM_ANSWER.SubjectId, dbo.tbl_Subject.SubjectName, dbo.TBL_EXAM_ANSWER.paper,
                         dbo.TBL_EXAM_ANSWER.rollno, dbo.TBL_EXAM_ANSWER.filepath,convert(varchar(10),UploadDate,105) as UploadDates
                         FROM   dbo.TBL_EXAM_ANSWER INNER JOIN
                         dbo.tbl_Course ON dbo.TBL_EXAM_ANSWER.CourseId = dbo.tbl_Course.CourseId INNER JOIN
                         dbo.tbl_Subject ON dbo.TBL_EXAM_ANSWER.SubjectId = dbo.tbl_Subject.SubjectId "+where+" order by UploadDate desc,CourseName,Part,SubjectName";

            DataTable dt_search = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_search;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while Search " + ee.Message + "')", true);
        }
    }

    
    protected void ddl_admissionclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourseSubject();
    }

    protected void ddl_part_SelectedIndexChanged(object sender, EventArgs e)
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
        SearchAssignment("where (dbo.TBL_EXAM_ANSWER.CourseId=" + ddl_admissionclass.SelectedValue + ") and (dbo.TBL_EXAM_ANSWER.Part=" + ddl_part.SelectedValue + ") and (dbo.TBL_EXAM_ANSWER.SubjectId=" + ddl_subject.SelectedValue + ")");
    }
    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {

        try
        {
            string str_eventdelete = "select * from TBL_EXAM_ANSWER where AnsId='" + lbl_user.Text + "'";
            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@AnsId", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(str_eventdelete);

            DataTable dt_event = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_eventdelete,sp);

            for (int i = 0; i < dt_event.Rows.Count; i++)
            {
                if (dt_event.Rows[i]["filepath"].ToString() != "")
                {
                    string path = Server.MapPath(dt_event.Rows[i]["filepath"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }


            //SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from TBL_EXAM_ANSWER where event_id=" + lbl_user.Text);

            SearchAssignment("");
        }
        catch (Exception ee)
        {
            lbl_user.Text = "Problem in Delete News<br>" + ee.Message;
        }

    }
     

     protected void btn_searchbydate_Click(object sender, EventArgs e)
     {
         SearchAssignment("where convert(varchar(10),UploadDate,105)='" + txtDisplayDate.Text + "'");
     }
     protected void btn_downloadzip_Click(object sender, EventArgs e)
     {
         try
         {

             int flag = 0;
             if (news_Grid.Rows.Count > 0)
             {
                 using (ZipFile zip = new ZipFile())
                 {

                     for (int i = 0; i < news_Grid.Rows.Count; i++)
                     {
                         string actualpath = news_Grid.Rows[i].Cells[11].Text.ToString();
                         if (actualpath != "")
                         {
                             if (actualpath != "&nbsp;")
                             {
                                 if (File.Exists(Server.MapPath(actualpath)))
                                 {
                                     string filePath = Server.MapPath(actualpath);
                                     zip.AddFile(filePath, "files");
                                     flag = 1;
                                 }
                             }
                         }
                     }

                     if (flag == 1)
                     {
                         Response.Clear();
                         Response.AddHeader("Content-Disposition", "attachment; filename=DownloadedFile.zip");
                         Response.ContentType = "application/zip";
                         zip.Save(Response.OutputStream);
                         Response.End();
                     }
                     else
                     {
                         ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('No Files Added to Zip')", true);
                     }

                 }
             }
         }
         catch (Exception ee)
         {
             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Download- " + ee.Message + "')", true);
         }
     }
     protected void btn_rename_Click(object sender, EventArgs e)
     { 
         int i=0;
         try
         {
             if (news_Grid.Rows.Count > 0)
             {
                 for (i = 0; i < news_Grid.Rows.Count; i++)
                 {
                     string actualpath = news_Grid.Rows[i].Cells[11].Text.ToString();
                     string course = news_Grid.Rows[i].Cells[7].Text.ToString();
                     string part = news_Grid.Rows[i].Cells[5].Text.ToString();
                     string subject = news_Grid.Rows[i].Cells[4].Text.ToString();
                     string paper = news_Grid.Rows[i].Cells[8].Text.ToString();
                     string rollno = news_Grid.Rows[i].Cells[9].Text.ToString();
                     string assignid = news_Grid.Rows[i].Cells[12].Text.ToString();

                     if (actualpath != "")
                     {
                         if (actualpath != "&nbsp;")
                         {
                            string path = Server.MapPath("~");
                            string filename = actualpath.Substring(9,actualpath.Length - 9);
                            string fileexension = filename.Substring(filename.Length - 4,4);
                            string Fromfile = path + "\\newsData\\" + filename;
                            string newfile="assignment" + course + "_Part_"+part+"_" + subject + "_" + paper + "_Roll No_" + rollno + "_" + assignid + fileexension;
                            string Tofile = path + "\\newsData\\"+newfile;
                            if (File.Exists(Fromfile))
                            {
                                File.Move(Fromfile, Tofile);
                            }

                            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "update TBL_EXAM_ANSWER set filepath='newsData/" + newfile + "' where AnsId="+assignid+"");

                         }
                     }
                 }
             }
         }
         catch (Exception ee)
         {
             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + ee.Message + " line no. "+(i+1).ToString()+"')", true);
         }
     }

     protected void btn_delete_Click(object sender, EventArgs e)
     {
         try
         {

             if (news_Grid.Rows.Count > 0)
             {
                 for (int i = 0; i < news_Grid.Rows.Count; i++)
                 {
                     string actualpath = news_Grid.Rows[i].Cells[11].Text.ToString();
                     if (actualpath != "")
                     {
                         if (actualpath != "&nbsp;")
                         {
                             FileInfo file = new FileInfo(Server.MapPath(actualpath));
                             if (file.Exists)//check file exsit or not
                             {
                                 file.Delete();
                             }
                         }
                     }
                 }
                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('All Files Deleted Successfully')", true);
             }
         }
         catch (Exception ee)
         {
             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Delete Files- " + ee.Message + "')", true);
         }
     }
}