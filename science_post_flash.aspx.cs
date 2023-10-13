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


public partial class science_post_flash : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    SqlParameter[] sp = null;

    string saveLocation;
    int Id, update_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            try
            {
                if (Session["iamuser"]==null)
                {
                    Response.Redirect("science_login.aspx");
                }
                else
                {
                    ClearMy();
                    for (int i = 1; i <= 20; i++)
                    {
                        ddl_order.Items.Add(i.ToString());
                    }
                }
            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }
    protected void btn_setorder_Click(object sender, EventArgs e)
    {
        try
        {
            if (news_Grid.Rows.Count > 0)
            {
                int j = 0;
                for (int i = 0; i < news_Grid.Rows.Count; i++)
                {

                    string reorder = ((TextBox)news_Grid.Rows[i].FindControl("txt_order")).Text;
                    string pageid = news_Grid.DataKeys[i].Values["event_id"].ToString();

                    if (reorder != "")
                    {
                        string str_insert = @"UPDATE [TBL_SCD_FLASH] SET [Order] = @Order WHERE [event_id] = @event_id";

                        sp = new SqlParameter[2];

                        sp[0] = new SqlParameter("@Order", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(reorder);

                        sp[1] = new SqlParameter("@event_id", SqlDbType.Int);
                        sp[1].Value = Convert.ToInt32(pageid);

                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

                        j++;
                    }
                }

                if (j != 0)
                {
                    GetDetails();
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
    protected void GetDetails()
    {
        try
        {
            string str_query = "SELECT [event_id] , [event_caption] , [filepath],[Order],SHOW_FLASH FROM [TBL_SCD_FLASH] ORDER BY [Order]";
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
            
            chk_new.Visible = false;
            img_logo.Visible = false;
        }
        catch (Exception ee)
        {

        }
    }

    protected void lnk_show_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkupdate = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)lnkupdate.NamingContainer;
            string str_enabledisable = "";
            if (lnkupdate.Text == "YES")
            {
                str_enabledisable = "NO";
            }
            else
            {
                str_enabledisable = "YES";
            }

            string str_update = @"UPDATE TBL_SCD_FLASH SET SHOW_FLASH=@SHOW_FLASH WHERE event_id=@event_id";
            SqlParameter[] sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@SHOW_FLASH", SqlDbType.NVarChar, 3);
            sp[0].Value = str_enabledisable;

            sp[1] = new SqlParameter("@event_id", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["event_id"].ToString());

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
            GetDetails();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Show " + ee.Message + "')", true);
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            int allok = 0;
            if (Label1.Text == "0")
            {

                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

                if (picext == ".gif" || picext == ".pdf" || picext == ".jpg" || picext == ".jpeg" || picext == ".png")
                {
                    saveLocation = Server.MapPath("events/flash" + lbl_Id.Text.ToString() + picext);
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    var targetFile = saveLocation;
                    op.GenerateFixedSizeImage(1903, 700, strm, targetFile);

                    saveLocation = "events/flash" + lbl_Id.Text.ToString() + picext;

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
            

            DataTable adptExists = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from TBL_SCD_FLASH where event_id=" + Convert.ToInt32(lbl_Id.Text) + " ");
           
            if (adptExists.Rows.Count>0)
            {
                //conn.Open();
                string str_update = @"UPDATE [TBL_SCD_FLASH] set [event_caption] = @event_caption, [filepath] = @filepath,[Order]=@Order  WHERE [event_id] = @event_id";

                sp = new SqlParameter[4];


                sp[0] = new SqlParameter("@event_caption", SqlDbType.NVarChar, 100);
                sp[0].Value = Server.HtmlEncode(txt_name.Text);                

                sp[1] = new SqlParameter("@filepath", SqlDbType.NVarChar, 200);
                sp[1].Value = Server.HtmlEncode(saveLocation);

                sp[2] = new SqlParameter("@Order", SqlDbType.Int);
                sp[2].Value = Server.HtmlEncode(ddl_order.SelectedValue);    

                sp[3] = new SqlParameter("@event_id", SqlDbType.Int);
                sp[3].Value = Convert.ToInt32(lbl_Id.Text);


                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Your Flash Update Successfully')", true);

                ClearMy();
                
                
            }
            else
            {
                //generateId();

                try
                    {
                        
                        int event_id = op.generate_id_sql("SELECT ISNULL(MAX(event_id),0) FROM TBL_SCD_FLASH");
                        string str_insert = @"INSERT INTO [TBL_SCD_FLASH]([event_id],[event_caption],[filepath],[Order],SHOW_FLASH)
                        VALUES (@event_id,@event_caption,@filepath,@Order,'YES')";

                        sp = new SqlParameter[4];

                        sp[0] = new SqlParameter("@event_id", SqlDbType.Int);
                        sp[0].Value = Convert.ToInt32(event_id);

                        sp[1] = new SqlParameter("@event_caption", SqlDbType.NVarChar, 100);
                        sp[1].Value = Server.HtmlEncode(txt_name.Text);

                        sp[2] = new SqlParameter("@Order", SqlDbType.Int);
                        sp[2].Value = Server.HtmlEncode(ddl_order.SelectedValue);  

                        sp[3] = new SqlParameter("@filepath", SqlDbType.NVarChar, 100);
                        sp[3].Value = Server.HtmlEncode(saveLocation);     



                        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Your Flash Insert Successfully')", true);

                        ClearMy();

                    }
                    catch (Exception ee)
                    {

                    }
                    //WebLog.SqlOperation().Update_log("A New Notice Inserted in Latest_update Gallery", DateTime.Now.ToString(), Session["AdminDetails"].ToString(), "Insert", "index.aspx");
                }
                #endregion
            }
            
        }

    protected void imgbtn_edit_Click(object sender, EventArgs e)
    {
        try
        {

            ImageButton btn_update = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btn_update.NamingContainer;
            string event_id = news_Grid.DataKeys[gvrow.RowIndex].Values["event_id"].ToString();
            string path = news_Grid.DataKeys[gvrow.RowIndex].Values["filepath"].ToString();

            lbl_Id.Text = event_id;
            txt_name.Text = gvrow.Cells[3].Text.ToString();
            ddl_order.SelectedValue = news_Grid.DataKeys[gvrow.RowIndex].Values["Order"].ToString();

            img_logo.ImageUrl = path;
            Label1.Text = path;
            chk_new.Visible = true;
            FileUpload1.Visible = false;
            img_logo.Visible = true;
            chk_new.Checked = false;
            


        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while edit news<br>" + ee.Message;
        }
    }
    protected void generateId()
    {
        lbl_Id.Text = op.generate_id_sql("SELECT ISNULL(MAX(event_id),0) FROM TBL_SCD_FLASH").ToString();
        
    }

    protected int validateThis()
    {
        if (txt_name.Text == "")
        {
            lblInfo.Text = "Error : Achiever Name Required";
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

    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string newsid = news_Grid.DataKeys[gvrow.RowIndex].Values["event_id"].ToString();
            string path = news_Grid.DataKeys[gvrow.RowIndex].Values["filepath"].ToString();

            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }

            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@event_id", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(newsid);

            string str_delete_news = "DELETE FROM TBL_SCD_FLASH WHERE event_id=@event_id";
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete_news, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Delete Data Successfully')", true);
            ClearMy();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete News<br>" + ee.Message;
        }
    }

    protected void ClearMy()
    {
        txt_name.Text = "";
        Label1.Text = "0";
        GetDetails();
        generateId();
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
    protected void btn_recent_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_flash.aspx");
    }
    
    
}
