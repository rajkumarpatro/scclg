using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class post_data : System.Web.UI.Page
{
    sql_operations op = new sql_operations();

    SqlParameter[] sp = null;
    string saveLocation, linkType, urltype, descriptionType;
    //protected Messages message = new Messages();

    static int eventid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["DpUser"] != null)
            {
                GetPageHead();
                txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                for (int i = 1; i <= 20; i++)
                {
                    ddl_file_order.Items.Add(i.ToString());
                }

                DataTable dt_user = Session["DpUser"] as DataTable;

                string usertype = dt_user.Rows[0]["U_Status"].ToString().Trim();

                if (usertype != "admin")
                {
                    ddl_pagehead.SelectedValue= dt_user.Rows[0]["PAGE_HEAD_ID"].ToString();
                    GetSubMenu();
                    ddl_submenu.SelectedValue = dt_user.Rows[0]["PAGE_ID"].ToString();
                    gv_topic.Visible = false;
                    GetTopics();
                    fill_grid();

                    ddl_submenu.Enabled = false;
                    
                    ddl_pagehead.Enabled = false;
                }
                else
                {
                    
                }

                
            }
            else
            {
                Response.Redirect("Department_Login.aspx");
            }
        }
    }
    protected void btn_setorder_Click(object sender, EventArgs e)
    {
        try
        {
            if (gv_filetable.Rows.Count > 0)
            {
                int j = 0;
                for (int i = 0; i < gv_filetable.Rows.Count; i++)
                {

                    string reorder = ((TextBox)gv_filetable.Rows[i].FindControl("txt_order")).Text;
                    string pageid = gv_filetable.DataKeys[i].Values["FILE_ID"].ToString();

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [TBL_COLLEGE_PAGE_FILES] SET [FILE_ORDER] = @FILE_ORDER WHERE [FILE_ID] = @FILE_ID";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@FILE_ORDER", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@FILE_ID", SqlDbType.Int);
                        sp[1].Value = Convert.ToInt32(pageid);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                        j++;
                    }
                }

                if (j != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + j.ToString() + " Records Updated')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('No Records Found to Re-Order')", true);
            }
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while set order<br>" + ee.Message;
        }
    }
    protected void GetPageHead()
    {
        try
        {
            DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [PAGE_HEAD_ID],[PAGE_HEAD_NAME] FROM [TBL_COLLEGE_PAGE_HEAD] ORDER BY PAGE_HEAD_NAME");
            ddl_pagehead.DataSource = dt_category;
            ddl_pagehead.DataTextField = "PAGE_HEAD_NAME";
            ddl_pagehead.DataValueField = "PAGE_HEAD_ID";
            ddl_pagehead.DataBind();
            ddl_pagehead.Items.Insert(0, new ListItem("Select", "0")); 
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error : "+ee.Message;
        }
    }

    protected void GetSubMenu()
    {
        try
        {
            DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT PAGE_ID, PAGE_NAME FROM TBL_COLLEGE_PAGE where PAGE_HEAD_ID="+ddl_pagehead.SelectedValue+" ORDER BY PAGE_ID");
            ddl_submenu.DataSource = dt_category;
            ddl_submenu.DataTextField = "PAGE_NAME";
            ddl_submenu.DataValueField = "PAGE_ID";
            ddl_submenu.DataBind();
            ddl_submenu.Items.Insert(0, new ListItem("Select", "0"));  
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error : "+ee.Message;
        }
    }
    protected void ClearMyPage()
    {
        try
        {
            lbl_Id.Text = "";
            txt_description.Content = "";
            txt_title.Text = "";
            txtURL.Text = "";
            fill_grid();
            txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            rbNot.Checked = true;
            rbFile.Checked = false;
            img_intro.Visible = false;
            chk_new.Visible = false;
            chk_new.Checked = false;
            FileUpload1.Visible = false;
            Label1.Text = "0";
            check_rb();
            
            //GetSubMenu();
            if (txt_topic.Visible == true && ddl_topic.Visible == false)
            {
                GetTopics();
                ddl_topic.SelectedValue = GetTopicId().ToString();
                txt_topic.Text = "";
                ddl_topic.Visible = true;
                txt_topic.Visible = false;
            }
            txt_description.Visible = true;
            //ddl_submenu.SelectedValue = "";           
            
            CheckLinkDescription();
            CheckFileTable();
            fill_grid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in ClearMyPage<br>" + ee.Message + "')", true);
        }
    }

    protected void ClearFileMyPage()
    {
        try
        {
            lbl_file_id.Text = "";
            txt_filedescription.Text = "";
            
            chk_multipal_file.Visible = false;
            
            File_FileUpload.Visible = false;
            lbl_file.Text = "0";

            
            CheckFileTable();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in ClearMyFile<br>" + ee.Message + "')", true);
        }
    }

    protected void generateId()
    {
        if (lbl_Id.Text=="")
        {
            lbl_Id.Text = op.generate_id_sql("select ISNULL(MAX(SUB_TOPIC_ID),0) from TBL_COLLEGE_PAGE_DETAIL").ToString();
        }
    }
    protected int validateThis()
    {
        if (ddl_submenu.SelectedValue == "")
        {
            lblInfo.Text = "Error : Select any page then proceed)";
            return (0);
        }
        else if (txt_title.Text == "")
        {
            lblInfo.Text = "Error : Please Enter Title)";
            return (0);
        }
        else if (txtDisplayDate.Text == "")
        {
            lblInfo.Text = "Error : Page Selected Required)";
            return (0);
        }
        
        else if (rbFile.Checked == true && !FileUpload1.HasFile && Label1.Text == "0")
        {
            lblInfo.Text = "Error : File Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }
    protected void btn_addfile_Click(object sender, EventArgs e)
    {
        int FILE_ID;
        if (lbl_file_id.Text == "")
        {
                    
            FILE_ID = op.generate_id_sql("SELECT ISNULL(MAX(FILE_ID),0) FROM TBL_COLLEGE_PAGE_FILES");
        }
        else
        {
            FILE_ID = Convert.ToInt32(lbl_file_id.Text);
        }

        int flag = validateThis();
        if (flag == 1)
        {
            int allok = 0;

            if (lbl_file.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(File_FileUpload.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(File_FileUpload.PostedFile.FileName).ToLower();

                if (picext == ".Zip" || picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = "Content/" + FILE_ID.ToString() + "_" + lbl_Id.Text.ToString() + picext;
                    lbl_file.Text = saveLocation;

                    File_FileUpload.PostedFile.SaveAs(MapPath(saveLocation));
                }
               
            }            
            else
            {
                saveLocation = lbl_file.Text;
                
            }

            if (allok == 0)
            {
                #region Process Save or Update


                if (lbl_file_id.Text != "")
                {
                    #region UpdatePrcess
                    string str_update = @"UPDATE [TBL_COLLEGE_PAGE_FILES] SET [SUB_TOPIC_ID] = @SUB_TOPIC_ID,[FILE_DESCRIPTION] = @FILE_DESCRIPTION,[FILE_PATH] = @FILE_PATH,[FILE_ORDER] = @FILE_ORDER WHERE TBL_COLLEGE_PAGE_FILES.FILE_ID=@FILE_ID";

                    sp = new SqlParameter[5];

                    sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[0].Value = Convert.ToInt32(lbl_Id.Text);

                    sp[1] = new SqlParameter("@FILE_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[1].Value = Server.HtmlDecode(txt_filedescription.Text);

                    sp[2] = new SqlParameter("@FILE_PATH", SqlDbType.VarChar, 200);
                    sp[2].Value = Server.HtmlEncode(saveLocation);

                    sp[3] = new SqlParameter("@FILE_ORDER", SqlDbType.Int);
                    sp[3].Value = Server.HtmlDecode(ddl_file_order.SelectedValue);

                    sp[4] = new SqlParameter("@FILE_ID", SqlDbType.Int);
                    sp[4].Value = Convert.ToInt32(lbl_file_id.Text); ;

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('File Updated Successfully')", true);

                    ClearFileMyPage();

                    #endregion
                }
                else
                {


                    string str_insert = @"INSERT INTO [TBL_COLLEGE_PAGE_FILES] ([FILE_ID],[SUB_TOPIC_ID],[FILE_DESCRIPTION],[FILE_PATH],[FILE_ORDER])
                                         VALUES (@FILE_ID,@SUB_TOPIC_ID,@FILE_DESCRIPTION,@FILE_PATH,@FILE_ORDER)";

                    sp = new SqlParameter[5];

                    sp[0] = new SqlParameter("@FILE_ID", SqlDbType.Int);
                    sp[0].Value = FILE_ID;

                    sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(lbl_Id.Text);

                    sp[2] = new SqlParameter("@FILE_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlDecode(txt_filedescription.Text);

                    sp[3] = new SqlParameter("@FILE_PATH", SqlDbType.VarChar,200);
                    sp[3].Value = Server.HtmlEncode(saveLocation);

                    sp[4] = new SqlParameter("@FILE_ORDER", SqlDbType.Int);
                    sp[4].Value = Server.HtmlDecode(ddl_file_order.SelectedValue);

                    

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('File Added Successfully')", true);

                    ClearFileMyPage();
                }

                #endregion
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Incorrect Input File')", true);
            }
        }
    }


    protected void btn_Save_Click(object sender, EventArgs e)
    {
        int SUB_TOPIC_ID;
        if (lbl_Id.Text == "")
        {
            
            SUB_TOPIC_ID = op.generate_id_sql("SELECT ISNULL(MAX(SUB_TOPIC_ID),0) FROM TBL_COLLEGE_PAGE_DETAIL");
        }
        else
        {
            SUB_TOPIC_ID = Convert.ToInt32(lbl_Id.Text);
        }

        int flag = validateThis();
        if (flag == 1)
        {
            int allok = 0;
            
            if (rbFile.Checked == true && Label1.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

                if (picext == ".Zip" || picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = "Content/" + SUB_TOPIC_ID.ToString() + picext;
                    Label1.Text = saveLocation;
                    FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                }
                else
                {
                    allok = 1;
                }

                linkType = "File";
            }
            else if (rbNot.Checked == true)
            {
                saveLocation = "#";
                linkType = "#";
            }
            else
            {
                saveLocation = Label1.Text;
                linkType = "File";
            }

            if (allok == 0)
            {
                #region Process Save or Update
                
                
                if (lbl_Id.Text!="")
                {
                    #region UpdatePrcess
                    string str_update = @"UPDATE [TBL_COLLEGE_PAGE_DETAIL] SET [SUB_TOPIC_NAME] = @SUB_TOPIC_NAME,[TOPIC_DATE] = @TOPIC_DATE,[TOPIC_DESCRIPTION] = @TOPIC_DESCRIPTION
                                              ,[TOPIC_FILEPATH] = @TOPIC_FILEPATH, [TOPIC_LINK_TYPE] = @TOPIC_LINK_TYPE,SHOW_TOPIC_NAME=@SHOW_TOPIC_NAME, DATETIMESTAMP=GETDATE(),IS_LINK=@IS_LINK,LINK_URL=@LINK_URL WHERE TBL_COLLEGE_PAGE_DETAIL.SUB_TOPIC_ID=@SUB_TOPIC_ID";                   

                    sp = new SqlParameter[9];

                    sp[0] = new SqlParameter("@SUB_TOPIC_NAME", SqlDbType.NVarChar, 200);
                    sp[0].Value = Server.HtmlDecode(txt_title.Text);

                    sp[1] = new SqlParameter("@TOPIC_DATE", SqlDbType.Date);
                    sp[1].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture); 

                    sp[2] = new SqlParameter("@TOPIC_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlDecode(txt_description.Content);

                    sp[3] = new SqlParameter("@TOPIC_FILEPATH", SqlDbType.VarChar, 200);
                    sp[3].Value = Server.HtmlEncode(saveLocation);

                    sp[4] = new SqlParameter("@TOPIC_LINK_TYPE", SqlDbType.VarChar, 10);
                    sp[4].Value = Server.HtmlEncode(linkType);

                    sp[5] = new SqlParameter("@SHOW_TOPIC_NAME", SqlDbType.VarChar,3);
                    sp[5].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                    sp[6] = new SqlParameter("@IS_LINK", SqlDbType.VarChar, 20);
                    sp[6].Value = Server.HtmlEncode(ddl_link_description.SelectedValue);

                    sp[7] = new SqlParameter("@LINK_URL", SqlDbType.VarChar,200);
                    sp[7].Value = (txtURL.Text==""?"#":txtURL.Text);

                    sp[8] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[8].Value = Convert.ToInt32(lbl_Id.Text);
                    
                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Sub Topic Updated Successfully')", true);

                    ClearMyPage();

                    #endregion
                }
                else
                {
                    int TOPIC_ID = 0;
                    if (ddl_topic.Visible == false)
                    {
                        string str_insert_topic = @"INSERT INTO [TBL_COLLEGE_PAGE_TOPIC] ([TOPIC_ID] ,[PAGE_ID] ,[TOPIC_NAME]) VALUES (@TOPIC_ID ,@PAGE_ID ,@TOPIC_NAME)";

                        TOPIC_ID = op.generate_id_sql("SELECT ISNULL(MAX(TOPIC_ID),0) FROM TBL_COLLEGE_PAGE_TOPIC");

                        SqlParameter[] sp1 = new SqlParameter[3];

                        sp1[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                        sp1[0].Value = TOPIC_ID;

                        sp1[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                        sp1[1].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

                        sp1[2] = new SqlParameter("@TOPIC_NAME", SqlDbType.VarChar, 200);
                        sp1[2].Value = Server.HtmlDecode(txt_topic.Text);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert_topic, sp1);
                    }
                    else
                    {
                        TOPIC_ID = Convert.ToInt32(ddl_topic.SelectedValue);
                    }

                    string str_insert = @"INSERT INTO [TBL_COLLEGE_PAGE_DETAIL] ([SUB_TOPIC_ID],[TOPIC_ID],[SUB_TOPIC_NAME],[TOPIC_DATE],[TOPIC_DESCRIPTION],[TOPIC_FILEPATH],[TOPIC_LINK_TYPE],DATETIMESTAMP,SHOW_TOPIC_NAME,IS_LINK,LINK_URL)
                                         VALUES (@SUB_TOPIC_ID,@TOPIC_ID,@SUB_TOPIC_NAME,@TOPIC_DATE,@TOPIC_DESCRIPTION,@TOPIC_FILEPATH,@TOPIC_LINK_TYPE,GETDATE(),@SHOW_TOPIC_NAME,@IS_LINK,@LINK_URL)";

                    sp = new SqlParameter[10];

                    sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[0].Value = SUB_TOPIC_ID;

                    sp[1] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                    sp[1].Value = TOPIC_ID;

                    sp[2] = new SqlParameter("@SUB_TOPIC_NAME", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlDecode(txt_title.Text);

                    sp[3] = new SqlParameter("@TOPIC_DATE", SqlDbType.Date);
                    sp[3].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);        

                    sp[4] = new SqlParameter("@TOPIC_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[4].Value = Server.HtmlDecode(txt_description.Content);

                    sp[5] = new SqlParameter("@TOPIC_FILEPATH", SqlDbType.VarChar, 200);
                    sp[5].Value = Server.HtmlEncode(saveLocation);

                    sp[6] = new SqlParameter("@TOPIC_LINK_TYPE", SqlDbType.VarChar, -1);
                    sp[6].Value = Server.HtmlEncode(linkType);

                    sp[7] = new SqlParameter("@SHOW_TOPIC_NAME", SqlDbType.VarChar, 3);
                    sp[7].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                    sp[8] = new SqlParameter("@IS_LINK", SqlDbType.VarChar, 20);
                    sp[8].Value = Server.HtmlEncode(ddl_link_description.SelectedValue);

                    sp[9] = new SqlParameter("@LINK_URL", SqlDbType.VarChar, 200);
                    sp[9].Value = (txtURL.Text == "" ? "#" : txtURL.Text);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Sub Topic Added Successfully')", true);

                    ClearMyPage();
                }
                
                #endregion
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Incorrect Input File')", true);
            }
        }
    }

    protected int GetTopicId()
    {
        int topicid = 0;

        SqlParameter[] sp1 = new SqlParameter[2];
        sp1[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
        sp1[0].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

        sp1[1] = new SqlParameter("@TOPIC_NAME", SqlDbType.VarChar, 200);
        sp1[1].Value = txt_topic.Text;

        topicid = Convert.ToInt32(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select TOPIC_ID from TBL_COLLEGE_PAGE_TOPIC where PAGE_ID=@PAGE_ID and TOPIC_NAME=@TOPIC_NAME", sp1));
        return (topicid);
    }
    protected void rb_description_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    
    protected void fill_grid()
    {
        try
        {
            int topicid = 0;
            if (txt_topic.Visible = true && ddl_topic.Visible == false)
            {
                topicid = GetTopicId();
            }
            else
            {
                topicid=Convert.ToInt32(ddl_topic.SelectedValue);
            }
            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp[0].Value = topicid;

            about_Grid.DataSource = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT TBL_COLLEGE_PAGE_DETAIL.SUB_TOPIC_ID, TBL_COLLEGE_PAGE_DETAIL.TOPIC_ID, TBL_COLLEGE_PAGE_DETAIL.SUB_TOPIC_NAME, 
	                     CONVERT(VARCHAR(10),TOPIC_DATE,105) AS TOPIC_DATE,
                         TBL_COLLEGE_PAGE_DETAIL.TOPIC_DESCRIPTION, TBL_COLLEGE_PAGE_DETAIL.TOPIC_FILEPATH,
                         TBL_COLLEGE_PAGE_DETAIL.TOPIC_LINK_TYPE, TBL_COLLEGE_PAGE_DETAIL.SHOW_TOPIC_NAME, TBL_COLLEGE_PAGE_TOPIC.PAGE_ID, 
                         TBL_COLLEGE_PAGE_TOPIC.TOPIC_NAME,TBL_COLLEGE_PAGE_DETAIL.IS_LINK,TBL_COLLEGE_PAGE_DETAIL.LINK_URL
                         FROM TBL_COLLEGE_PAGE_DETAIL INNER JOIN
                         TBL_COLLEGE_PAGE_TOPIC ON TBL_COLLEGE_PAGE_DETAIL.TOPIC_ID = TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID WHERE TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID=" + ddl_topic.SelectedValue + " ORDER BY TBL_COLLEGE_PAGE_DETAIL.TOPIC_DATE DESC ");
            about_Grid.DataBind();

            //lbl_Id.Text="";
            CheckFileTable();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Fill Grid<br>" + ee.Message + "')", true);
        }
    }

    

    protected void imgbtn_topicedit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_topic_id.Text = gv_topic.DataKeys[gvrow.RowIndex].Values["TOPIC_ID"].ToString();

            TextBox txt_edittopic = gvrow.FindControl("txt_edit_topic") as TextBox;

            string str_update_topic = @"UPDATE [TBL_COLLEGE_PAGE_TOPIC] SET TOPIC_NAME=@TOPIC_NAME WHERE TOPIC_ID=@TOPIC_ID AND PAGE_ID=@PAGE_ID";

            SqlParameter[] sp1 = new SqlParameter[3];

            sp1[0] = new SqlParameter("@TOPIC_NAME", SqlDbType.VarChar, 200);
            sp1[0].Value = Server.HtmlDecode(txt_edittopic.Text);

            sp1[1] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp1[1].Value = Convert.ToInt32(lbl_topic_id.Text);

            sp1[2] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp1[2].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update_topic, sp1);

            GetTopics();
            ddl_topic.Visible = true;
            txt_topic.Visible = false;
            gv_topic.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Topic Name Updated Successfully')", true);
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Edit " + ee.Message + "')", true);
        }
    }

    protected void imgbtn_topicdelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            string topicid = gv_topic.DataKeys[gvrow.RowIndex].Values["TOPIC_ID"].ToString();

            TextBox txt_edittopic = gvrow.FindControl("txt_edit_topic") as TextBox;

            ///////////    DELETING TOPIC ID    //////////
            sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(topicid);

            sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

            string deletetopic = "DELETE FROM [TBL_COLLEGE_PAGE_TOPIC] WHERE TOPIC_ID=@TOPIC_ID AND PAGE_ID=@PAGE_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, deletetopic, sp);

            ///////////    DELETING TOPIC PHOTOS    //////////
            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(topicid);

            string str_photosdelete1 = "select PHOTO_PATH from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID IN (SELECT SUB_TOPIC_ID FROM TBL_COLLEGE_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID)";
            DataTable dt_photos1 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete1, sp1);

            for (int i = 0; i < dt_photos1.Rows.Count; i++)
            {
                if (dt_photos1.Rows[i]["PHOTO_PATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos1.Rows[i]["PHOTO_PATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }
            ///////////    DELETING TOPIC DETAILS    //////////

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(topicid);

            string str_deletetopicfiles = "select TOPIC_FILEPATH from TBL_COLLEGE_PAGE_DETAIL where TOPIC_ID=@TOPIC_ID";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_deletetopicfiles, sp2);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["TOPIC_FILEPATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["TOPIC_FILEPATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }
            SqlParameter[] sp3 = new SqlParameter[1];
            sp3 = new SqlParameter[1];
            sp3[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp3[0].Value = Convert.ToInt32(topicid);
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "DELETE FROM TBL_COLLEGE_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID", sp3);
            GetTopics();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Topic Deleted Successfully')", true);
            
        }
        catch (Exception ee)
        {
            //message.showError(Messages.ERROR_LEVEL, ee.Message);
        }
    }

    protected void ddl_topic_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_topic.SelectedValue == "-1")
        {
            ddl_topic.Visible = false;
            txt_topic.Visible = true;
            gv_topic.Visible = false;
        }
        if (ddl_topic.SelectedValue == "-2")
        {
            ddl_topic.Visible = false;
            txt_topic.Visible = false;
            gv_topic.Visible = true;
        }
        else
        {
            fill_grid();
        }
    }

    protected void GetTopics()
    {
        try
        {
            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

            string str_query = @"SELECT [TOPIC_ID] ,[PAGE_ID] ,[TOPIC_NAME] FROM [TBL_COLLEGE_PAGE_TOPIC] WHERE PAGE_ID=@PAGE_ID";

            DataTable dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp);

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "TOPIC_NAME";
            ddl_topic.DataValueField = "TOPIC_ID";
            ddl_topic.DataBind();

            gv_topic.DataSource = dt_topics;
            gv_topic.DataBind();
            //ddl_topic.Visible = true;
            //txt_topic.Visible = false;

            ddl_topic.Items.Insert(0, new ListItem("Select", "0"));
            ddl_topic.Items.Insert(dt_topics.Rows.Count + 1, new ListItem("Add New Topic", "-1"));
            ddl_topic.Items.Insert(dt_topics.Rows.Count + 1, new ListItem("Edit Topic", "-2"));
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error on GetTopics " + ee.Message + "')", true);
        }
    }

    protected void ddl_link_description_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckLinkDescription();
    }

    protected void ddl_submenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        gv_topic.Visible = false;
        GetTopics();
        fill_grid();
    }

    protected void rbFile_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    protected void rbURL_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    
    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;
            lbl_Id.Text = about_Grid.DataKeys[gvrow.RowIndex].Values["SUB_TOPIC_ID"].ToString();

            eventid = Convert.ToInt32(lbl_Id.Text);

            txt_title.Text = gvrow.Cells[3].Text;
            ddl_show.SelectedValue = gvrow.Cells[4].Text;
            txtDisplayDate.Text = gvrow.Cells[5].Text;

            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT TOPIC_LINK_TYPE,IS_LINK,LINK_URL,TOPIC_FILEPATH,TOPIC_DESCRIPTION FROM TBL_COLLEGE_PAGE_DETAIL where SUB_TOPIC_ID=" + lbl_Id.Text + "");
            
            txt_description.Content = Server.HtmlDecode(dt_data.Rows[0]["TOPIC_DESCRIPTION"].ToString());

            FileUpload1.Visible = false;
            img_intro.Visible = true;
            chk_new.Visible = true;
            img_intro.ImageUrl = dt_data.Rows[0]["TOPIC_FILEPATH"].ToString();

            if (dt_data.Rows[0]["TOPIC_LINK_TYPE"].ToString() == "File")
            {
                
                FileUpload1.Visible = true;

                rbNot.Checked = false;
                rbFile.Checked = true;

                chk_new.Visible = true;
                FileUpload1.Visible = false;

                Label1.Text = dt_data.Rows[0]["TOPIC_FILEPATH"].ToString();
            }
            else if (dt_data.Rows[0]["TOPIC_LINK_TYPE"].ToString() == "#")
            {
                
                FileUpload1.Visible = false;

                rbNot.Checked = true;
                rbFile.Checked = false;

                img_intro.Visible = false;
                Label1.Text = "0";
                chk_new.Visible = false;
            }

            ddl_link_description.SelectedValue = dt_data.Rows[0]["IS_LINK"].ToString();
            txtURL.Text = dt_data.Rows[0]["LINK_URL"].ToString();
            CheckLinkDescription();

            CheckFileTable();
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

            string str_eventid = about_Grid.DataKeys[gvrow.RowIndex].Values["SUB_TOPIC_ID"].ToString();

            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(str_eventid);

            string str_photosdelete1 = "select PHOTO_PATH from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID ";
            DataTable dt_photos1 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete1, sp);

            for (int i = 0; i < dt_photos1.Rows.Count; i++)
            {
                if (dt_photos1.Rows[i]["PHOTO_PATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos1.Rows[i]["PHOTO_PATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }


            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(str_eventid);

            string str_del = "delete from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp1);

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(str_eventid);

            string str_photosdelete = "select TOPIC_FILEPATH from TBL_COLLEGE_PAGE_DETAIL where SUB_TOPIC_ID=@SUB_TOPIC_ID";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete,sp2);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["TOPIC_FILEPATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["TOPIC_FILEPATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }          
            
            SqlParameter[] sp3 = new SqlParameter[1];
            sp3 = new SqlParameter[1];
            sp3[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp3[0].Value = Convert.ToInt32(str_eventid);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "DELETE FROM TBL_COLLEGE_PAGE_DETAIL WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID", sp3);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Sub Topic Deleted Successfully')", true);

            ClearMyPage();

        }
        catch (Exception ee)
        {
            //message.showError(Messages.ERROR_LEVEL, ee.Message);
        }
    }

    protected void img_fileedit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;
            
            lbl_file_id.Text = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_ID"].ToString();
            


            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT FILE_ID,SUB_TOPIC_ID,FILE_DESCRIPTION,FILE_PATH,FILE_ORDER FROM TBL_COLLEGE_PAGE_FILES where FILE_ID=" + lbl_file_id.Text + "");
            lbl_Id.Text = Server.HtmlDecode(dt_data.Rows[0]["SUB_TOPIC_ID"].ToString());
            lbl_file.Text = Server.HtmlDecode(dt_data.Rows[0]["FILE_PATH"].ToString());
            txt_filedescription.Text = Server.HtmlDecode(dt_data.Rows[0]["FILE_DESCRIPTION"].ToString());
            ddl_file_order.SelectedValue = Server.HtmlDecode(dt_data.Rows[0]["FILE_ORDER"].ToString());

           
            File_FileUpload.Visible = false;            
            chk_multipal_file.Visible = true;
            
            
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Edit " + ee.Message + "')", true);
        }
        
    }

    protected void img_filedelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            string fileid = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_ID"].ToString();
            string filepath = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_PATH"].ToString();

            string path = Server.MapPath(filepath);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }

            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@FILE_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(fileid);

            string str_del = "DELETE from TBL_COLLEGE_PAGE_FILES where FILE_ID=@FILE_ID";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp1);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('File Deleted Successfully')", true);

            ClearFileMyPage();

        }
        catch (Exception ee)
        {
            //message.showError(Messages.ERROR_LEVEL, ee.Message);
        }
    }

    protected void check_rb()
    {
        if (rbFile.Checked == true)
        {
            FileUpload1.Visible = true;
            rbNot.Checked = false;
        }
        else if (rbNot.Checked == true)
        {
            FileUpload1.Visible = false;
            rbFile.Checked = false;
        }
    }

    protected void CheckLinkDescription()
    {
        try
        {
            if (ddl_link_description.SelectedValue == "Description")
            {
                txt_description.Visible = true;
                dv_url.Visible = false;
                txt_description.Focus();
            }
            else
            {
                txt_description.Visible = false;
                dv_url.Visible = true;
                txtURL.Focus();
                txtURL.Visible = true;
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in CheckLinkDescription "+ee.Message+"')", true);
        }
    }

    protected void rbNot_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void chk_multipal_file_Checked_Changed(object sender, EventArgs e)
    {
        if (chk_multipal_file.Checked == true)
        {
            chk_multipal_file.Visible = false;
            File_FileUpload.Visible = true;
            lbl_file.Text = "0";
        }
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
   
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

    protected void ddl_pagehead_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSubMenu();
    }


    protected void CheckFileTable()
    {
        try
        {
            if (lbl_Id.Text != "")
            {
                dv_filetable.Visible = true;
                chk_multipal_file.Visible = false;
                File_FileUpload.Visible = true;
                lbl_file.Text = "0";

                DataTable dt_file = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT FILE_ID,SUB_TOPIC_ID,FILE_DESCRIPTION,FILE_PATH,FILE_ORDER FROM TBL_COLLEGE_PAGE_FILES WHERE SUB_TOPIC_ID=" + lbl_Id.Text + "");

                gv_filetable.DataSource = dt_file;
                gv_filetable.DataBind();
            }
            else
            {
                dv_filetable.Visible = false;
                gv_filetable.DataSource = null;
                gv_filetable.DataBind();
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"","alert('Error in CheckFileTable "+ee.Message+"')",true);
        }
    }
}