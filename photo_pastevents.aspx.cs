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


using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;



public partial class photo_upload : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);

    sql_operations sql_op = new sql_operations();

    static string p_id;

    static int dynamic_photo_id;
    string saveLocation;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            img_del.Visible = false;
            img_del_all.Visible = false;

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
            OleDbDataAdapter adpt_image = new OleDbDataAdapter("select * from tbl_past_photos where event_id=" + p_id + "", conn);
            DataSet ds_image = new DataSet();
            adpt_image.Fill(ds_image, "tbl_image");

            gw_pics.DataSource = ds_image.Tables["tbl_image"];
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
                string str = "select max(Photo_id) from tbl_past_photos where event_id=" + p_id + "";
                lbl_photo_id.Text = (sql_op.generate_id(str)).ToString();

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
        img_del.Visible = true;
        img_del_all.Visible = true;

    }
    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        fill_image_grid();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("photo_pastevents.aspx?p_id="+p_id);
    }
    protected void img_del_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            OleDbDataAdapter adpt_delete = new OleDbDataAdapter("delete from tbl_past_photos where event_id=" + p_id + " and Photo_id=" + lbl_photo_id.Text + "", conn);
            DataSet ds_delete = new DataSet();
            adpt_delete.Fill(ds_delete, "tbl_delete");
            Response.Redirect("photo_pastevents.aspx?p_id=" + p_id);
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
                
            string str_del="delete from tbl_past_photos where event_id=" + p_id;
            sql_op.perform_sql_operation(str_del);
            Response.Redirect("photo_pastevents.aspx?p_id=" + p_id);
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
            string picname = System.IO.Path.GetFileName(e.FileName);
            string picext = System.IO.Path.GetExtension(e.FileName);

            picname = dynamic_photo_id.ToString();
            saveLocation = "events/" + lbl_photo_id.Text + "_" + p_id.ToString() + picext;

            saveLocation = Server.MapPath("events/" + lbl_photo_id.Text + "_" + p_id.ToString() + picext);
            //AjaxFileUpload1.SaveAs(MapPath(saveLocation));

            //Stream strm = FileUpload1.PostedFile.InputStream;
            Stream strm = e.GetStreamContents();
            var targetFile = saveLocation;

            sql_op.GenerateThumbnails(0.5, strm, targetFile);

            saveLocation = "events/" + lbl_photo_id.Text + "_" + p_id.ToString() + picext;

            OleDbDataAdapter adpt_check = new OleDbDataAdapter("select event_id from tbl_past_photos where event_id=" + p_id + " and photo_id=" + dynamic_photo_id + "", conn);
            DataSet ds_check = new DataSet();
            adpt_check.Fill(ds_check, "tbl_check");

            if (ds_check.Tables["tbl_check"].Rows.Count > 0 && ds_check.Tables["tbl_check"].Rows[0][0].ToString() != "")
            {
                OleDbDataAdapter adpt_image = new OleDbDataAdapter("update tbl_past_photos set filepath='" + saveLocation.ToString() + "' where event_id=" + p_id + " and Photo_id=" + dynamic_photo_id + "", conn);
                DataSet ds_image = new DataSet();
                adpt_image.Fill(ds_image, "tbl_image");
            }
            else
            {
                OleDbDataAdapter adpt_image = new OleDbDataAdapter("insert into tbl_past_photos values(" + p_id + "," + dynamic_photo_id + ",'" + saveLocation.ToString() + "')", conn);
                DataSet ds_image = new DataSet();
                adpt_image.Fill(ds_image, "tbl_image");
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
        //Response.Redirect("photo_pastevents.aspx?p_id=" + p_id);
        p_id = null;
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "script", "window.close();", true);
    }
    
}
