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

public partial class post_roll_list : System.Web.UI.Page
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
                if (Session["iamuser"].ToString() == "")
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    GetCourse();
                    ClearMyPage();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_assignment.aspx");
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
        }
        catch (Exception ee)
        {
 
        }
    }

    protected void ClearMyPage()
    {
        txt_Title.Text = "";
        FileUpload1.Visible = true;
        chk_new.Visible = false;
        chk_new.Checked = false;
        GetRecord();
    }

    protected void GetRecord()
    {
        try
        {
            string str_query = @"SELECT dbo.tbl_roll_list.AId, dbo.tbl_roll_list.CourseId, dbo.tbl_roll_list.CourseType, dbo.tbl_roll_list.Part, dbo.tbl_roll_list.ATitle, dbo.tbl_roll_list.APath, 
                         dbo.tbl_Course.CourseName FROM dbo.tbl_Course INNER JOIN
                         dbo.tbl_roll_list ON dbo.tbl_Course.CourseId = dbo.tbl_roll_list.CourseId order by CourseType,CourseName,Part";

            DataTable dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            gv_record.DataSource = dt_record;
            gv_record.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error on GetRecord " + ee.Message;
        }
    }

    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btnedit = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

        lbl_Id.Text = gv_record.DataKeys[gvrow.RowIndex].Values["AId"].ToString();
        ddl_admissionclass.SelectedValue = gv_record.DataKeys[gvrow.RowIndex].Values["CourseId"].ToString();
        Label1.Text = gv_record.DataKeys[gvrow.RowIndex].Values["APath"].ToString();
        ddl_admissionclasstype.SelectedValue = gvrow.Cells[5].Text;
        txt_Title.Text = gvrow.Cells[6].Text;

        FileUpload1.Visible = false;
        chk_new.Visible = true;
    }

    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btnedit = sender as ImageButton;
        GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

        string id = gv_record.DataKeys[gvrow.RowIndex].Values["AId"].ToString();

        string str_delete = "delete from tbl_roll_list where AId=@AId";
        
        sp = new SqlParameter[1];

        sp[0] = new SqlParameter("@AId", SqlDbType.Int);
        sp[0].Value = Convert.ToInt32(id);

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Saved successfully')", true);
    }

    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            Label1.Text = "0";
        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Label1.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                saveLocation = "Assignments/RollList" + lbl_Id.Text.ToString() + picext;
                FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
            }
            else
            {
                saveLocation = Label1.Text;
            }

            if (lbl_Id.Text == "")
            {
                string str_insert = @"INSERT INTO [dbo].[tbl_roll_list] ([AId] ,[CourseId] ,[CourseType] ,[Part] ,[ATitle] ,[APath]) 
                                VALUES (@AId ,@CourseId ,@CourseType ,@Part ,@ATitle ,@APath)";

                sp = new SqlParameter[6];

                int id =Convert.ToInt32(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select (isnull(max(AId),0)+1) as ID from tbl_roll_list"));

                sp[0] = new SqlParameter("@AId", SqlDbType.Int);
                sp[0].Value = id;

                sp[1] = new SqlParameter("@CourseId", SqlDbType.Int);
                sp[1].Value = ddl_admissionclass.SelectedValue;

                sp[2] = new SqlParameter("@CourseType", SqlDbType.VarChar, 10);
                sp[2].Value = ddl_admissionclasstype.SelectedValue;

                sp[3] = new SqlParameter("@Part", SqlDbType.Int);
                sp[3].Value = ddl_part.SelectedValue;

                sp[4] = new SqlParameter("@ATitle", SqlDbType.NVarChar, 200);
                sp[4].Value = Server.HtmlEncode(txt_Title.Text);

                sp[5] = new SqlParameter("@APath", SqlDbType.NVarChar, 200);
                sp[5].Value = saveLocation;

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Saved successfully')", true);
            }
            else
            {
                string str_insert = @"UPDATE [dbo].[tbl_roll_list] SET [CourseId] = @CourseId ,[CourseType] = @CourseType ,[Part] = @Part
                                    ,[ATitle] = @ATitle ,[APath] = @APath WHERE [AId] = @AId";

                sp = new SqlParameter[6];

                sp[0] = new SqlParameter("@CourseId", SqlDbType.Int);
                sp[0].Value = ddl_admissionclass.SelectedValue;

                sp[1] = new SqlParameter("@CourseType", SqlDbType.VarChar, 10);
                sp[1].Value = ddl_admissionclasstype.SelectedValue;

                sp[2] = new SqlParameter("@Part", SqlDbType.Int);
                sp[2].Value = ddl_part.SelectedValue;

                sp[3] = new SqlParameter("@ATitle", SqlDbType.NVarChar, 200);
                sp[3].Value = Server.HtmlEncode(txt_Title.Text);

                sp[4] = new SqlParameter("@APath", SqlDbType.NVarChar, 200);
                sp[4].Value = saveLocation;

                sp[5] = new SqlParameter("@AId", SqlDbType.Int);
                sp[5].Value = Convert.ToInt32(lbl_Id.Text);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Saved successfully')", true);
            }
        }
        catch (Exception ee)
        {
            lblInfo.Text = ee.Message;
        }
    }
}
