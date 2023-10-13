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
using System.Web.UI.WebControls;


using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;



public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    

    //SqlConnection conn2 = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
    string saveLocation;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            try
            {
                if (Session["iamuser"]==null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    ClearMyPage();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    protected void GetDepartment()
    {
        try
        {
            DataTable dt_department = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.StoredProcedure, "GETDEPARTMENT");

            gv_department.DataSource = dt_department;
            gv_department.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while getting departments<br>" + ee.Message;
        }
    }


    protected void GetDetails()
    {
        try
        {
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.StoredProcedure, "GET_EVENTDETAILS");

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {

        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            int allok=0;
            if (Label1.Text == "0")
            {
               

                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
                if (picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = "events/" + lbl_Id.Text.ToString() + picext;
                    FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                    Label1.Text = saveLocation.ToString();
                }
                else
                {
                    allok = 1;
                }


            } 
            else
            {
                saveLocation = Label1.Text;
            }

            #region Process Save or Update
            DataTable dtExists = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_past_event where event_id=" + Convert.ToInt32(lbl_Id.Text) + " ");

            if (dtExists.Rows.Count > 0)
            {

                string str_update = @"UPDATE [dbo].[tbl_past_event] set [department_show]=@department_show,[event_name] = @event_name ,[event_date] = @event_date ,
                [event_venue]=@event_venue,[event_pic] = @event_pic,[event_description]=@event_description,event_page=@event_page WHERE [event_id] = @event_id";

                sp = new SqlParameter[8];

                sp[0] = new SqlParameter("@department_show", SqlDbType.VarChar, 3);
                sp[0].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                sp[1] = new SqlParameter("@event_name", SqlDbType.NVarChar, 150);
                sp[1].Value = Server.HtmlEncode(txt_Title.Text.ToString());

                sp[2] = new SqlParameter("@event_date", SqlDbType.DateTime);
                sp[2].Value = DateTime.ParseExact(txt_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                sp[3] = new SqlParameter("@event_venue", SqlDbType.NVarChar, 150);
                sp[3].Value = Server.HtmlEncode("-");

                sp[4] = new SqlParameter("@event_pic", SqlDbType.NVarChar, 200);
                sp[4].Value = Server.HtmlEncode(saveLocation);

                sp[5] = new SqlParameter("@event_description", SqlDbType.NVarChar, -1);
                sp[5].Value = Server.HtmlEncode(txt_description.Content);

                sp[6] = new SqlParameter("@event_page", SqlDbType.NVarChar, 150);
                sp[6].Value = Server.HtmlEncode(ddl_session.Text.ToString());

                sp[7] = new SqlParameter("@event_id", SqlDbType.Int);
                sp[7].Value = Convert.ToInt32(lbl_Id.Text);


                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from TBL_PAST_EVENT_DEPARTMENT where EVENT_ID=" + lbl_Id.Text + "");

                foreach (GridViewRow row in gv_department.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chk_department") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string departmentid = gv_department.DataKeys[row.RowIndex].Values["PAGE_ID"].ToString();

                            string str_insert_department = @"INSERT INTO [dbo].[TBL_PAST_EVENT_DEPARTMENT] ([EVENT_ID] ,[DEPARTMENT_ID]) VALUES (@EVENT_ID ,@DEPARTMENT_ID)";

                            SqlParameter[] sp1 = new SqlParameter[2];

                            sp1[0] = new SqlParameter("@EVENT_ID", SqlDbType.Int);
                            sp1[0].Value = Convert.ToInt32(lbl_Id.Text);

                            sp1[1] = new SqlParameter("@DEPARTMENT_ID", SqlDbType.Int);
                            sp1[1].Value = Convert.ToInt32(departmentid);

                            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert_department, sp1);
                        }
                    }
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Saved Successfully')", true);

                ClearMyPage();
                
            }
            else
            {

                int event_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(event_id),0) FROM tbl_past_event");

                string str_insert = @"INSERT INTO [dbo].[tbl_past_event]([event_id],[department_show],[event_page],[event_name],[event_date],[event_venue],[event_pic],[event_description],[event_order])
                        VALUES (@event_id,@department_show,@event_page,@event_name,@event_date,@event_venue,@event_pic,@event_description,@event_order)";

                sp = new SqlParameter[9];

                sp[0] = new SqlParameter("@event_id", SqlDbType.Int);
                sp[0].Value = Convert.ToInt32(event_id);

                sp[1] = new SqlParameter("@department_show", SqlDbType.VarChar, 3);
                sp[1].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                sp[2] = new SqlParameter("@event_page", SqlDbType.NVarChar, 150);
                sp[2].Value = Server.HtmlEncode(ddl_session.Text.ToString());
                
                sp[3] = new SqlParameter("@event_name", SqlDbType.NVarChar, 150);
                sp[3].Value = Server.HtmlEncode(txt_Title.Text.ToString());

                sp[4] = new SqlParameter("@event_date", SqlDbType.DateTime);
                sp[4].Value = DateTime.ParseExact(txt_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                sp[5] = new SqlParameter("@event_venue", SqlDbType.NVarChar, 150);
                sp[5].Value = Server.HtmlEncode("-");

                sp[6] = new SqlParameter("@event_pic", SqlDbType.NVarChar, 150);
                sp[6].Value = Server.HtmlEncode(saveLocation);

                sp[7] = new SqlParameter("@event_description", SqlDbType.NVarChar, -1);
                sp[7].Value = Server.HtmlEncode(txt_description.Content);

                sp[8] = new SqlParameter("@event_order", SqlDbType.NVarChar, 200);
                sp[8].Value = 1;            
                
                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                foreach (GridViewRow row in gv_department.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chk_department") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string departmentid = gv_department.DataKeys[row.RowIndex].Values["PAGE_ID"].ToString();

                            string str_insert_department = @"INSERT INTO [dbo].[TBL_PAST_EVENT_DEPARTMENT] ([EVENT_ID] ,[DEPARTMENT_ID]) VALUES (@EVENT_ID ,@DEPARTMENT_ID)";

                            SqlParameter[] sp1 = new SqlParameter[2];

                            sp1[0] = new SqlParameter("@EVENT_ID", SqlDbType.Int);
                            sp1[0].Value = Convert.ToInt32(event_id);

                            sp1[1] = new SqlParameter("@DEPARTMENT_ID", SqlDbType.Int);
                            sp1[1].Value = Convert.ToInt32(departmentid);

                            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert_department, sp1);
                        }
                    }
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Update Successfully')", true);
                ClearMyPage();
                            
            }
            
            #endregion
        }
    }

    protected void ClearMyPage()
    {
        txt_Title.Text = "";
        txt_date.Text = DateTime.Now.ToString("dd-MM-yyyy");
        txt_description.Content = "";
        generateId();
        GetDetails();
        //lbl_Id.Text = "";
        GetDepartment();
    }

    protected void generateId()
    {
        try
        {
            string str = "select IIf(max(event_id) Is Null,0,max(event_id))+1 from tbl_past_event";
             object obj =SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str);
            //lbl_Id.Text = (sql_op.generate_id_sql(str)).ToString();
            lbl_Id.Text = "" + obj;
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in generateId "+ee.Message;
        }
    }

    protected int validateThis()
    {
        if (txt_Title.Text == "")
        {
            lblInfo.Text = "Error : Event Name Required";
            return (0);
        }
        else if (txt_date.Text == "")
        {
            lblInfo.Text = "Error : Date Required";
            return (0);
        }
        
        else if (!FileUpload1.HasFile && Label1.Text == "0")
        {
            lblInfo.Text = "Error : File Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }

    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_pastevents.aspx");
    }
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            FileUpload1.Visible = true;
            chk_new.Visible = false;

            Label1.Text = "0";
        }
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string url = "photo_pastevents.aspx?p_id=" + lbl_Id.Text;
        string s = "window.open('" + url + "', 'popup_window', 'width=800,height=600, resizable=yes, location=center,scrollbars=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_Id.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["event_id"].ToString();
            Label1.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["event_pic"].ToString();

            int eventid = Convert.ToInt32(lbl_Id.Text);

            txt_Title.Text = gvrow.Cells[2].Text.ToString();
            txt_date.Text = gvrow.Cells[3].Text.ToString();
            ddl_session.SelectedValue = gvrow.Cells[4].Text.ToString();
            ddl_show.SelectedValue = gvrow.Cells[5].Text.ToString();

            DataTable dtExists = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select event_description from tbl_past_event where event_id=" + lbl_Id.Text + "");
            txt_description.Content = Server.HtmlDecode(dtExists.Rows[0][0].ToString());

            FileUpload1.Visible = false;
            chk_new.Visible = true;

            DataTable dt_news_department = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [EVENT_ID] ,[DEPARTMENT_ID] FROM [dbo].[TBL_PAST_EVENT_DEPARTMENT] WHERE [EVENT_ID]=" + lbl_Id.Text + "");

            foreach (GridViewRow row in gv_department.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_department") as CheckBox);

                    for (int i = 0; i < dt_news_department.Rows.Count; i++)
                    {
                        string departmentid = gv_department.DataKeys[row.RowIndex].Values["PAGE_ID"].ToString();

                        if (departmentid == dt_news_department.Rows[i]["DEPARTMENT_ID"].ToString())
                        {
                            chkRow.Checked = true;
                        }
                    }
                }
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Edit " + ee.Message + "')", true);
        }
    }
    protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            string str_eventid = news_Grid.DataKeys[gvrow.RowIndex].Values["event_id"].ToString();

            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@event_id", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(str_eventid);

            string str_photosdelete1 = "select filepath from tbl_past_photos where event_id=@event_id ";
            DataTable dt_photos1 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete1, sp);

            for (int i = 0; i < dt_photos1.Rows.Count; i++)
            {
                if (dt_photos1.Rows[i]["filepath"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos1.Rows[i]["filepath"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }


            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@event_id", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(str_eventid);

            string str_del = "delete from tbl_past_photos where event_id=@event_id";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp1);

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@event_id", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(str_eventid);

            string str_photosdelete = "select event_pic from tbl_past_event where event_id=@event_id";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete, sp2);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["event_pic"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["event_pic"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }



            SqlParameter[] sp3 = new SqlParameter[1];
            sp3 = new SqlParameter[1];
            sp3[0] = new SqlParameter("@event_id", SqlDbType.Int);
            sp3[0].Value = Convert.ToInt32(str_eventid);


            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "DELETE FROM tbl_past_event WHERE event_id=@event_id", sp3);


            SqlParameter[] sp_department = new SqlParameter[1];

            sp_department[0] = new SqlParameter("@EVENT_ID", SqlDbType.Int);
            sp_department[0].Value = Convert.ToInt32(str_eventid);

            string str_delete_event_department = "DELETE FROM TBL_PAST_EVENT_DEPARTMENT WHERE EVENT_ID=@EVENT_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_event_department, sp_department);


            Response.Redirect("post_pastevents.aspx");
        }
        catch (Exception ee)
        {
            lblInfo.Text = ee.Message;
        }
    }
}
