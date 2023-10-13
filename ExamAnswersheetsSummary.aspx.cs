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

public partial class ExamAnswersheetsSummary : System.Web.UI.Page
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
                        SearchAssignment();
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

    protected void SearchAssignment()
    {
        try
        {
            string str_query = @"SELECT COUNT(dbo.TBL_EXAM_ANSWER.AnsId) AS TOTAL, dbo.TBL_EXAM_ANSWER.CourseId, dbo.TBL_EXAM_ANSWER.Part, dbo.TBL_EXAM_ANSWER.SubjectId, 
                         dbo.TBL_EXAM_ANSWER.paper, dbo.tbl_Course.CourseName, dbo.tbl_Subject.SubjectName
                            FROM dbo.TBL_EXAM_ANSWER INNER JOIN
                         dbo.tbl_Course ON dbo.TBL_EXAM_ANSWER.CourseId = dbo.tbl_Course.CourseId INNER JOIN
                         dbo.tbl_Subject ON dbo.TBL_EXAM_ANSWER.SubjectId = dbo.tbl_Subject.SubjectId AND dbo.tbl_Course.CourseId = dbo.tbl_Subject.CourseId
                            GROUP BY dbo.TBL_EXAM_ANSWER.CourseId, dbo.TBL_EXAM_ANSWER.Part, dbo.TBL_EXAM_ANSWER.SubjectId, dbo.TBL_EXAM_ANSWER.paper, 
                         dbo.tbl_Course.CourseName, dbo.tbl_Subject.SubjectName
						 ORDER BY CourseName,dbo.TBL_EXAM_ANSWER.Part,dbo.tbl_Subject.SubjectName,dbo.TBL_EXAM_ANSWER.paper";

            DataTable dt_search = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_search;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while Search " + ee.Message + "')", true);
        }
    }

    protected void imgbtn_download_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;

            int courseid = Convert.ToInt32(news_Grid.DataKeys[row.RowIndex].Values["CourseId"].ToString());
            int part = Convert.ToInt32(news_Grid.DataKeys[row.RowIndex].Values["Part"].ToString());
            int subjectid = Convert.ToInt32(news_Grid.DataKeys[row.RowIndex].Values["SubjectId"].ToString());

            //string subject = news_Grid.DataKeys[row.RowIndex].Values["SubjectName"].ToString().Replace(".", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "").Replace("", "");
            //string coursename = news_Grid.DataKeys[row.RowIndex].Values["CourseName"].ToString().Replace(".", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "").Replace("", "");

            string subject = news_Grid.DataKeys[row.RowIndex].Values["SubjectName"].ToString().Replace(",", " ");
            string coursename = news_Grid.DataKeys[row.RowIndex].Values["CourseName"].ToString();

            string paper = news_Grid.DataKeys[row.RowIndex].Values["paper"].ToString();

            string str_query = @"SELECT filepath FROM TBL_EXAM_ANSWER WHERE COURSEID="+courseid+" AND PART="+part+" AND SUBJECTID="+subjectid+" AND PAPER='"+paper+"'";
            DataTable dt_filepath = SqlHelper.ExecuteDataTable(Connection.My_Connection(),CommandType.Text,str_query);

            int flag = 0;
            if (dt_filepath.Rows.Count > 0)
            {
                using (ZipFile zip = new ZipFile())
                {

                    for (int i = 0; i < dt_filepath.Rows.Count; i++)
                    {
                        string actualpath = dt_filepath.Rows[i]["filepath"].ToString();
                        if (actualpath != "")
                        {
                            if (actualpath != "&nbsp;")
                            {
                                if (File.Exists(Server.MapPath(actualpath)))
                                {
                                    string filePath = Server.MapPath(actualpath);
                                    zip.AddFile(filePath, "files");
                                    flag = 1;

                                    //string onlypath = "J:\\PGDCA-2-DATABASE MANAGEMENT SYSTEM-Paper2\\";

                                    //string fileName = System.IO.Path.GetFileName(Server.MapPath(actualpath));
                                    //string destpath = System.IO.Path.Combine(onlypath, fileName);
                                    //File.Copy(Server.MapPath(actualpath), destpath, true);
                                }
                            }
                        }
                    }

                    if (flag == 1)
                    {
                        Response.Clear();
                        Response.AddHeader("Content-Disposition", "attachment; filename="+courseid+"-"+part+"-"+subject+"-"+paper+".zip");
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
}