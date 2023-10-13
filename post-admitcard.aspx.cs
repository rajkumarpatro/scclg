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



public partial class postadmitcard : System.Web.UI.Page
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

    protected void check_rolllist()
    {
        if (ddl_rolllist.SelectedValue == "Yes")
        {
            file_rolllist.Visible = true;
            chk_newlist.Visible = false;
        }
        else
        {
            file_rolllist.Visible = false;
            chk_newlist.Visible = false;
            chk_newlist.Checked = false;
        }
    }

    protected void chk_newlist_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            file_rolllist.Visible = true;
            Label1.Text = "0";
        }
    }
        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Result.aspx");
    }

    protected void img_back_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }

    protected void GetTopics()
    {
        try
        {
            DataTable dt_topics = new DataTable();
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select AcardClassID,AcardClassName from tbl_AdmitCardClass order by DateTimeStamp desc");

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "AcardClassName";
            ddl_topic.DataValueField = "AcardClassID";
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
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select AcardClassID,AcardClassName,AcardClassStatus,AcardRollList,AcardRollListPath from tbl_AdmitCardClass order by AcardClassID");

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
            ddl_rolllist.Text = row.Cells[3].Text;
            Label1.Text = row.Cells[4].Text;
            chk_newlist.Visible = true;
            file_rolllist.Visible = false;
            btn_savetitle.Text = "Update";
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
            sp2[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_pdfdelete = "select AcardPath from dbo.tbl_AdmitCardDetails where AcardClassID=@AcardClassID";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_pdfdelete,sp2);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["AcardPath"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["AcardPath"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_delete = "delete from dbo.tbl_AdmitCardDetails where AcardClassID=@AcardClassID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);

            SqlParameter[] sp1=new SqlParameter[1];
            sp1[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(row.Cells[0].Text);

            string str_delete1 = "delete from dbo.tbl_AdmitCardClass where AcardClassID=@AcardClassID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete1, sp1);

            GetTopics();
            //span_topic.Visible = false;
            //chk_new.Checked = false;
            //txt_title.Text = "";
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
            if (ddl_rolllist.Text == "Yes")
            {
                if (Label1.Text == "0")
                {

                    string picname = System.IO.Path.GetFileName(file_rolllist.PostedFile.FileName);
                    string picext = System.IO.Path.GetExtension(file_rolllist.PostedFile.FileName);

                    saveLocation = "Admit/RollList" + lbl_title_id.Text.ToString() + picext;
                    file_rolllist.PostedFile.SaveAs(MapPath(saveLocation));
                    Label1.Text = saveLocation.ToString();
                }
                else
                {
                    saveLocation = Label1.Text;
                }
            }
            else
            {
                saveLocation = "#";
            }

            if (lbl_title_id.Text=="")
            {
                int title_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(AcardClassID),0) FROM [dbo].tbl_AdmitCardClass");

                string str_insert = @"INSERT INTO [dbo].[tbl_AdmitCardClass] ([AcardClassID] ,[AcardClassName] ,[AcardClassStatus],[AcardRollList],[AcardRollListPath],[DateTimeStamp])
                                    VALUES (@AcardClassID ,@AcardClassName ,@AcardClassStatus,@AcardRollList,@AcardRollListPath,GETDATE())";

                sp = new SqlParameter[5];

                sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
                sp[0].Value = title_id;

                sp[1] = new SqlParameter("@AcardClassName", SqlDbType.NVarChar,60);
                sp[1].Value = Server.HtmlEncode(txt_title.Text);

                sp[2] = new SqlParameter("@AcardClassStatus", SqlDbType.VarChar,3);
                sp[2].Value = Server.HtmlEncode(ddl_show.Text);

                sp[3] = new SqlParameter("@AcardRollList", SqlDbType.VarChar, 3);
                sp[3].Value = Server.HtmlEncode(ddl_rolllist.Text);

                sp[4] = new SqlParameter("@AcardRollListPath", SqlDbType.NVarChar, 200);
                sp[4].Value = Server.HtmlEncode(ddl_show.Text);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
            }
            else
            {
                string str_update = @"UPDATE [dbo].[tbl_AdmitCardClass] SET [AcardClassName] = @AcardClassName, 
                                    [AcardClassStatus] = @AcardClassStatus, [DateTimeStamp]=GETDATE() WHERE [AcardClassID] = @AcardClassID";

                sp = new SqlParameter[3];

                sp[0] = new SqlParameter("@AcardClassName", SqlDbType.NVarChar, 60);
                sp[0].Value = Server.HtmlEncode(txt_title.Text);

                sp[1] = new SqlParameter("@AcardClassStatus", SqlDbType.VarChar, 3);
                sp[1].Value = Server.HtmlEncode(ddl_show.Text);

                sp[2] = new SqlParameter("@AcardClassID", SqlDbType.Int);
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
        
    }

    protected int ValidateMyForm()
    {
        if (Session["AcardTopic"].ToString() == "0")
        {
            lblInfo.Text = "Please Select Topic";
            return (0);
        }
        else if (Session["AcardYear"].ToString() == "" || Session["AcardYear"].ToString().Length != 4)
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

                saveLocation = Server.MapPath("~/Admit/" + Session["AcardTopic"].ToString() + "_" + Server.HtmlEncode(Session["AcardYear"].ToString()) + "_" + picname + picext);
                AjaxFileUpload1.SaveAs(saveLocation);

                saveLocation = "Admit/" + Session["AcardTopic"].ToString() + "_" + Server.HtmlEncode(Session["AcardYear"].ToString()) + "_" + picname + picext;

                if (sql_op.check_exist_sql("Select dbo.tbl_AdmitCardDetails.AcardRollNumber from dbo.tbl_AdmitCardDetails where dbo.tbl_AdmitCardDetails.AcardClassID=" + Convert.ToInt32(Session["AcardTopic"].ToString()) + " and dbo.tbl_AdmitCardDetails.AcardYear=" + Convert.ToInt32(Server.HtmlEncode(Session["AcardYear"].ToString())) + " and dbo.tbl_AdmitCardDetails.AcardRollNumber='" + Server.HtmlEncode(picname) + "'"))
                {
                    //Update
                    string str_update = @"UPDATE [dbo].[tbl_AdmitCardDetails] SET [AcardPath] = @AcardPath 
                    WHERE [AcardClassID] = @AcardClassID and [AcardRollNumber] = @AcardRollNumber and [AcardYear] = @AcardYear";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@AcardPath", SqlDbType.VarChar, 200);
                    sp[0].Value = Server.HtmlEncode(saveLocation);

                    sp[1] = new SqlParameter("@AcardClassID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(Server.HtmlEncode(Session["AcardTopic"].ToString()));

                    sp[2] = new SqlParameter("@AcardRollNumber", SqlDbType.VarChar, 20);
                    sp[2].Value = Server.HtmlEncode(picname);

                    sp[3] = new SqlParameter("@AcardYear", SqlDbType.Int);
                    sp[3].Value = Convert.ToInt32(Server.HtmlEncode(Session["AcardYear"].ToString()));

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                }
                else
                {
                    //Insert
                    string str_insert = @"INSERT INTO [dbo].[tbl_AdmitCardDetails] ([AcardClassID] ,[AcardRollNumber] ,[AcardYear] ,[AcardPath],[AcardShow])
                    VALUES (@AcardClassID ,@AcardRollNumber ,@AcardYear ,@AcardPath,'Yes')";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
                    sp[0].Value = Convert.ToInt32(Server.HtmlEncode(Session["AcardTopic"].ToString()));

                    sp[1] = new SqlParameter("@AcardRollNumber", SqlDbType.VarChar, 20);
                    sp[1].Value = Server.HtmlEncode(picname);

                    sp[2] = new SqlParameter("@AcardYear", SqlDbType.Int);
                    sp[2].Value = Convert.ToInt32(Server.HtmlEncode(Session["AcardYear"].ToString()));

                    sp[3] = new SqlParameter("@AcardPath", SqlDbType.VarChar, 200);
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
        string str_update = @"UPDATE [dbo].[tbl_AdmitCardClass] SET [DateTimeStamp]=GETDATE() WHERE [AcardClassID] = @AcardClassID";

        sp = new SqlParameter[1];

        sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
        sp[0].Value = Convert.ToInt32(ddl_topic.SelectedValue);

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

        GetResultSummary(Convert.ToInt32(ddl_topic.SelectedValue));
    }

    protected void GetResultSummary(int AcardClassID)
    {
        try
        {
            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp[0].Value = AcardClassID;

            DataTable dt_result = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT dbo.tbl_AdmitCardClass.AcardClassID, dbo.tbl_AdmitCardClass.AcardClassName, [AcardRollNumber] ,[AcardYear] ,[AcardPath],AcardShow FROM [dbo].[tbl_AdmitCardDetails] inner join dbo.tbl_AdmitCardClass on dbo.tbl_AdmitCardDetails.AcardClassID=dbo.tbl_AdmitCardClass.AcardClassID where dbo.[tbl_AdmitCardClass].[AcardClassID] =  @AcardClassID order by AcardRollNumber", sp);

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
        Session["AcardTopic"] = ddl_topic.SelectedValue;
        GetResultSummary(Convert.ToInt32(ddl_topic.SelectedValue));
    }
    protected void ddl_year_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["AcardYear"] = ddl_year.Text;
    }

    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow row = (GridViewRow)btndelete.NamingContainer;



            SqlParameter[] sp2 = new SqlParameter[2];
            sp2[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(gv_result.DataKeys[row.RowIndex].Values["AcardClassID"].ToString());

            sp2[1] = new SqlParameter("@AcardRollNumber", SqlDbType.Int);
            sp2[1].Value = Convert.ToInt32(row.Cells[2].Text);

            string str_pdfdelete = "delete from dbo.tbl_AdmitCardDetails where AcardClassID=@AcardClassID and AcardRollNumber=@AcardRollNumber";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_pdfdelete, sp2);

            if (gv_result.DataKeys[row.RowIndex].Values["AcardPath"].ToString() != "")
            {
                string path = Server.MapPath(gv_result.DataKeys[row.RowIndex].Values["AcardPath"].ToString());
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
    protected void ddl_rolllist_SelectedIndexChanged(object sender, EventArgs e)
    {
        check_rolllist();
    }

    protected void lnk_show_Click(object sender, EventArgs e)
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

            string str_update = @"UPDATE tbl_AdmitCardClass SET AcardClassStatus='" + str_enabledisable + "' WHERE AcardClassID=@AcardClassID";
            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(gv_topic.DataKeys[gvrow.RowIndex].Values["AcardClassID"].ToString()); ;

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Topic details updated successfully')", true);

            GetTopics();
        }
        catch (Exception ee)
        {

        }
    }

    protected void btn_savetitle_Click(object sender, EventArgs e)
    {
        int title_id=0;
        try
        {
            
            if (lbl_title_id.Text == "")
            {
                title_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(AcardClassID),0) FROM [dbo].tbl_AdmitCardClass");
                lbl_title_id.Text = title_id.ToString();
            }


            if (ddl_rolllist.Text == "Yes")
            {
                if (Label1.Text == "0")
                {

                    string picname = System.IO.Path.GetFileName(file_rolllist.PostedFile.FileName);
                    string picext = System.IO.Path.GetExtension(file_rolllist.PostedFile.FileName);

                    saveLocation = "Admit/RollList" + lbl_title_id.Text.ToString() + picext;
                    file_rolllist.PostedFile.SaveAs(MapPath(saveLocation));
                    Label1.Text = saveLocation.ToString();
                }
                else
                {
                    saveLocation = Label1.Text;
                }
            }
            else
            {
                saveLocation = "#";
            }

            if (btn_savetitle.Text=="Save")
            {
                

                string str_insert = @"INSERT INTO [dbo].[tbl_AdmitCardClass] ([AcardClassID] ,[AcardClassName] ,[AcardClassStatus],[AcardRollList],[AcardRollListPath],[DateTimeStamp])
                                    VALUES (@AcardClassID ,@AcardClassName ,@AcardClassStatus,@AcardRollList,@AcardRollListPath,GETDATE())";

                sp = new SqlParameter[5];

                sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
                sp[0].Value = title_id;

                sp[1] = new SqlParameter("@AcardClassName", SqlDbType.NVarChar,60);
                sp[1].Value = Server.HtmlEncode(txt_title.Text);

                sp[2] = new SqlParameter("@AcardClassStatus", SqlDbType.VarChar,3);
                sp[2].Value = Server.HtmlEncode(ddl_show.Text);

                sp[3] = new SqlParameter("@AcardRollList", SqlDbType.VarChar, 3);
                sp[3].Value = Server.HtmlEncode(ddl_rolllist.Text);

                sp[4] = new SqlParameter("@AcardRollListPath", SqlDbType.NVarChar, 200);
                sp[4].Value = saveLocation;

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
            }
            else
            {
                string str_update = @"UPDATE [dbo].[tbl_AdmitCardClass] SET [AcardClassName] = @AcardClassName, 
                                    [AcardClassStatus] = @AcardClassStatus, AcardRollList=@AcardRollList,AcardRollListPath=@AcardRollListPath, [DateTimeStamp]=GETDATE() WHERE [AcardClassID] = @AcardClassID";

                sp = new SqlParameter[5];

                sp[0] = new SqlParameter("@AcardClassName", SqlDbType.NVarChar, 60);
                sp[0].Value = Server.HtmlEncode(txt_title.Text);

                sp[1] = new SqlParameter("@AcardClassStatus", SqlDbType.VarChar, 3);
                sp[1].Value = Server.HtmlEncode(ddl_show.Text);

                sp[2] = new SqlParameter("@AcardRollList", SqlDbType.VarChar, 3);
                sp[2].Value = Server.HtmlEncode(ddl_rolllist.Text);

                sp[3] = new SqlParameter("@AcardRollListPath", SqlDbType.NVarChar, 200);
                sp[3].Value = saveLocation;

                sp[4] = new SqlParameter("@AcardClassID", SqlDbType.Int);
                sp[4].Value = Convert.ToInt32(lbl_title_id.Text);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
            }

            GetTopics();
            txt_title.Text = "";
            lbl_title_id.Text = "";
            Label1.Text = "0";
            btn_savetitle.Text = "Save";
            chk_newlist.Checked = false;
            chk_newlist.Visible = false;
            file_rolllist.Visible = true;
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Save Topic Details<br>" + ee.Message;
        }
    
    }
    protected void btn_oktitle_Click(object sender, EventArgs e)
    {
        chk_new.Checked = false;
        AjaxFileUpload1.Visible = true;
        CheckTopicStatus();
    }

    protected void lnk_admitshow_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkshow = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnkshow.NamingContainer;
            string str_enabledisable = "";
            if (lnkshow.Text == "Yes")
            {
                str_enabledisable = "No";
            }
            else
            {
                str_enabledisable = "Yes";
            }

            string str_update = @"UPDATE tbl_AdmitCardDetails SET AcardShow='" + str_enabledisable + "' WHERE AcardClassID=@AcardClassID and AcardRollNumber=@AcardRollNumber";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(gv_result.DataKeys[gvrow.RowIndex].Values["AcardClassID"].ToString());

            sp[1] = new SqlParameter("@AcardRollNumber", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(gv_result.DataKeys[gvrow.RowIndex].Values["AcardRollNumber"].ToString()); ;

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Admit Card Status Updated Successfully')", true);

            GetResultSummary(Convert.ToInt32(ddl_topic.SelectedValue));
        }
        catch (Exception ee)
        {

        }
    }
}
