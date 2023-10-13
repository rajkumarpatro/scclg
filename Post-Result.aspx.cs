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


using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;



public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();

    SqlParameter[] sp = null;

    string saveLocation = "";

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
                    lbl_user.Text = "Hello " + Session["ResultAdminName"].ToString();
                    if (ddl_topic.DataSource == null)
                    {
                        GetTopics();
                    }

                    for (int i = Convert.ToInt32(DateTime.Now.ToString("yyyy")) - 2; i <= Convert.ToInt32(DateTime.Now.ToString("yyyy")) + 1; i++)
                    {
                        ddl_year.Items.Add(i.ToString());
                    }
                    ddl_year.Items.Insert(0, new ListItem("Select Year", "0"));

                    CheckTopicStatus();
                    txt_title.Text = "";
                }
            }
            catch
            {
                Response.Redirect("SCDURG-Result.aspx");
            }
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Result.aspx");
    }

        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Result.aspx");
    }

    protected void GetTopics()
    {
        try
        {
            DataTable dt_topics = new DataTable();
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select ResultClassID,ResultClassName from tbl_ResultClassMaster where ResultClassStatus='Yes' order by ResultClassName");

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "ResultClassName";
            ddl_topic.DataValueField = "ResultClassID";
            ddl_topic.DataBind();

            ddl_topic.Items.Insert(0, new ListItem("Select Title", "0"));

            FillTitleGrid();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Get Topics<br>"+ee.Message;
        }
    }

    protected void FillTitleGrid()
    {
        try
        {
            DataTable dt_topics = new DataTable();
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select ResultClassID,ResultClassName,ResultClassStatus from tbl_ResultClassMaster order by ResultClassID");

            gv_topic.DataSource = dt_topics;
            gv_topic.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Fill Title Grid<br>" + ee.Message;
        }
    }

    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        CheckTopicStatus();
    }

    protected void CheckTopicStatus()
    {
        if (chk_new.Checked == true)
        {
            span_topic.Visible = true;
            ddl_topic.Visible = false;
            AjaxFileUpload1.Visible = false;
        }
        else
        {
            span_topic.Visible = false;
            ddl_topic.Visible = true;
            AjaxFileUpload1.Visible = true;
        }
    }

    
    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow row = (GridViewRow)btnedit.NamingContainer;

            lbl_title_id.Text = row.Cells[0].Text;
            txt_title.Text = row.Cells[1].Text;
            ddl_show.Text = row.Cells[2].Text;
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Edit Topic Details<br>" + ee.Message;
        }
    }
    protected void imgbtn_enquiry_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_pdfdelete = "select ResultPath from dbo.tbl_ResultDetails where ResultClassID=@ResultClassID";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_pdfdelete,sp2);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["ResultPath"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["ResultPath"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_delete = "delete from dbo.tbl_ResultDetails where ResultClassID=@ResultClassID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

            SqlParameter[] sp1=new SqlParameter[1];
            sp1[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_delete1 = "delete from dbo.tbl_ResultClassMaster where ResultClassID=@ResultClassID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete1, sp1);

            GetTopics();
            span_topic.Visible = false;
            chk_new.Checked = false;
            txt_title.Text = "";
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Topic Details<br>" + ee.Message;
        }
    }
    protected void btn_Edittopic_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (lbl_title_id.Text=="")
            {
                int title_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(ResultClassID),0) FROM [dbo].tbl_ResultClassMaster");

                string str_insert = @"INSERT INTO [dbo].[tbl_ResultClassMaster] ([ResultClassID] ,[ResultClassName] ,[ResultClassStatus],[DateTimeStamp])
                                    VALUES (@ResultClassID ,@ResultClassName ,@ResultClassStatus,GETDATE())";

                sp = new SqlParameter[3];

                sp[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
                sp[0].Value = title_id;

                sp[1] = new SqlParameter("@ResultClassName", SqlDbType.NVarChar,60);
                sp[1].Value = Server.HtmlEncode(txt_title.Text);

                sp[2] = new SqlParameter("@ResultClassStatus", SqlDbType.VarChar,3);
                sp[2].Value = Server.HtmlEncode(ddl_show.Text);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
            }
            else
            {
                string str_update = @"UPDATE [dbo].[tbl_ResultClassMaster] SET [ResultClassName] = @ResultClassName, 
                                    [ResultClassStatus] = @ResultClassStatus, [DateTimeStamp]=GETDATE() WHERE [ResultClassID] = @ResultClassID";

                sp = new SqlParameter[3];

                sp[0] = new SqlParameter("@ResultClassName", SqlDbType.NVarChar, 60);
                sp[0].Value = Server.HtmlEncode(txt_title.Text);

                sp[1] = new SqlParameter("@ResultClassStatus", SqlDbType.VarChar, 3);
                sp[1].Value = Server.HtmlEncode(ddl_show.Text);

                sp[2] = new SqlParameter("@ResultClassID", SqlDbType.Int);
                sp[2].Value = Convert.ToInt32(lbl_title_id.Text);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
            }

            GetTopics();
            txt_title.Text = "";
            lbl_title_id.Text = "";
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Topic Details<br>" + ee.Message;
        }
    }
    protected void btn_ok_Click(object sender, ImageClickEventArgs e)
    {        
        chk_new.Checked = false;
        AjaxFileUpload1.Visible = true;
        CheckTopicStatus();
    }

    protected int ValidateMyForm()
    {
        if (Session["Topic"].ToString() == "0")
        {
            lblInfo.Text = "Please Select Topic";
            return (0);
        }
        else if (Session["Year"].ToString() == "" || Session["Year"].ToString().Length != 4)
        {
            lblInfo.Text = "Please Enter Vaild Year";
            return (0);
        }
        else
        {
            return (1);
        }
    }

    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        if(ValidateMyForm()==1)
        {
            try
            {
                string picname = System.IO.Path.GetFileNameWithoutExtension(e.FileName);
                string picext = System.IO.Path.GetExtension(e.FileName);

                saveLocation = Server.MapPath("~/Result/" + Session["Topic"].ToString() + "_" + Server.HtmlEncode(Session["Year"].ToString()) + "_" + picname + picext);
                AjaxFileUpload1.SaveAs(saveLocation);

                saveLocation = "Result/" + Session["Topic"].ToString() + "_" + Server.HtmlEncode(Session["Year"].ToString()) + "_" + picname + picext;

                if (sql_op.check_exist_sql("Select dbo.tbl_ResultDetails.ResultRollNumber from dbo.tbl_ResultDetails where dbo.tbl_ResultDetails.ResultClassID=" + Convert.ToInt32(Session["Topic"].ToString()) + " and dbo.tbl_ResultDetails.ResultYear=" + Convert.ToInt32(Server.HtmlEncode(Session["Year"].ToString())) + " and dbo.tbl_ResultDetails.ResultRollNumber='" + Server.HtmlEncode(picname) + "'"))
                {
                    //Update
                    string str_update = @"UPDATE [dbo].[tbl_ResultDetails] SET [ResultPath] = @ResultPath 
                    WHERE [ResultClassID] = @ResultClassID and [ResultRollNumber] = @ResultRollNumber and [ResultYear] = @ResultYear";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@ResultPath", SqlDbType.VarChar, 200);
                    sp[0].Value = Server.HtmlEncode(saveLocation);

                    sp[1] = new SqlParameter("@ResultClassID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(Server.HtmlEncode(Session["Topic"].ToString()));

                    sp[2] = new SqlParameter("@ResultRollNumber", SqlDbType.VarChar, 20);
                    sp[2].Value = Server.HtmlEncode(picname);

                    sp[3] = new SqlParameter("@ResultYear", SqlDbType.Int);
                    sp[3].Value = Convert.ToInt32(Server.HtmlEncode(Session["Year"].ToString()));

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                }
                else
                {
                    //Insert
                    string str_insert = @"INSERT INTO [dbo].[tbl_ResultDetails] ([ResultClassID] ,[ResultRollNumber] ,[ResultYear] ,[ResultPath])
                    VALUES (@ResultClassID ,@ResultRollNumber ,@ResultYear ,@ResultPath)";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
                    sp[0].Value = Convert.ToInt32(Server.HtmlEncode(Session["Topic"].ToString()));

                    sp[1] = new SqlParameter("@ResultRollNumber", SqlDbType.VarChar, 20);
                    sp[1].Value = Server.HtmlEncode(picname);

                    sp[2] = new SqlParameter("@ResultYear", SqlDbType.Int);
                    sp[2].Value = Convert.ToInt32(Server.HtmlEncode(Session["Year"].ToString()));

                    sp[3] = new SqlParameter("@ResultPath", SqlDbType.VarChar, 200);
                    sp[3].Value = Server.HtmlEncode(saveLocation);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                }
            }
            catch (Exception ee)
            {
                lblInfo.Text = "Problem in Upload Result<br>" + ee.Message;
            }
        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        string str_update = @"UPDATE [dbo].[tbl_ResultClassMaster] SET [DateTimeStamp]=GETDATE() WHERE [ResultClassID] = @ResultClassID";

        sp = new SqlParameter[1];

        sp[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
        sp[0].Value = Convert.ToInt32(lbl_title_id.Text);

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

        GetResultSummary(Convert.ToInt32(ddl_topic.SelectedValue));
    }

    protected void GetResultSummary(int ResultClassID)
    {
        try
        {
            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
            sp[0].Value = ResultClassID;

            DataTable dt_result = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT dbo.tbl_ResultClassMaster.ResultClassID, dbo.tbl_ResultClassMaster.ResultClassName, [ResultRollNumber] ,[ResultYear] ,[ResultPath] FROM [dbo].[tbl_ResultDetails] inner join dbo.tbl_ResultClassMaster on dbo.tbl_ResultDetails.ResultClassID=dbo.tbl_ResultClassMaster.ResultClassID where dbo.[tbl_ResultClassMaster].[ResultClassID] =  @ResultClassID order by ResultRollNumber", sp);

            gv_result.DataSource = dt_result;
            gv_result.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Result Not Available<br/>Please Visit After Some Time";
        }
    }


    protected void ddl_topic_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Topic"] = ddl_topic.SelectedValue;
        GetResultSummary(Convert.ToInt32(ddl_topic.SelectedValue));
    }
    protected void ddl_year_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Year"] = ddl_year.Text;
    }

    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;



            SqlParameter[] sp2 = new SqlParameter[2];
            sp2[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(gv_result.DataKeys[row.RowIndex].Values["ResultClassID"].ToString());

            sp2[1] = new SqlParameter("@ResultRollNumber", SqlDbType.Int);
            sp2[1].Value = Convert.ToInt32(row.Cells[2].Text);

            string str_pdfdelete = "delete from dbo.tbl_ResultDetails where ResultClassID=@ResultClassID and ResultRollNumber=@ResultRollNumber";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_pdfdelete, sp2);

            if (gv_result.DataKeys[row.RowIndex].Values["ResultPath"].ToString() != "")
            {
                string path = Server.MapPath(gv_result.DataKeys[row.RowIndex].Values["ResultPath"].ToString());
                FileInfo file = new FileInfo(path);
                if (file.Exists)//check file exsit or not
                {
                    file.Delete();
                }
            }

            GetResultSummary(Convert.ToInt32(ddl_topic.SelectedValue));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Delete Topic Details<br>" + ee.Message;
        }
    }

    protected void img_back_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }
}
