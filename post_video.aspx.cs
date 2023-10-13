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

public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    string saveLocation, displayDate;
    int Id;

    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    DataTable dt_page = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT VIDEO_PAGE_ID,VIDEO_PAGE_NAME FROM TBL_VIDEOPAGE");
                    ddl_page.DataSource = dt_page;
                    ddl_page.DataTextField = "VIDEO_PAGE_NAME";
                    ddl_page.DataValueField = "VIDEO_PAGE_NAME";
                    ddl_page.DataBind();
                    ddl_page.Items.Insert(0, new ListItem("Select", "0"));
                    generateId();
                    txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    ClearMyPage();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }
    protected void ClearMyPage()
    {
       
        txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        txt_Description.Text = "";
        txt_url.Text = "";
        ddl_page.SelectedValue = "0";
        generateId();
        GetVideoDetails();
        
    }

    protected void GetVideoDetails()
    {
        try
        {
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [D_id],CONVERT(VARCHAR(10),D_date,105) AS D_date,[Description],[URL],[D_page] FROM [dbo].[TBL_VIDEO]");

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {

        }
    }

    protected void generateId()
    {
        string str = "select IIf(max(D_id) Is Null,0,max(D_id))+1 from tbl_video";
        object obj = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str);
        //lbl_Id.Text = (sql_op.generate_id_sql(str)).ToString();
        lbl_Id.Text = "" + obj;
    }

    protected int validateThis()
    {
        if (lbl_Id.Text == "")
        {
            lblInfo.Text = "Error : ID can not be empty";
            return (0);
        }
        else if (txt_Description.Text == "")
        {
            lblInfo.Text = "Error : Description Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }  
    protected void btn_login_Click(object sender, EventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {

            string str_filepath = txt_url.Text.Replace("watch?v=", "embed/");
            str_filepath = str_filepath.Replace("//m.", "//www.");
            str_filepath = str_filepath.Replace("//youtu.be/", "//www.youtube.com/embed/");

            int find = str_filepath.IndexOf("&");

            if (find != -1)
            {
                int str_length = str_filepath.Length;
                str_filepath = str_filepath.Substring(0, find);
            }

            try
            {
                #region Process Save or Update
                DataTable dtVideo = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_video where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ");

                if (dtVideo.Rows.Count > 0)
                {
                    string str_update = @"update [dbo].[tbl_video] set D_date=@D_date,Description=@Description,URL=@URL,D_page=@D_page where D_id=@D_id";

                    sp = new SqlParameter[5];

                    sp[0] = new SqlParameter("@D_date", SqlDbType.DateTime);
                    sp[0].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[1] = new SqlParameter("@Description", SqlDbType.NVarChar, -1);
                    sp[1].Value = Server.HtmlEncode(txt_Description.Text);

                    sp[2] = new SqlParameter("@URL", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlEncode(str_filepath);

                    sp[3] = new SqlParameter("@D_page", SqlDbType.NVarChar, 150);
                    sp[3].Value = Server.HtmlEncode(ddl_page.SelectedValue);

                    sp[4] = new SqlParameter("@D_id", SqlDbType.Int);
                    sp[4].Value = Convert.ToInt32(lbl_Id.Text);


                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Video Update Successfully')", true);
                    ClearMyPage();
                }
                else
                {
                    int D_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(D_id),0) FROM tbl_video");

                    string str_insert = @"INSERT INTO [dbo].[tbl_video]([D_id],[D_date],[Description],[URL],[D_page])
                        VALUES (@D_id,@D_date,@Description,@URL,@D_page)";

                    sp = new SqlParameter[5];

                    sp[0] = new SqlParameter("@D_id", SqlDbType.Int);
                    sp[0].Value = Convert.ToInt32(lbl_Id.Text);

                    sp[1] = new SqlParameter("@D_date", SqlDbType.DateTime);
                    sp[1].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[2] = new SqlParameter("@Description", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlEncode(txt_Description.Text);

                    sp[3] = new SqlParameter("@URL", SqlDbType.NVarChar, -1);
                    sp[3].Value = Server.HtmlEncode(str_filepath);

                    sp[4] = new SqlParameter("@D_page", SqlDbType.NVarChar, 150);
                    sp[4].Value = Server.HtmlEncode(ddl_page.SelectedValue);


                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Video Insert Successfully')", true);
                    ClearMyPage();
                }

                #endregion
            }
            catch (Exception ee)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Save/Update " + ee.Message + "')", true);
            }
        }
    }
    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_Id.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString();  
            int eventid = Convert.ToInt32(lbl_Id.Text);
            
            txt_Description.Text = gvrow.Cells[3].Text.ToString();
            


            DataTable dtExists = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select CONVERT(VARCHAR(10),D_date,105) AS D_date,URL,D_page from tbl_video where D_id=" + lbl_Id.Text + "");
            txtDisplayDate.Text = Server.HtmlDecode(dtExists.Rows[0]["D_date"].ToString());
            txt_url.Text = Server.HtmlDecode(dtExists.Rows[0]["URL"].ToString());
            ddl_page.SelectedValue = Server.HtmlDecode(dtExists.Rows[0]["D_page"].ToString());
            

           
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

            string str_eventid = news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString();           


            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@D_id", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(str_eventid);

            string str_del = "delete from tbl_video where D_id=@D_id";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp1);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Video Delete Successfully')", true);



            ClearMyPage();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Delete " + ee.Message + "')", true);
        }
    }
    
    protected void btn_Reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_Video.aspx");
    }    
    protected void btn_Menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}
