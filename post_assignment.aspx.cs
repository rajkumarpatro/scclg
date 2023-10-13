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

public partial class post_assignment : System.Web.UI.Page
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
                if (Session["ResultAdminUser"] == null)
                {
                    Response.Redirect("SCDURG-Result.aspx");
                }
                else
                {
                    txt_date.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    CheckDocumentType();
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
            int id =Convert.ToInt32(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select (ISNULL(max(AId),0) + 1) as ID from tbl_assignment"));

            string picname = System.IO.Path.GetFileNameWithoutExtension(e.FileName);
            string picext = System.IO.Path.GetExtension(e.FileName);
            saveLocation = "Assignments/" + id + picext;

            saveLocation = Server.MapPath("~/Assignments/" + id + picext);
            AjaxFileUpload1.SaveAs(saveLocation);

            saveLocation = "Assignments/" + id + picext;

            string str_insert = @"INSERT INTO [dbo].[tbl_assignment] ([AId] ,[ATitle] ,[APath])
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

            ddl_part.Items.Clear();
            ddl_part.Items.Insert(0, new ListItem("1", "1"));
            ddl_part.Items.Insert(1, new ListItem("2", "2"));
            ddl_part.Items.Insert(2, new ListItem("3", "3"));

            if (ddl_admissionclasstype.SelectedValue == "PG")
            {
                ddl_part.Items.Insert(3, new ListItem("4", "4"));
            }
        }
        catch (Exception ee)
        {
 
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            string str_insert = @"UPDATE [dbo].[tbl_assignment] SET [CourseId] = @CourseId ,[CourseType] = @CourseType ,[Part] = @Part, AYear=@AYear, AShow=@AShow, AType=@AType, ADate=@ADate WHERE [CourseId] IS NULL";

            sp = new SqlParameter[7];

            int courseid = 0;
            int part = 0;
            if (ddl_admissionclass.Visible == true)
            {
                courseid =Convert.ToInt32(ddl_admissionclass.SelectedValue);
            }

            if (ddl_part.Visible == true)
            {
                part = Convert.ToInt32(ddl_part.SelectedValue);
            }

            sp[0] = new SqlParameter("@CourseId", SqlDbType.Int);
            sp[0].Value = courseid;

            sp[1] = new SqlParameter("@CourseType", SqlDbType.VarChar, 10);
            sp[1].Value = ddl_admissionclasstype.SelectedValue;

            sp[2] = new SqlParameter("@Part", SqlDbType.Int);
            sp[2].Value = part;

            sp[3] = new SqlParameter("@AYear", SqlDbType.VarChar, 50);
            sp[3].Value = ddl_session.SelectedValue;

            sp[4] = new SqlParameter("@AShow", SqlDbType.VarChar, 3);
            sp[4].Value = ddl_show.SelectedValue;

            sp[5] = new SqlParameter("@AType", SqlDbType.VarChar, 30);
            sp[5].Value = ddl_type.SelectedValue;

            sp[6] = new SqlParameter("@ADate", SqlDbType.DateTime);
            sp[6].Value = DateTime.ParseExact(txt_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Saved successfully')", true);
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while update " + ee.Message + "')", true);
        }
    }

    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;

            int aid = Convert.ToInt32(news_Grid.DataKeys[row.RowIndex].Values["AId"].ToString());

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@AId", SqlDbType.Int);
            sp2[0].Value = aid;

            string str_pdfdelete = "select APath from dbo.tbl_assignment where AId=@AId";
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
            sp[0].Value = aid;

            string str_delete = "delete from dbo.tbl_assignment where AId=@AId";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);
            string str_where = " and AYear='" + ddl_session.SelectedValue + "' and PART=" + ddl_part.SelectedValue + "";
            if (ddl_admissionclass.Visible == true)
            {
                str_where = str_where + " and dbo.tbl_assignment.CourseId=" + ddl_admissionclass.SelectedValue + "";
            }
            GetList(str_where);
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Question Paper Details<br>" + ee.Message;
        }
    }

    protected void lnk_enabledisable_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkupdate = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnkupdate.NamingContainer;
            string str_enabledisable = "";
            if (lnkupdate.Text == "Yes")
            {
                str_enabledisable = "No";
            }
            else
            {
                str_enabledisable = "Yes";
            }

            string str_update = @"UPDATE tbl_assignment SET AShow='" + str_enabledisable + "' WHERE AId=@AId";
            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@AId", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["AId"].ToString()); ;

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Course details updated successfully')", true);

            string str_where = " and AYear='" + ddl_session.SelectedValue + "' and PART=" + ddl_part.SelectedValue + "";
            if (ddl_admissionclass.Visible == true)
            {
                str_where = str_where + " and dbo.tbl_assignment.CourseId=" + ddl_admissionclass.SelectedValue + "";
            }
            GetList(str_where);
        }
        catch (Exception ee)
        {

        }
    }

    protected void GetList(string str_where)
    {
        try
        {
            string str_query = @"SELECT AId, CourseId, CourseType, Part, ATitle, APath, AShow, AType, CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) AS ADate
                                FROM dbo.tbl_assignment
                                where AType='" + ddl_type.SelectedValue + "' " + str_where + " order by ATitle";
            DataTable dt_ass = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_ass;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while search " + ee.Message + "')", true);
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        string str_where =" and AYear='" + ddl_session.SelectedValue + "'";
        if (ddl_admissionclass.Visible == true)
        {
            str_where = str_where + " and dbo.tbl_assignment.CourseId=" + ddl_admissionclass.SelectedValue + " and PART=" + ddl_part.SelectedValue + "";
        }
        GetList(str_where);
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_assignment.aspx");
    }

    protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckDocumentType();
    }

    protected void CheckDocumentType()
    {
        try
        {
            if (ddl_type.SelectedValue == "Question Paper")
            {
                //ddl_admissionclass.Visible = false;
                //ddl_part.Visible = false;

                ddl_admissionclass.Visible = true;
                ddl_part.Visible = true;
            }
            else
            {
                ddl_admissionclass.Visible = true;
                ddl_part.Visible = true;
            }
        }
        catch (Exception ee)
        {
 
        }
    }
    protected void btn_search_by_date_Click(object sender, EventArgs e)
    {
        GetList(" and CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) = '" + txt_search.Text + "' ");
    }
    protected void btn_yesall_Click(object sender, EventArgs e)
    {
        try
        {
            if (news_Grid.Rows.Count != 0)
            {
                int j = 0;
                for (int i = 0; i < news_Grid.Rows.Count; i++)
                {
                    string aid = news_Grid.DataKeys[i].Values["AId"].ToString();
                    string str_insert = @"UPDATE [dbo].[tbl_assignment] SET [ASHOW] = @ASHOW WHERE [AID] = @AID";

                    sp = new SqlParameter[2];

                    sp[0] = new SqlParameter("@ASHOW", SqlDbType.VarChar, 3);
                    sp[0].Value = "Yes";

                    sp[1] = new SqlParameter("@AID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(aid);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    j++;
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + (j).ToString() + " Records Added/Updated Successfully')", true);
                if (txt_search.Text != "")
                {
                    GetList(" and CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) = '" + txt_search.Text + "' ");
                }
                else
                {
                    string str_where = " and AYear='" + ddl_session.SelectedValue + "'";
                    if (ddl_admissionclass.Visible == true)
                    {
                        str_where = str_where + " and dbo.tbl_assignment.CourseId=" + ddl_admissionclass.SelectedValue + " and PART=" + ddl_part.SelectedValue + "";
                    }
                    GetList(str_where);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('No Records To Save')", true);
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + ee.Message + "')", true);
        }
    }

    protected void btn_noall_Click(object sender, EventArgs e)
    {
        try
        {
            if (news_Grid.Rows.Count != 0)
            {
                int j = 0;
                for (int i = 0; i < news_Grid.Rows.Count; i++)
                {
                    string aid = news_Grid.DataKeys[i].Values["AId"].ToString();
                    string str_insert = @"UPDATE [dbo].[tbl_assignment] SET [ASHOW] = @ASHOW WHERE [AID] = @AID";

                    sp = new SqlParameter[2];

                    sp[0] = new SqlParameter("@ASHOW", SqlDbType.VarChar, 3);
                    sp[0].Value = "No";

                    sp[1] = new SqlParameter("@AID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(aid);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    j++;
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + (j).ToString() + " Records Added/Updated Successfully')", true);
                if (txt_search.Text != "")
                {
                    GetList(" and CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) = '" + txt_search.Text + "' ");
                }
                else
                {
                    string str_where = " and AYear='" + ddl_session.SelectedValue + "'";
                    if (ddl_admissionclass.Visible == true)
                    {
                        str_where = str_where + " and dbo.tbl_assignment.CourseId=" + ddl_admissionclass.SelectedValue + " and PART=" + ddl_part.SelectedValue + "";
                    }
                    GetList(str_where);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('No Records To Save')", true);
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + ee.Message + "')", true);
        }
    }

    protected void btn_deleteall_Click(object sender, EventArgs e)
    {
        try
        {
            if (news_Grid.Rows.Count != 0)
            {
                int j = 0;
                for (int i = 0; i < news_Grid.Rows.Count; i++)
                {
                    string aid = news_Grid.DataKeys[i].Values["AId"].ToString();
                    string filepath = news_Grid.DataKeys[i].Values["APath"].ToString();
                    if (filepath != "")
                    {
                        string path = Server.MapPath(filepath);
                        FileInfo file = new FileInfo(path);
                        if (file.Exists)//check file exsit or not
                        {
                            file.Delete();
                        }
                    }

                    sp = new SqlParameter[1];

                    sp[0] = new SqlParameter("@AId", SqlDbType.Int);
                    sp[0].Value = aid;

                    string str_delete = "delete from dbo.tbl_assignment where AId=@AId";
                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

                    j++;
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + (j).ToString() + " Records Deleted Successfully')", true);
                if (txt_search.Text != "")
                {
                    GetList(" and CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) = '" + txt_search.Text + "' ");
                }
                else
                {
                    string str_where = " and AYear='" + ddl_session.SelectedValue + "'";
                    if (ddl_admissionclass.Visible == true)
                    {
                        str_where = str_where + " and dbo.tbl_assignment.CourseId=" + ddl_admissionclass.SelectedValue + " and PART=" + ddl_part.SelectedValue + "";
                    }
                    GetList(str_where);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('No Records To Delete')", true);
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + ee.Message + "')", true);
        }
    }
}
