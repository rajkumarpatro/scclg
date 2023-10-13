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
using System.Data.SqlClient;
using System.Data.SqlClient;
using System.IO;

public partial class science_Post_Latest_Update : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    sql_operations op = new sql_operations();
   
    //OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    string saveLocation, myUrl, linkType, displayDate;
    int Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            if (Session["iamuser"] == null)
            {
                Response.Redirect("science_login.aspx");
            }
            else
            {
                ClearMy();
            }
        }
    }
    protected void ClearMy()
    {
        
        txt_News_Title.Text = "";
        txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        rbNot.Checked = true;

        rbURL.Checked = false;
        txtURL.Visible = false;
        txtURL.Text = "";

        rbFile.Checked = false;
        FileUpload1.Visible = false;
        lbl_path.Text = "0";
        chk_new.Checked = false;
        chk_new.Visible = false;

        GetDetails();
        generateId();
        rbNot.Checked = true;
        check_rb();
    }
    
    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string newsid = news_Grid.DataKeys[gvrow.RowIndex].Values["NEWS_ID"].ToString();
            string path = news_Grid.DataKeys[gvrow.RowIndex].Values["NEWS_FILEPATH"].ToString();

            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@NEWS_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(newsid);

            string str_photosdelete1 = "select NEWS_FILEPATH from TBL_SCD_LATEST_UPDATE where NEWS_ID=@NEWS_ID ";
            DataTable dt_photos1 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete1, sp);

            for (int i = 0; i < dt_photos1.Rows.Count; i++)
            {
                if (dt_photos1.Rows[i]["NEWS_FILEPATH"].ToString() != "")
                {
                    string path1 = Server.MapPath(dt_photos1.Rows[i]["NEWS_FILEPATH"].ToString());
                    FileInfo file = new FileInfo(path1);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@NEWS_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(newsid);

            string str_delete_news = "DELETE FROM TBL_SCD_LATEST_UPDATE WHERE NEWS_ID=@NEWS_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_news, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Delete Data Successfully')", true);

            SqlParameter[] sp1 = new SqlParameter[1];

            sp1[0] = new SqlParameter("@NEWS_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(newsid);

            string str_delete_news_department = "DELETE FROM TBL_LATEST_NEWS_DEPARTMENT WHERE NEWS_ID=@NEWS_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_news_department, sp1);

            ClearMy();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete News<br>"+ee.Message;
        }
    }
    protected int CheckDepartmentCheckedOrNot()
    {
        int check = 0;
        foreach (GridViewRow row in gv_department.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chk_department") as CheckBox);
                if (chkRow.Checked)
                {
                    check = 1;
                }
            }
        }

        if (check == 0)
        {
            return (0);
        }
        else
        {
            return (1);
        }
    }
    protected void imgbtn_edit_Click(object sender, EventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string newsid = news_Grid.DataKeys[gvrow.RowIndex].Values["NEWS_ID"].ToString();
            string path = news_Grid.DataKeys[gvrow.RowIndex].Values["NEWS_FILEPATH"].ToString();
            string section = news_Grid.DataKeys[gvrow.RowIndex].Values["NEWS_SECTION"].ToString();

            lbl_Id.Text = newsid;

            txtDisplayDate.Text = gvrow.Cells[3].Text;
            txt_News_Title.Text =Server.HtmlDecode(gvrow.Cells[4].Text);

            if (gvrow.Cells[7].Text.ToString() == "URL")
            {

                FileUpload1.Visible = false;
                txtURL.Visible = true;

                rbURL.Checked = true;
                rbNot.Checked = false;
                rbFile.Checked = false;

                txtURL.Text = gvrow.Cells[5].Text.ToString();
            }
            else if (gvrow.Cells[7].Text.ToString() == "File")
            {

                FileUpload1.Visible = true;
                txtURL.Visible = false;

                rbNot.Checked = false;
                rbURL.Checked = false;
                rbFile.Checked = true;

                chk_new.Visible = true;
                FileUpload1.Visible = false;

                lbl_path.Text = path;
            }
            else if (gvrow.Cells[7].Text.ToString() == "#")
            {

                FileUpload1.Visible = false;
                txtURL.Visible = false;

                txtURL.Visible = false;
                rbNot.Checked = true;
                rbFile.Checked = false;
            }
            
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while edit news<br>" + ee.Message;
        }
    }

    protected void GetDetails()
    {
        try
        {

            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT NEWS_ID,CONVERT(VARCHAR(10),NEWS_DATE,105) AS NEWS_DATE, NEWS_TITLE,NEWS_SECTION, NEWS_FILEPATH, NEWS_LINK, NEWS_LINKTYPE
	FROM TBL_SCD_LATEST_UPDATE ORDER BY NEWS_ID desc ");

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while getting details in gridview<br>" + ee.Message;
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            int allok = 0;

            if (rbFile.Checked == true)
            {
                if (lbl_path.Text == "0")
                {
                    string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

                    if (picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                    {
                        saveLocation = "newsData" + "/" + ddl_show.SelectedValue +"_" +lbl_Id.Text.ToString() + picext;
                        FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                        lbl_path.Text = saveLocation.ToString();
                    }
                    else
                    {
                        allok = 1;
                    }

                }
                else
                {
                    saveLocation = lbl_path.Text;
                }
                    myUrl = "#";
                    linkType = "File";

               
            }
            else if (rbURL.Checked == true)
            {
                String check_str;

                myUrl = txtURL.Text;
                saveLocation = "#";
                linkType = "URL";
            }
            else if (rbNot.Checked == true)
            {
                myUrl = "#";
                saveLocation = "#";
                linkType = "#";
            }

            if (allok == 0)
            {
                #region Process Save or Update
                DataTable dtExists = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select [news_Title] ,[NEWS_SECTION],[news_Date] , [news_filepath] ,[news_Link] ,[news_LinkType] from TBL_SCD_LATEST_UPDATE where news_Id=" + Convert.ToInt32(lbl_Id.Text) + "");
                //DataSet dtLogin = new DataSet();
                //adptExists.Fill(dtLogin, "tblExists");
                if (dtExists.Rows.Count > 0)
                {
                    //conn.Open();
                    string str_update = @"UPDATE [TBL_SCD_LATEST_UPDATE] set [news_Title] = @news_Title ,[NEWS_SECTION]=@NEWS_SECTION,[news_Date] = @news_Date , [news_filepath] = @news_filepath ,[news_Link] = @news_Link ,[news_LinkType] = @news_LinkType WHERE [news_Id] = @news_Id";

                    sp = new SqlParameter[7];


                    sp[0] = new SqlParameter("@news_Title", SqlDbType.NVarChar, -1);
                    sp[0].Value = Server.HtmlEncode(txt_News_Title.Text);

                    sp[1] = new SqlParameter("@NEWS_SECTION", SqlDbType.NVarChar, 150);
                    sp[1].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                    sp[2] = new SqlParameter("@news_Date", SqlDbType.Date);
                    sp[2].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);                      

                    sp[3] = new SqlParameter("@news_filepath", SqlDbType.NVarChar, 200);
                    sp[3].Value = Server.HtmlEncode(saveLocation);

                    sp[4] = new SqlParameter("@news_Link", SqlDbType.NVarChar, 200);
                    sp[4].Value = Server.HtmlEncode(myUrl.ToString());

                    sp[5] = new SqlParameter("@news_LinkType", SqlDbType.NVarChar, 10);
                    sp[5].Value = Server.HtmlEncode(linkType);

                    sp[6] = new SqlParameter("@news_Id", SqlDbType.Int);
                    sp[6].Value = Convert.ToInt32(lbl_Id.Text);


                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from TBL_LATEST_NEWS_DEPARTMENT where NEWS_ID=" + lbl_Id.Text + "");

                    foreach (GridViewRow row in gv_department.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_department") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string departmentid = gv_department.DataKeys[row.RowIndex].Values["PAGE_ID"].ToString();

                                string str_insert_department = @"INSERT INTO [TBL_LATEST_NEWS_DEPARTMENT] ([NEWS_ID] ,[DEPARTMENT_ID]) VALUES (@NEWS_ID ,@DEPARTMENT_ID)";

                                SqlParameter[] sp1 = new SqlParameter[2];

                                sp1[0] = new SqlParameter("@NEWS_ID", SqlDbType.Int);
                                sp1[0].Value = Convert.ToInt32(lbl_Id.Text);

                                sp1[1] = new SqlParameter("@DEPARTMENT_ID", SqlDbType.Int);
                                sp1[1].Value = Convert.ToInt32(departmentid);

                                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert_department, sp1);
                            }
                        }
                    }

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('News Edited Successfully')", true);

                    ClearMy();

                }
                else
                {

                    try
                    {
                        
                        int NEWS_ID = op.generate_id_sql("SELECT ISNULL(MAX(NEWS_ID),0) FROM TBL_SCD_LATEST_UPDATE");
                        string str_insert = @"INSERT INTO [TBL_SCD_LATEST_UPDATE]([news_Id],[news_Title],[NEWS_SECTION],[news_Date],[news_filepath],[news_Link],[news_LinkType])
                        VALUES (@news_Id,@news_Title,@NEWS_SECTION,@news_Date,@news_filepath,@news_Link,@news_LinkType)";

                        sp = new SqlParameter[7];

                        sp[0] = new SqlParameter("@news_Id", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(NEWS_ID);

                        sp[1] = new SqlParameter("@news_Title", SqlDbType.NVarChar, -1);
                        sp[1].Value = Server.HtmlEncode(txt_News_Title.Text); 

                        sp[2] = new SqlParameter("@NEWS_SECTION", SqlDbType.NVarChar, 150);
                        sp[2].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                        sp[3] = new SqlParameter("@news_Date", SqlDbType.Date);
                        sp[3].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);                        

                        sp[4] = new SqlParameter("@news_filepath", SqlDbType.NVarChar, 200);
                        sp[4].Value = Server.HtmlEncode(saveLocation);

                        sp[5] = new SqlParameter("@news_Link", SqlDbType.NVarChar, 200);
                        sp[5].Value = Server.HtmlEncode(myUrl.ToString());

                        sp[6] = new SqlParameter("@news_LinkType", SqlDbType.NVarChar, 10);
                        sp[6].Value = Server.HtmlEncode(linkType);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                        foreach (GridViewRow row in gv_department.Rows)
                        {
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                CheckBox chkRow = (row.Cells[0].FindControl("chk_department") as CheckBox);
                                if (chkRow.Checked)
                                {
                                    string departmentid = gv_department.DataKeys[row.RowIndex].Values["PAGE_ID"].ToString();

                                    string str_insert_department = @"INSERT INTO [TBL_LATEST_NEWS_DEPARTMENT] ([NEWS_ID] ,[DEPARTMENT_ID]) VALUES (@NEWS_ID ,@DEPARTMENT_ID)";

                                    SqlParameter[] sp1 = new SqlParameter[2];

                                    sp1[0] = new SqlParameter("@NEWS_ID", SqlDbType.Int);
                                    sp1[0].Value = Convert.ToInt32(NEWS_ID);

                                    sp1[1] = new SqlParameter("@DEPARTMENT_ID", SqlDbType.Int);
                                    sp1[1].Value = Convert.ToInt32(departmentid);

                                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert_department, sp1);
                                }
                            }
                        }
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Latest update Insert Successfully')", true);

                        ClearMy();

                    }
                    catch (Exception ee)
                    {

                    }
                    //WebLog.SqlOperation().Update_log("A New Notice Inserted in Latest_update Gallery", DateTime.Now.ToString(), Session["AdminDetails"].ToString(), "Insert", "index.aspx");
                }
                #endregion
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Incorrect Input File Format')", true);
            }
        }
    }
   
    protected void generateId()
    {
        lbl_Id.Text = op.generate_id_sql("SELECT ISNULL(MAX(NEWS_ID),0) FROM TBL_SCD_LATEST_UPDATE").ToString();
        
    }

    protected int validateThis()
    {
        if (txt_News_Title.Text == "")
        {
            lblInfo.Text = "Error : News Title Required";
            return (0);
        }       
        else if (rbURL.Checked == false && rbFile.Checked == false && rbNot.Checked == false)
        {
            lblInfo.Text = "Error : Link Required (Note: If File And URL Not Required Then Please Select Not Applicable)";
            return (0);
        }
        else if (rbFile.Checked == true && !FileUpload1.HasFile && lbl_path.Text == "0")
        {
                lblInfo.Text = "Error : File Required";
                return (0);
        }
        else if (rbURL.Checked == true && txtURL.Text == "")
        {
            lblInfo.Text = "Error : URL Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }

   
    protected void rbFile_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    protected void rbLink_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    

    protected void check_rb()
    {
        if (rbFile.Checked == true)
        {
            FileUpload1.Visible = true;
            txtURL.Visible = false;

            rbNot.Checked = false;
            rbURL.Checked = false;
            rbFile.Checked = true;
        }
        else if(rbURL.Checked==true)
        {
            FileUpload1.Visible = false;
            txtURL.Visible = true;

            rbURL.Checked = true;
            rbNot.Checked = false;
            rbFile.Checked = false;

        }
        else if(rbNot.Checked==true)
        {
            FileUpload1.Visible = false;
            txtURL.Visible = false;

            txtURL.Visible = false;
            rbNot.Checked = true;
            rbFile.Checked = false;
        }
    }
    protected void rbNot_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            lbl_path.Text = "0";
        }
    }
    protected void btn_recent_Click(object sender, EventArgs e)
    {

    }

    protected void ddl_show_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetDetails();
    }
}
