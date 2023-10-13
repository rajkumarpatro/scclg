using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;

public partial class post_questionpaper : System.Web.UI.Page
{
    
    string saveLocation;

    sql_operations op = new sql_operations();
    SqlParameter[] sp = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            
            try
            {
                if (Session["ResultAdminUser"] ==null)
                {
                    Response.Redirect("SCDURG-Result.aspx");
                }
                else
                { 
                    int j=0;
                    for (int i = 2017; i <= Convert.ToInt32(DateTime.Now.ToString("yyyy")); i++)
                    {
                        ddl_year.Items.Insert(j, new ListItem(i.ToString(), i.ToString()));
                        j++;
                    }
                        GetCourse();
                }
            }
            catch
            {
                Response.Redirect("SCDURG-Result.aspx");
            }
        }
    }

    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        try
        {
            int id =Convert.ToInt32(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select (ISNULL(max(AId),0) + 1) as ID from tbl_questionpaper"));

            string picname = System.IO.Path.GetFileName(e.FileName);
            string picext = System.IO.Path.GetExtension(e.FileName);
            saveLocation = "QP/" + id + picext;

            saveLocation = Server.MapPath("~/QP/" + id + picext);
            AjaxFileUpload1.SaveAs(saveLocation);

            saveLocation = "QP/" + id + picext;

            string str_insert = @"INSERT INTO [dbo].[tbl_questionpaper] ([AId] ,[ATitle] ,[APath])
                                VALUES (@AId ,@ATitle ,@APath)";

            sp = new SqlParameter[3];

            sp[0] = new SqlParameter("@AId", SqlDbType.Int);
            sp[0].Value = id;

            sp[1] = new SqlParameter("@ATitle", SqlDbType.VarChar, 500);
            sp[1].Value = Server.HtmlEncode(picname);

            sp[2] = new SqlParameter("@APath", SqlDbType.VarChar, 500);
            sp[2].Value = Server.HtmlEncode(saveLocation);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in adding image<br>" + ee.Message;
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }
    
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_questionpaper.aspx");
    }


    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }

    protected void GetCourse()
    {
        try
        {
            string str_query = "select CourseId,CourseName from tbl_Course where CourseType='"+ddl_admissionclasstype.SelectedValue+"'";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_admissionclass.DataSource = dt;
            ddl_admissionclass.DataTextField = "CourseName";
            ddl_admissionclass.DataValueField = "CourseId";
            ddl_admissionclass.DataBind();

            if (ddl_admissionclasstype.SelectedValue == "PG")
            {
                ddl_admissionclass.Visible = false;
            }
            else
            {
                ddl_admissionclass.Visible = true;
            }
        }
        catch (Exception ee)
        {
 
        }
    }
    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string str_insert = @"UPDATE [dbo].[tbl_questionpaper] SET [CourseId] = @CourseId ,[CourseType] = @CourseType ,[Part] = @Part,AYear=@AYear WHERE [CourseId] IS NULL";

            sp = new SqlParameter[4];

            if (ddl_admissionclasstype.SelectedValue == "PG")
            {
                ddl_admissionclass.Visible = false;
            }
            else
            {
                ddl_admissionclass.Visible = true;
            }


            sp[0] = new SqlParameter("@CourseId", SqlDbType.Int);
            if (ddl_admissionclasstype.SelectedValue == "PG")
            {
                sp[0].Value = 0;
            }
            else
            {
                sp[0].Value = ddl_admissionclass.SelectedValue;
            }
            

            sp[1] = new SqlParameter("@CourseType", SqlDbType.VarChar, 10);
            sp[1].Value = ddl_admissionclasstype.SelectedValue;

            sp[2] = new SqlParameter("@Part", SqlDbType.Int);
            sp[2].Value = ddl_part.SelectedValue;

            sp[3] = new SqlParameter("@AYear", SqlDbType.Int);
            sp[3].Value = ddl_year.SelectedValue;

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Saved successfully')", true);
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while Save "+ee.Message+"')", true);
        }
    }

    protected void GetList()
    {
        string str_where = "";
        if (ddl_admissionclasstype.SelectedValue == "UG")
        {
            str_where = " and CourseId=" + ddl_admissionclass.SelectedValue + " ";
        }
        string str_query = @"SELECT [AId] ,[CourseId] ,[CourseType] ,[Part] ,[AYear] ,[ATitle] ,[APath] FROM [dbo].[tbl_questionpaper] WHERE CourseType='" + ddl_admissionclasstype.SelectedValue + "' "+str_where+" and Part=" + ddl_part.SelectedValue + " and AYear=" + ddl_year.SelectedValue + " order by ATitle";

        DataTable dt_list = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

        news_Grid.DataSource = dt_list;
        news_Grid.DataBind();
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        GetList();
    }

    protected void imgbtn_enquiry_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@AId", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_pdfdelete = "select APath from dbo.tbl_questionpaper where AId=@AId";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_pdfdelete, sp2);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["APath"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["APath"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@AId", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_delete = "delete from dbo.tbl_questionpaper where AId=@AId";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

            

            GetList();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Question Paper Details<br>" + ee.Message;
        }
    }
}
