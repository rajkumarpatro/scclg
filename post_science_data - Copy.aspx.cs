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

public partial class post_science_data : System.Web.UI.Page
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
            if (Session["iamuser"] != null)
            {
                
                GetPageHead();
                txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                txt_file_date.Text = DateTime.Now.ToString("dd-MM-yyyy");
                for (int i = 1; i <= 100; i++)
                {
                    ddl_file_order.Items.Add(i.ToString());
                    ddl_topic_order.Items.Add(i.ToString());
                    ddl_subtopic_order.Items.Add(i.ToString());
                }
            }
            else
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }

    protected void lnk_islink_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkupdate = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnkupdate.NamingContainer;
            string str_islink = "";
            string str_link = "";
            if (lnkupdate.Text == "Yes")
            {
                str_islink = "No";
                str_link = "-";
            }
            else
            {
                str_islink = "Yes";
                str_link = "-";
            }

            int topicid= Convert.ToInt32(gv_topic.DataKeys[gvrow.RowIndex].Values["TOPIC_ID"].ToString());

            string str_update_topic = @"UPDATE [TBL_SCD_PAGE_TOPIC] SET IS_LINK=@IS_LINK, LINK_URL=@LINK_URL, WHERE TOPIC_ID=@TOPIC_ID AND PAGE_ID=@PAGE_ID";

            sp = new SqlParameter[4];

            sp[0] = new SqlParameter("@IS_LINK", SqlDbType.NVarChar, 3);
            sp[0].Value = str_islink;

            sp[1] = new SqlParameter("@LINK_URL", SqlDbType.NVarChar, 200);
            sp[1].Value = str_link;

            sp[2] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp[2].Value = topicid;

            sp[3] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[3].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update_topic, sp);
            GetAllTopics();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Topic Edited Successfully')", true);
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
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
                        string str_insert = @"UPDATE [TBL_SCD_PAGE_FILES] SET [FILE_ORDER] = @FILE_ORDER WHERE [FILE_ID] = @FILE_ID";

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
                    CheckFileTable();
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
            DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [PAGE_HEAD_ID],[PAGE_HEAD_NAME] FROM [TBL_SCD_PAGE_HEAD] ORDER BY PAGE_HEAD_NAME");
            ddl_pagehead.DataSource = dt_category;
            ddl_pagehead.DataTextField = "PAGE_HEAD_NAME";
            ddl_pagehead.DataValueField = "PAGE_HEAD_ID";
            ddl_pagehead.DataBind();
            ddl_pagehead.Items.Insert(0, new ListItem("Select", "0"));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error : " + ee.Message;
        }
    }

    protected void GetSubMenu()
    {
        try
        {
            DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT PAGE_ID, PAGE_NAME FROM TBL_SCD_PAGE where PAGE_HEAD_ID=" + ddl_pagehead.SelectedValue + " and IS_LINK='Description' ORDER BY PAGE_ID");
            ddl_submenu.DataSource = dt_category;
            ddl_submenu.DataTextField = "PAGE_NAME";
            ddl_submenu.DataValueField = "PAGE_ID";
            ddl_submenu.DataBind();
            ddl_submenu.Items.Insert(0, new ListItem("Select", "0"));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error : " + ee.Message;
        }
    }
    protected void ClearMyPage()
    {
        try
        {
            lbl_Id.Text = "";
            txt_description.Content = "";
            txt_title.Text = "";
            txt_link.Text = "";
            fill_grid();
            gv_photos.DataSource = null;
            gv_photos.DataBind();
            rbNot.Checked = true;
            rbFile.Checked = false;
            img_intro.Visible = false;
            chk_new.Visible = false;
            chk_new.Checked = false;
            FileUpload1.Visible = false;
            Label1.Text = "0";
            check_rb();

            //GetSubMenu();
            //if (txt_topic.Visible == true && ddl_topic.Visible == false)
            //{
            //    GetTopics();
            //    ddl_topic.SelectedValue = GetTopicId().ToString();
            //    txt_topic.Text = "";
            //    ddl_topic.Visible = true;
            //}
            txt_description.Visible = true;
            //ddl_submenu.SelectedValue = "";

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
        if (lbl_Id.Text == "")
        {
            lbl_Id.Text = op.generate_id_sql("SELECT ISNULL(MAX(SUB_TOPIC_ID),0) FROM TBL_SCD_PAGE_DETAIL").ToString();
            
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
    protected void btn_Recet_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_data.aspx");
    }

    protected void btn_addfile_Click(object sender, EventArgs e)
    {
        int FILE_ID;
        if (lbl_file_id.Text == "")
        {
            FILE_ID = op.generate_id_sql("SELECT ISNULL(MAX(FILE_ID),0) FROM TBL_SCD_PAGE_FILES");
            

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
                string picname = System.IO.Path.GetFileNameWithoutExtension(File_FileUpload.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(File_FileUpload.PostedFile.FileName).ToLower();

                if (picext == ".Zip" || picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = "science_Content/" + FILE_ID.ToString() + "_" + lbl_Id.Text.ToString() + "_" + picname + picext;
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
                    string str_update = @"UPDATE [TBL_SCD_PAGE_FILES] SET [SUB_TOPIC_ID] = @SUB_TOPIC_ID,[FILE_DATE]=@FILE_DATE,[FILE_DESCRIPTION] = @FILE_DESCRIPTION,[FILE_PATH] = @FILE_PATH,[FILE_ORDER] = @FILE_ORDER WHERE TBL_SCD_PAGE_FILES.FILE_ID=@FILE_ID";

                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[0].Value = Convert.ToInt32(lbl_Id.Text);

                    sp[1] = new SqlParameter("@FILE_DATE", SqlDbType.DateTime);
                    sp[1].Value = DateTime.ParseExact(txt_file_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[2] = new SqlParameter("@FILE_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlDecode(txt_filedescription.Text);

                    sp[3] = new SqlParameter("@FILE_PATH", SqlDbType.NVarChar, 200);
                    sp[3].Value = Server.HtmlEncode(saveLocation);

                    sp[4] = new SqlParameter("@FILE_ORDER", SqlDbType.Int);
                    sp[4].Value = Server.HtmlDecode(ddl_file_order.SelectedValue);

                    sp[5] = new SqlParameter("@FILE_ID", SqlDbType.Int);
                    sp[5].Value = Convert.ToInt32(lbl_file_id.Text); ;

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('File Updated Successfully')", true);

                    ClearFileMyPage();

                    #endregion
                }
                else
                {


                    string str_insert = @"INSERT INTO [TBL_SCD_PAGE_FILES] ([FILE_ID],[SUB_TOPIC_ID],[FILE_DATE],[FILE_DESCRIPTION],[FILE_PATH],[FILE_ORDER])
                                         VALUES (@FILE_ID,@SUB_TOPIC_ID,@FILE_DATE,@FILE_DESCRIPTION,@FILE_PATH,@FILE_ORDER)";

                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@FILE_ID", SqlDbType.Int);
                    sp[0].Value = FILE_ID;

                    sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(lbl_Id.Text);

                    sp[2] = new SqlParameter("@FILE_DATE", SqlDbType.DateTime);
                    sp[2].Value = DateTime.ParseExact(txt_file_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[3] = new SqlParameter("@FILE_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[3].Value = Server.HtmlDecode(txt_filedescription.Text);

                    sp[4] = new SqlParameter("@FILE_PATH", SqlDbType.NVarChar, 200);
                    sp[4].Value = Server.HtmlEncode(saveLocation);

                    sp[5] = new SqlParameter("@FILE_ORDER", SqlDbType.Int);
                    sp[5].Value = Server.HtmlDecode(ddl_file_order.SelectedValue);



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
            SUB_TOPIC_ID = op.generate_id_sql("SELECT ISNULL(MAX(SUB_TOPIC_ID),0) FROM TBL_SCD_PAGE_DETAIL");
            
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
                string picname = System.IO.Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

                if (picext == ".Zip" || picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = "science_Content/" + SUB_TOPIC_ID.ToString() + "_" + picname + picext;
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


                if (lbl_Id.Text != "")
                {
                    #region UpdatePrcess
                    string str_update = @"UPDATE [TBL_SCD_PAGE_DETAIL] SET [SUB_TOPIC_NAME] = @SUB_TOPIC_NAME,[TOPIC_DATE] = @TOPIC_DATE,[TOPIC_DESCRIPTION] = @TOPIC_DESCRIPTION
                                              ,[TOPIC_FILEPATH] = @TOPIC_FILEPATH, [TOPIC_LINK_TYPE] = @TOPIC_LINK_TYPE,SHOW_TOPIC_NAME=@SHOW_TOPIC_NAME, DATETIMESTAMP=GETDATE(),SUB_TOPIC_TYPE=@SUB_TOPIC_TYPE,SUB_TOPIC_ORDER=@SUB_TOPIC_ORDER WHERE TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ID=@SUB_TOPIC_ID";

                    sp = new SqlParameter[9];

                    sp[0] = new SqlParameter("@SUB_TOPIC_NAME", SqlDbType.NVarChar, 200);
                    sp[0].Value = Server.HtmlDecode(txt_title.Text);

                    sp[1] = new SqlParameter("@TOPIC_DATE", SqlDbType.Date);
                    sp[1].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[2] = new SqlParameter("@TOPIC_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlDecode(txt_description.Content);

                    sp[3] = new SqlParameter("@TOPIC_FILEPATH", SqlDbType.NVarChar, 200);
                    sp[3].Value = Server.HtmlEncode(saveLocation);

                    sp[4] = new SqlParameter("@TOPIC_LINK_TYPE", SqlDbType.NVarChar, 10);
                    sp[4].Value = Server.HtmlEncode(linkType);

                    sp[5] = new SqlParameter("@SHOW_TOPIC_NAME", SqlDbType.NVarChar, 3);
                    sp[5].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                    sp[6] = new SqlParameter("@SUB_TOPIC_TYPE", SqlDbType.NVarChar, 50);
                    sp[6].Value = Server.HtmlEncode(ddl_subtopic_type.SelectedValue);

                    sp[7] = new SqlParameter("@SUB_TOPIC_ORDER", SqlDbType.Int);
                    sp[7].Value = Convert.ToInt32(ddl_subtopic_order.SelectedValue);

                    sp[8] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[8].Value = Convert.ToInt32(lbl_Id.Text);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "UPDATE TBL_SCD_PAGE_PHOTOS SET SUB_TOPIC_ID=" + lbl_Id.Text + " where SUB_TOPIC_ID is null");

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Sub Topic Updated Successfully')", true);

                    ClearMyPage();

                    #endregion
                }
                else
                {
                    int TOPIC_ID = Convert.ToInt32(ddl_topic.SelectedValue);
                    

                    string str_insert = @"INSERT INTO [TBL_SCD_PAGE_DETAIL] ([SUB_TOPIC_ID],[TOPIC_ID],[SUB_TOPIC_NAME],[TOPIC_DATE],[TOPIC_DESCRIPTION],[TOPIC_FILEPATH],[TOPIC_LINK_TYPE],DATETIMESTAMP,SHOW_TOPIC_NAME,SUB_TOPIC_TYPE,SUB_TOPIC_ORDER)
                                         VALUES (@SUB_TOPIC_ID,@TOPIC_ID,@SUB_TOPIC_NAME,@TOPIC_DATE,@TOPIC_DESCRIPTION,@TOPIC_FILEPATH,@TOPIC_LINK_TYPE,GETDATE(),@SHOW_TOPIC_NAME,@SUB_TOPIC_TYPE,@SUB_TOPIC_ORDER)";

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

                    sp[5] = new SqlParameter("@TOPIC_FILEPATH", SqlDbType.NVarChar, 200);
                    sp[5].Value = Server.HtmlEncode(saveLocation);

                    sp[6] = new SqlParameter("@TOPIC_LINK_TYPE", SqlDbType.NVarChar, -1);
                    sp[6].Value = Server.HtmlEncode(linkType);

                    sp[7] = new SqlParameter("@SHOW_TOPIC_NAME", SqlDbType.NVarChar, 3);
                    sp[7].Value = Server.HtmlEncode(ddl_show.SelectedValue);

                    sp[8] = new SqlParameter("@SUB_TOPIC_TYPE", SqlDbType.NVarChar, 50);
                    sp[8].Value = Server.HtmlEncode(ddl_subtopic_type.SelectedValue);

                    sp[9] = new SqlParameter("@SUB_TOPIC_ORDER", SqlDbType.Int);
                    sp[9].Value = Convert.ToInt32(ddl_subtopic_order.SelectedValue);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "UPDATE TBL_SCD_PAGE_PHOTOS SET SUB_TOPIC_ID=" + SUB_TOPIC_ID + " where SUB_TOPIC_ID is null");

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

   
    protected void rb_description_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }

    protected void fill_grid()
    {
        try
        {
            int topicid = 0;
            topicid = Convert.ToInt32(ddl_topic.SelectedValue);

            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp[0].Value = topicid;

            string str_query = @"SELECT TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ID, TBL_SCD_PAGE_DETAIL.TOPIC_ID, TBL_SCD_PAGE_DETAIL.SUB_TOPIC_NAME, 
	                     CONVERT(VARCHAR(10),TOPIC_DATE,105) AS TOPIC_DATE,
                         TBL_SCD_PAGE_DETAIL.TOPIC_DESCRIPTION, TBL_SCD_PAGE_DETAIL.TOPIC_FILEPATH,
                         TBL_SCD_PAGE_DETAIL.TOPIC_LINK_TYPE, TBL_SCD_PAGE_DETAIL.SHOW_TOPIC_NAME, TBL_SCD_PAGE_TOPIC.PAGE_ID, 
                         TBL_SCD_PAGE_TOPIC.TOPIC_NAME,TBL_SCD_PAGE_DETAIL.SUB_TOPIC_TYPE,TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ORDER
                         FROM TBL_SCD_PAGE_DETAIL INNER JOIN
                         TBL_SCD_PAGE_TOPIC ON TBL_SCD_PAGE_DETAIL.TOPIC_ID = TBL_SCD_PAGE_TOPIC.TOPIC_ID WHERE TBL_SCD_PAGE_TOPIC.TOPIC_ID=" + ddl_topic.SelectedValue + " ORDER BY TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ORDER, TBL_SCD_PAGE_DETAIL.TOPIC_DATE DESC ";
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);
            about_Grid.DataSource = dt_details;
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
            ddl_topic_order.SelectedItem.Text = gv_topic.DataKeys[gvrow.RowIndex].Values["TOPIC_ORDER"].ToString();

            txt_newtopic.Text = gvrow.Cells[2].Text;
            ddl_link.SelectedValue = gvrow.Cells[3].Text;
            txt_link.Text = gvrow.Cells[4].Text;
            CheckTopicIsLink();
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

            string deletetopic = "DELETE FROM [TBL_SCD_PAGE_TOPIC] WHERE TOPIC_ID=@TOPIC_ID AND PAGE_ID=@PAGE_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, deletetopic, sp);

            ///////////    DELETING TOPIC PHOTOS    //////////
            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(topicid);

            string str_photosdelete1 = "select PHOTO_PATH from TBL_SCD_PAGE_PHOTOS where SUB_TOPIC_ID IN (SELECT SUB_TOPIC_ID FROM TBL_SCD_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID)";
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

            SqlParameter[] sp_photos = new SqlParameter[1];
            sp_photos[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp_photos[0].Value = Convert.ToInt32(topicid);

            string str_del_photos = "delete from TBL_SCD_PAGE_PHOTOS where SUB_TOPIC_ID IN (SELECT SUB_TOPIC_ID FROM TBL_SCD_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID)";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del_photos, sp_photos);

            ///////////    DELETING TOPIC FILES    //////////
            SqlParameter[] spfiles = new SqlParameter[1];
            spfiles[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            spfiles[0].Value = Convert.ToInt32(topicid);

            string str_files = "select FILE_PATH from TBL_SCD_PAGE_FILES where SUB_TOPIC_ID IN (SELECT SUB_TOPIC_ID FROM TBL_SCD_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID)";
            DataTable dt_files = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_files, spfiles);

            for (int i = 0; i < dt_files.Rows.Count; i++)
            {
                if (dt_files.Rows[i]["FILE_PATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_files.Rows[i]["FILE_PATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            SqlParameter[] sp_deletefiles = new SqlParameter[1];
            sp_deletefiles[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp_deletefiles[0].Value = Convert.ToInt32(topicid);

            string str_del_files = "delete from TBL_SCD_PAGE_FILES where SUB_TOPIC_ID IN (SELECT SUB_TOPIC_ID FROM TBL_SCD_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID)";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del_files, sp_deletefiles);

            ///////////    DELETING TOPIC DETAILS    //////////

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(topicid);

            string str_deletetopicfiles = "select TOPIC_FILEPATH from TBL_SCD_PAGE_DETAIL where TOPIC_ID=@TOPIC_ID";
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
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "DELETE FROM TBL_SCD_PAGE_DETAIL WHERE TOPIC_ID=@TOPIC_ID", sp3);
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
            dv_topic.Visible = true;
            ddl_topic.Visible = false;

            about_Grid.DataSource = null;
            about_Grid.DataBind();
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

            string str_query = @"SELECT [TOPIC_ID] ,[PAGE_ID] ,[TOPIC_NAME] FROM [TBL_SCD_PAGE_TOPIC] WHERE PAGE_ID=@PAGE_ID AND IS_LINK='No' ORDER BY TOPIC_ORDER";

            DataTable dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp);

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "TOPIC_NAME";
            ddl_topic.DataValueField = "TOPIC_ID";
            ddl_topic.DataBind();

            ddl_topic.Items.Insert(0, new ListItem("Select", "0"));
            ddl_topic.Items.Insert(dt_topics.Rows.Count + 1, new ListItem("Add/Edit Topic", "-1"));

            GetAllTopics();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error on GetTopics " + ee.Message + "')", true);
        }
    }

    protected void GetAllTopics()
    {
        try
        {
            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

            string str_query = @"SELECT [TOPIC_ID] ,[PAGE_ID] ,[TOPIC_NAME],IS_LINK,LINK_URL,TOPIC_ORDER FROM [TBL_SCD_PAGE_TOPIC] WHERE PAGE_ID=@PAGE_ID ORDER BY TOPIC_ORDER";

            DataTable dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp);

            gv_topic.DataSource = dt_topics;
            gv_topic.DataBind();
            lbl_topic_id.Text = "";
            txt_link.Text = "";
            txt_newtopic.Text = "";
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error on GetTopics " + ee.Message + "')", true);
        }
    }

    protected void ddl_link_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckTopicIsLink();
    }

    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        
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

            GetEventPhotos();

            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT TOPIC_LINK_TYPE,SUB_TOPIC_TYPE,SUB_TOPIC_ORDER,TOPIC_FILEPATH,TOPIC_DESCRIPTION FROM TBL_SCD_PAGE_DETAIL where SUB_TOPIC_ID=" + lbl_Id.Text + "");

            txt_description.Content = Server.HtmlDecode(dt_data.Rows[0]["TOPIC_DESCRIPTION"].ToString());
            ddl_subtopic_type.SelectedValue= Server.HtmlDecode(dt_data.Rows[0]["SUB_TOPIC_TYPE"].ToString());
            ddl_subtopic_order.SelectedValue = Server.HtmlDecode(dt_data.Rows[0]["SUB_TOPIC_ORDER"].ToString());

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

            //------------DELETING PHOTOS OF SUB TOPIC-------------//

            sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(str_eventid);

            string str_photosdelete1 = "select PHOTO_PATH from TBL_SCD_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID ";
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

            string str_del = "delete from TBL_SCD_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp1);


            ///////////    DELETING TOPIC FILES    //////////
            SqlParameter[] spfiles = new SqlParameter[1];
            spfiles[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            spfiles[0].Value = Convert.ToInt32(str_eventid);

            string str_files = "select FILE_PATH from TBL_SCD_PAGE_FILES where SUB_TOPIC_ID=@SUB_TOPIC_ID";
            DataTable dt_files = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_files, spfiles);

            for (int i = 0; i < dt_files.Rows.Count; i++)
            {
                if (dt_files.Rows[i]["FILE_PATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_files.Rows[i]["FILE_PATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            SqlParameter[] sp_deletefiles = new SqlParameter[1];
            sp_deletefiles[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp_deletefiles[0].Value = Convert.ToInt32(str_eventid);

            string str_del_files = "delete from TBL_SCD_PAGE_FILES where SUB_TOPIC_ID=@SUB_TOPIC_ID";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del_files, sp_deletefiles);



            //--------DELETING SUB TOPIC------------------//

            SqlParameter[] sp2 = new SqlParameter[1];
            sp2 = new SqlParameter[1];
            sp2[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp2[0].Value = Convert.ToInt32(str_eventid);

            string str_photosdelete = "select TOPIC_FILEPATH from TBL_SCD_PAGE_DETAIL where SUB_TOPIC_ID=@SUB_TOPIC_ID";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete, sp2);

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

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "DELETE FROM TBL_SCD_PAGE_DETAIL WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID", sp3);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Sub Topic Deleted Successfully')", true);

            ClearMyPage();

        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while deleting sub topic "+ee.Message+"')", true);
        }
    }

    protected void img_fileedit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_file_id.Text = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_ID"].ToString();
            lbl_Id.Text = gv_filetable.DataKeys[gvrow.RowIndex].Values["SUB_TOPIC_ID"].ToString();
            lbl_file.Text = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_PATH"].ToString();
            txt_file_date.Text = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_DATE"].ToString();
            txt_filedescription.Text = gvrow.Cells[2].Text;
            ddl_file_order.SelectedValue = gv_filetable.DataKeys[gvrow.RowIndex].Values["FILE_ORDER"].ToString();


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

            string str_del = "DELETE from TBL_SCD_PAGE_FILES where FILE_ID=@FILE_ID";

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

                DataTable dt_file = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT FILE_ID,SUB_TOPIC_ID,CONVERT(VARCHAR(10),FILE_DATE,105) AS FILE_DATE,FILE_DESCRIPTION,FILE_PATH,FILE_ORDER  FROM TBL_SCD_PAGE_FILES WHERE SUB_TOPIC_ID=" + lbl_Id.Text + " ORDER BY FILE_ORDER");

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
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in CheckFileTable " + ee.Message + "')", true);
        }
    }


    protected void AjaxFileUpload1_UploadComplete1(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        try
        {
            string picname = System.IO.Path.GetFileName(e.FileName);
            string picext = System.IO.Path.GetExtension(e.FileName);

            string guid = Guid.NewGuid().ToString();

            saveLocation = "science_events/" + guid + picext;

            saveLocation = Server.MapPath("science_events/" + guid + picext);
            //AjaxFileUpload1.SaveAs(MapPath(saveLocation));

            //Stream strm = FileUpload1.PostedFile.InputStream;
            Stream strm = e.GetStreamContents();
            var targetFile = saveLocation;

            op.GenerateThumbnails(0.5, strm, targetFile);

            saveLocation = "science_events/" + guid + picext;

            int Photoid = Convert.ToInt32(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select IIf(max(PHOTO_ID) Is Null,0,max(PHOTO_ID))+1 from TBL_SCD_PAGE_PHOTOS"));

            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@PHOTO_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(Photoid);

            sp[1] = new SqlParameter("@PHOTO_PATH", SqlDbType.NVarChar, 300);
            sp[1].Value = saveLocation;

            string str_insert = "INSERT INTO [TBL_SCD_PAGE_PHOTOS] ([PHOTO_ID] ,[PHOTO_PATH]) VALUES (@PHOTO_ID,@PHOTO_PATH)";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in adding image<br>" + ee.Message;
        }
    }

    protected void img_deletephoto_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            string str_photoid = gv_photos.DataKeys[gvrow.RowIndex].Values["PHOTO_ID"].ToString();
            string str_photopath = gv_photos.DataKeys[gvrow.RowIndex].Values["PHOTO_PATH"].ToString();

            string path = Server.MapPath(str_photopath);
            FileInfo file = new FileInfo(path);

            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }

            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@PHOTO_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(str_photoid);

            sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(lbl_Id.Text);

            string str_del = "delete from TBL_SCD_PAGE_PHOTOS where PHOTO_ID=@PHOTO_ID and SUB_TOPIC_ID=@SUB_TOPIC_ID";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp);

            GetEventPhotos();
        }
        catch (Exception ee)
        {
            lblInfo.Text = ee.Message;
        }
    }

    protected void GetEventPhotos()
    {
        try
        {
            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(lbl_Id.Text);

            string str_getphotos = "SELECT SUB_TOPIC_ID,PHOTO_ID,PHOTO_PATH FROM TBL_SCD_PAGE_PHOTOS WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID ORDER BY PHOTO_ID";

            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_getphotos, sp);

            gv_photos.DataSource = dt_photos;
            gv_photos.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = ee.Message;
        }
    }
    protected int validateTopicThis()
    {
        if (txt_newtopic.Text == "")
        {
            lbl_topic_error.Text = "Error : Enter Topic Name)";
            return (0);
        }        
        else
        {
            return (1);
        }
    }
    protected void btn_add_topic_Click(object sender, EventArgs e)
    {
        try
        {
            string link = "";
            
            if (ddl_link.SelectedValue == "Yes")
            {
                link = txt_link.Text;
            }
            else
            {
                link = "-";
            }
            int flag = validateTopicThis();
            if (flag == 1)
            {
                if (lbl_topic_id.Text != "")
                {
                    string str_update_topic = @"UPDATE [TBL_SCD_PAGE_TOPIC] SET TOPIC_NAME=@TOPIC_NAME, IS_LINK=@IS_LINK, LINK_URL=@LINK_URL, TOPIC_ORDER=@TOPIC_ORDER WHERE TOPIC_ID=@TOPIC_ID AND PAGE_ID=@PAGE_ID";

                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@TOPIC_NAME", SqlDbType.NVarChar, 200);
                    sp[0].Value = Server.HtmlDecode(txt_newtopic.Text);

                    sp[1] = new SqlParameter("@IS_LINK", SqlDbType.NVarChar, 3);
                    sp[1].Value = ddl_link.SelectedItem.Text;

                    sp[2] = new SqlParameter("@LINK_URL", SqlDbType.NVarChar, 200);
                    sp[2].Value = link;

                    sp[3] = new SqlParameter("@TOPIC_ORDER", SqlDbType.Int);
                    sp[3].Value = Convert.ToInt32(ddl_topic_order.SelectedItem.Text);

                    sp[4] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                    sp[4].Value = Convert.ToInt32(lbl_topic_id.Text);

                    sp[5] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                    sp[5].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update_topic, sp);
                    GetAllTopics();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Topic Edited Successfully')", true);

                }
                else
                {
                    string str_insert_topic = @"INSERT INTO [TBL_SCD_PAGE_TOPIC] ([TOPIC_ID] ,[PAGE_ID] ,[TOPIC_NAME],IS_LINK,LINK_URL,TOPIC_ORDER) VALUES (@TOPIC_ID ,@PAGE_ID ,@TOPIC_NAME, @IS_LINK, @LINK_URL, @TOPIC_ORDER)";


                    int TOPIC_ID = op.generate_id_sql("SELECT ISNULL(MAX(TOPIC_ID),0) FROM TBL_SCD_PAGE_TOPIC");
                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                    sp[0].Value = TOPIC_ID;

                    sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(ddl_submenu.SelectedValue);

                    sp[2] = new SqlParameter("@TOPIC_NAME", SqlDbType.NVarChar, 200);
                    sp[2].Value = Server.HtmlDecode(txt_newtopic.Text);

                    sp[3] = new SqlParameter("@IS_LINK", SqlDbType.NVarChar, 3);
                    sp[3].Value = ddl_link.SelectedItem.Text;

                    sp[4] = new SqlParameter("@LINK_URL", SqlDbType.NVarChar, 200);
                    sp[4].Value = link;

                    sp[5] = new SqlParameter("@TOPIC_ORDER", SqlDbType.Int);
                    sp[5].Value = Convert.ToInt32(ddl_topic_order.SelectedItem.Text);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert_topic, sp);
                    GetAllTopics();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Topic Added Successfully')", true);

                }
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Add/Edit Topic "+ee.Message+"')", true);
        }
    }

    protected void btn_ok_topic_Click(object sender, EventArgs e)
    {
        GetTopics();
        dv_topic.Visible = false;
        ddl_topic.Visible = true;
    }

    protected void btn_set_topic_order_Click(object sender, EventArgs e)
    {
        try
        {
            if (gv_topic.Rows.Count > 0)
            {
                int j = 0;
                for (int i = 0; i < gv_topic.Rows.Count; i++)
                {

                    string reorder = ((TextBox)gv_topic.Rows[i].FindControl("txt_topic_order")).Text;
                    string topicid = gv_topic.DataKeys[i].Values["TOPIC_ID"].ToString();

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [TBL_SCD_PAGE_TOPIC] SET TOPIC_ORDER=@TOPIC_ORDER WHERE [TOPIC_ID] = @TOPIC_ID";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@TOPIC_ORDER", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                        sp[1].Value = Convert.ToInt32(topicid);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                        j++;
                    }
                }

                if (j != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + j.ToString() + " Records Updated')", true);
                    GetAllTopics();
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

    protected void CheckTopicIsLink()
    {
        if (ddl_link.SelectedValue == "Yes")
        {
            dv_url.Visible = true;
        }
        else
        {
            dv_url.Visible = false;
        }
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

            string str_update = @"UPDATE TBL_SCD_PAGE_DETAIL SET SHOW_TOPIC_NAME=@SHOW_TOPIC_NAME WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@SHOW_TOPIC_NAME", SqlDbType.NVarChar, 3);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(about_Grid.DataKeys[gvrow.RowIndex].Values["SUB_TOPIC_ID"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
            fill_grid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
        }
    }

    protected void lnk_subtopictype_click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkupdate = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnkupdate.NamingContainer;
            string str_enabledisable = "";
            if (lnkupdate.Text == "PARAGRAPH")
            {
                str_enabledisable = "ACCORDION";
            }
            else
            {
                str_enabledisable = "PARAGRAPH";
            }

            string str_update = @"UPDATE TBL_SCD_PAGE_DETAIL SET SUB_TOPIC_TYPE=@SUB_TOPIC_TYPE WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@SUB_TOPIC_TYPE", SqlDbType.NVarChar, 50);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(about_Grid.DataKeys[gvrow.RowIndex].Values["SUB_TOPIC_ID"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
            fill_grid();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
        }
    }

    protected void btn_set_subtopicorder_Click(object sender, EventArgs e)
    {
        try
        {
            if (about_Grid.Rows.Count > 0)
            {
                int j = 0;
                for (int i = 0; i < about_Grid.Rows.Count; i++)
                {

                    string reorder = ((TextBox)about_Grid.Rows[i].FindControl("txt_subtopic_order")).Text;
                    int subtopicid = Convert.ToInt32(about_Grid.DataKeys[i].Values["SUB_TOPIC_ID"].ToString());

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [TBL_SCD_PAGE_DETAIL] SET SUB_TOPIC_ORDER=@SUB_TOPIC_ORDER WHERE [SUB_TOPIC_ID] = @SUB_TOPIC_ID";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@SUB_TOPIC_ORDER", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                        sp[1].Value = subtopicid;

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                        j++;
                    }
                }

                if (j != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + j.ToString() + " Records Updated')", true);
                    fill_grid();
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


    protected void btn_addmultipalefile_Click(object sender, EventArgs e)
    {


        if (Multifile.HasFile == false)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Please Select any file')", true);
        }
        else
        {
            int i = 1;

            foreach (var file in Multifile.PostedFiles)
            {
                int FILE_ID = op.generate_id_sql("SELECT ISNULL(MAX(FILE_ID),0) FROM TBL_SCD_PAGE_FILES");


                string picname = System.IO.Path.GetFileNameWithoutExtension(file.FileName);
                string picext = System.IO.Path.GetExtension(file.FileName).ToLower();

                if (picext == ".Zip" || picext == ".doc" || picext == ".docx" || picext == ".xls" || picext == ".xlsx" || picext == ".ppt" || picext == ".pptx" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = "Content/" + FILE_ID.ToString() + "_" + lbl_Id.Text.ToString() + "_" + picname + picext;
                    file.SaveAs(MapPath(saveLocation));

                    string str_insert = @"INSERT INTO [TBL_SCD_PAGE_FILES] ([FILE_ID],[SUB_TOPIC_ID],FILE_DATE,[FILE_DESCRIPTION],[FILE_PATH],[FILE_ORDER])
                                         VALUES (@FILE_ID,@SUB_TOPIC_ID,@FILE_DATE,@FILE_DESCRIPTION,@FILE_PATH,@FILE_ORDER)";

                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@FILE_ID", SqlDbType.Int);
                    sp[0].Value = FILE_ID;

                    sp[1] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                    sp[1].Value = Convert.ToInt32(lbl_Id.Text);

                    sp[2] = new SqlParameter("@FILE_DATE", SqlDbType.Date);
                    sp[2].Value = DateTime.ParseExact(txt_file_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[3] = new SqlParameter("@FILE_DESCRIPTION", SqlDbType.NVarChar, -1);
                    sp[3].Value = Server.HtmlDecode(picname);

                    sp[4] = new SqlParameter("@FILE_PATH", SqlDbType.NVarChar, -1);
                    sp[4].Value = Server.HtmlEncode(saveLocation);

                    sp[5] = new SqlParameter("@FILE_ORDER", SqlDbType.Int);
                    sp[5].Value = 1;

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    i++;
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Total : " + (i-1).ToString() + " files added')", true);
            ClearFileMyPage();
        }

    }
}