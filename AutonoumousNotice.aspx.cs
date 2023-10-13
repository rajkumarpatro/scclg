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
using System.IO;

public partial class AutonoumousNotice : System.Web.UI.Page
{
    SqlParameter[] sp = null;
    sql_operations op = new sql_operations();
    string saveLocation, myUrl, linkType, displayDate;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ClearMyPage();
        }
    }

    protected void ClearMyPage()
    {
        GetData();
        lbl_Id.Text = "";
        txt_News_Title.Text = "";
        rbNot.Checked = true;
        check_rb();
        txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        txtURL.Text = "";
        Label1.Text = "0";
    }

    protected void GetData()
    {
        try
        {
            string str_query = @"SELECT [news_Id] ,[news_Date] ,[news_Title] ,[news_filepath] ,[news_Link] ,[news_LinkType] FROM [dbo].[tbl_AutonomousNotice] ORDER BY news_Id DESC";
            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_data;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error "+ee.Message+"')", true);
        }
    }

    protected int validateThis()
    {
        if (txt_News_Title.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error : News Title Required')", true);
            
            return (0);
        }
        else if (rbURL.Checked == false && rbFile.Checked == false && rbNot.Checked == false)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error : Link Required (Note: If File And URL Not Required Then Please Select Not Applicable)')", true);
            
            return (0);
        }
        else if (rbFile.Checked == true && !FileUpload1.HasFile && Label1.Text == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error : File Required')", true);
            return (0);
        }
        else if (rbURL.Checked == true && txtURL.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error : URL Required')", true);
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

    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {

        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;
            int id =Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["news_Id"].ToString());
            string filepath = news_Grid.DataKeys[gvrow.RowIndex].Values["news_filepath"].ToString();

            string str_eventdelete = "delete from tbl_AutonomousNotice where news_Id=@news_Id";
            sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@news_Id", SqlDbType.Int);
            sp[0].Value = id;

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_eventdelete, sp);

            if (filepath != "#")
            {
                string path = Server.MapPath(filepath);
                FileInfo file = new FileInfo(path);
                if (file.Exists)//check file exsit or not
                {
                    file.Delete();
                }
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Deleted Successfully')", true);
            ClearMyPage();

        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"","alert('Problem in Delete News<br>" + ee.Message+"')",true);
        }
    }


    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_Id.Text= news_Grid.DataKeys[gvrow.RowIndex].Values["news_Id"].ToString();
            string linktype = news_Grid.DataKeys[gvrow.RowIndex].Values["news_LinkType"].ToString();

            string filepath = news_Grid.DataKeys[gvrow.RowIndex].Values["news_filepath"].ToString();

            txtDisplayDate.Text = gvrow.Cells[1].Text;
            txt_News_Title.Text = gvrow.Cells[2].Text;

            if (linktype == "URL")
            {
                lblFilePath.Visible = false;
                FileUpload1.Visible = false;
                lblUrl.Visible = true;

                txtURL.Visible = true;
                rbNot.Checked = false;
                rbFile.Checked = false;
                rbURL.Checked = true;

                txtURL.Text = gvrow.Cells[4].Text;
            }
            else if (linktype == "File")
            {
                lblFilePath.Visible = true;
                FileUpload1.Visible = true;
                lblUrl.Visible = false;
                txtURL.Visible = false;

                rbNot.Checked = false;
                rbURL.Checked = false;
                rbFile.Checked = true;

                chk_new.Visible = true;
                FileUpload1.Visible = false;

                Label1.Text = filepath;
            }
            else if (linktype == "#")
            {
                lblFilePath.Visible = false;
                FileUpload1.Visible = false;
                lblUrl.Visible = false;
                txtURL.Visible = false;

                txtURL.Visible = false;
                rbNot.Checked = true;
                rbFile.Checked = false;
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Problem in Delete News<br>" + ee.Message + "')", true);
        }
    }

    protected void check_rb()
    {
        if (rbFile.Checked == true)
        {
            lblFilePath.Visible = true;
            FileUpload1.Visible = true;
            lblUrl.Visible = false;
            txtURL.Visible = false;

            rbNot.Checked = false;
            rbURL.Checked = false;
            rbFile.Checked = true;
        }
        else if(rbURL.Checked==true)
        {
            lblFilePath.Visible = false;
            FileUpload1.Visible = false;
            lblUrl.Visible = true;

            txtURL.Visible = true;
            rbNot.Checked = false;
            rbFile.Checked = false;

        }
        else if(rbNot.Checked==true)
        {
            lblFilePath.Visible = false;
            FileUpload1.Visible = false;
            lblUrl.Visible = false;
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
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
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int flag = validateThis();
            if (flag == 1)
            {
                if (rbFile.Checked == true)
                {
                    if (Label1.Text == "0")
                    {
                        string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                        string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                        saveLocation = "newsData" + "/ACN" + DateTime.Now.ToString("ddMMhhmmss") + picext;
                        FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                    }
                    else
                    {
                        saveLocation = Label1.Text;
                    }
                    myUrl = "#";
                    linkType = "File";
                }
                else if (rbURL.Checked == true)
                {
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

                #region Process Save or Update

                if (lbl_Id.Text != "")
                {
                    //Update Process

                    string str_update = @"UPDATE [dbo].[tbl_AutonomousNotice] SET [news_Date] = @news_Date ,[news_Title] = @news_Title ,[news_filepath] = @news_filepath ,
                                        [news_Link] = @news_Link ,[news_LinkType] = @news_LinkType WHERE [news_Id] = @news_Id";

                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@news_Date", SqlDbType.VarChar, 10);
                    sp[0].Value = Server.HtmlEncode(txtDisplayDate.Text);

                    sp[1] = new SqlParameter("@news_Title", SqlDbType.NVarChar, 250);
                    sp[1].Value = txt_News_Title.Text;

                    sp[2] = new SqlParameter("@news_filepath", SqlDbType.NVarChar, 100);
                    sp[2].Value = saveLocation;

                    sp[3] = new SqlParameter("@news_Link", SqlDbType.NVarChar, 150);
                    sp[3].Value = myUrl;

                    sp[4] = new SqlParameter("@news_LinkType", SqlDbType.VarChar, 20);
                    sp[4].Value = linkType;

                    sp[5] = new SqlParameter("@news_Id", SqlDbType.Int);
                    sp[5].Value = Convert.ToInt32(lbl_Id.Text);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update,sp);

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Updated Successfully')", true);
                    ClearMyPage();
                }
                else
                {
                    //Insert Process
                    int id = Convert.ToInt32(SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select isnull(max(news_Id),0)+1 as ID from tbl_AutonomousNotice"));

                    string str_insert = @"INSERT INTO [dbo].[tbl_AutonomousNotice] ([news_Id] ,[news_Date] ,[news_Title] ,[news_filepath] ,[news_Link] ,[news_LinkType]) 
                                        VALUES (@news_Id ,@news_Date ,@news_Title ,@news_filepath ,@news_Link ,@news_LinkType)";

                    sp = new SqlParameter[6];

                    sp[0] = new SqlParameter("@news_Id",SqlDbType.Int);
                    sp[0].Value = id;

                    sp[1] = new SqlParameter("@news_Date",SqlDbType.VarChar,10);
                    sp[1].Value = Server.HtmlEncode(txtDisplayDate.Text);

                    sp[2] = new SqlParameter("@news_Title", SqlDbType.NVarChar, 250);
                    sp[2].Value = txt_News_Title.Text;

                    sp[3] = new SqlParameter("@news_filepath", SqlDbType.NVarChar, 100);
                    sp[3].Value = saveLocation;

                    sp[4] = new SqlParameter("@news_Link", SqlDbType.NVarChar, 150);
                    sp[4].Value = myUrl;

                    sp[5] = new SqlParameter("@news_LinkType", SqlDbType.VarChar, 20);
                    sp[5].Value = linkType;

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert,sp);

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Inserted Successfully')", true);
                    ClearMyPage();
                }

                #endregion
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error " + ee.Message + "')", true);
        }
    }
}
