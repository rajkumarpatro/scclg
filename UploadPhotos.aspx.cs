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



public partial class photo_upload : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    sql_operations sql_op = new sql_operations();

    static string p_id;

    static int dynamic_photo_id;
    string saveLocation;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          

            if (p_id == null)
            {
                p_id = Request.QueryString["p_id"];
            }

            generate_image_id();
            fill_image_grid();
        }
    }

    protected void fill_image_grid()
    {
        try
        {
            DataTable dt_image = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=" + p_id + "");

            gw_pics.DataSource = dt_image;
            gw_pics.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in fill_image_grid<br>" + ee.Message;
        }
    }

    protected void generate_image_id()
    {
            try
            {
                string str = "select IIf(max(PHOTO_ID) Is Null,0,max(PHOTO_ID))+1 from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=" + p_id + "";
                object obj = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str);
                //lbl_Id.Text = (sql_op.generate_id_sql(str)).ToString();
                lbl_photo_id.Text = "" + obj;


                dynamic_photo_id = Convert.ToInt32(lbl_photo_id.Text);
            }
            catch (Exception ee)
            {
                lblInfo.Text = "Problem in generating image id<br>" + ee.Message;
            }
    }

    protected void gw_pics_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gw_pics.SelectedRow;

        p_id = row.Cells[1].Text;
        lbl_photo_id.Text = row.Cells[2].Text;

        img_preview.Visible = true;
        img_preview.ImageUrl = row.Cells[3].Text;
        img_preview.Height = 100;
        img_preview.Width = 150;
        AjaxFileUpload1.Visible = false;

        btn_Save.Visible = false;
       

    }
    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        fill_image_grid();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("UploadPhotos.aspx?p_id="+p_id);
    }
    protected void imgbtn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string photoid = gw_pics.DataKeys[gvrow.RowIndex].Values["PHOTO_ID"].ToString();

            string str_eventid = gw_pics.DataKeys[gvrow.RowIndex].Values["SUB_TOPIC_ID"].ToString();

            sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(str_eventid);

            sp[1] = new SqlParameter("@PHOTO_ID", SqlDbType.Int);
            sp[1].Value = Convert.ToInt32(photoid);

            string str_photosdelete = "select PHOTO_PATH from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID and PHOTO_ID=@PHOTO_ID";
            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_photosdelete, sp);

            for (int i = 0; i < dt_photos.Rows.Count; i++)
            {
                if (dt_photos.Rows[i]["PHOTO_PATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_photos.Rows[i]["PHOTO_PATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }

            SqlParameter[] sp1 = new SqlParameter[2];
            sp1[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(str_eventid);

            sp1[1] = new SqlParameter("@PHOTO_ID", SqlDbType.Int);
            sp1[1].Value = Convert.ToInt32(photoid);


            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID and PHOTO_ID=@PHOTO_ID", sp1);

            fill_image_grid();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete image";
        }
    }

    protected void img_del_all_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string str_eventdelete = "select PHOTO_PATH from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=" + p_id + "";
            DataTable dt_event = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_eventdelete);

            for (int i = 0; i < dt_event.Rows.Count; i++)
            {
                if (dt_event.Rows[i]["PHOTO_PATH"].ToString() != "")
                {
                    string path = Server.MapPath(dt_event.Rows[i]["PHOTO_PATH"].ToString());
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }
                
           
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "delete from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=" + p_id +"");
            Response.Redirect("UploadPhotos.aspx?p_id=" + p_id);
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete image";
        }
    }
    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        try
        {
            string picext = System.IO.Path.GetExtension(e.FileName);
            if (picext == ".jpg" || picext == ".jpeg" || picext == ".png")
            {
                saveLocation = Server.MapPath("alldocuments/" + p_id.ToString() + "_" + lbl_photo_id.Text + picext);

                Stream strm = e.GetStreamContents();
                var targetFile = saveLocation;

                sql_op.GenerateThumbnails(0.5, strm, targetFile);

                saveLocation = "alldocuments/" + p_id.ToString() + "_" + lbl_photo_id.Text + picext;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Incorrect Input File')", true);
            }
            
            
           

            DataTable dt_check = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select SUB_TOPIC_ID from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=" + p_id + " and PHOTO_ID=" + dynamic_photo_id + "");

            if (dt_check.Rows.Count > 0 && dt_check.Rows[0][0].ToString() != "")
            {
                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "update TBL_COLLEGE_PAGE_PHOTOS set PHOTO_PATH='" + saveLocation.ToString() + "' where SUB_TOPIC_ID=" + p_id + " and PHOTO_ID=" + dynamic_photo_id + "");
            }
            else
            {
                SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, "insert into TBL_COLLEGE_PAGE_PHOTOS values(" + p_id + "," + dynamic_photo_id + ",'" + saveLocation.ToString() + "')");
            }

            generate_image_id();


        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in adding image<br>" + ee.Message;
        }
    }
    protected void btn_ok_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("UploadPhotos.aspx?p_id=" + p_id);
        p_id = null;
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "script", "window.close();", true);
    }
    
}
