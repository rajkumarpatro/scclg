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



public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    string saveLocation;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            try
            {
                if (Session["ResultAdminUser"] ==null)
                {
                    Response.Redirect("scdurg-result.aspx");
                }
                else
                {
                    GetData();
                    GenerateAttachmentID();
                }
            }
            catch
            {
                Response.Redirect("scdurg-result.aspx");
            }
        }
    }

    protected void GetData()
    {
        try
        {
            OleDbDataAdapter adpt_fill = new OleDbDataAdapter("SELECT event_description FROM [tbl_educational_program] where event_page='"+ddl_page.Text+"'", conn);
            DataSet ds_fill = new DataSet();
            adpt_fill.Fill(ds_fill, "tbl_fill");

            if (ds_fill.Tables["tbl_fill"].Rows.Count > 0)
            {
                txt_description.Content = ds_fill.Tables["tbl_fill"].Rows[0]["event_description"].ToString();
            }
        }
        catch (Exception ee)
        {

        }
    }


    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        #region Process Save or Update

        conn.Open();
        OleDbCommand cmdupdate = new OleDbCommand("update tbl_educational_program set event_description=@description where event_page='" + ddl_page.Text + "'", conn);
        cmdupdate.Parameters.AddWithValue("@description", txt_description.Content);
        cmdupdate.ExecuteNonQuery();
        conn.Close();
        //WebLog.SqlOperation().Update_log(ddl_page.Text + " Section Updated in Educational Program", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "Educational-Program.aspx?dp=" + ddl_page.Text);
  
        ddl_page.Text = "Select Page";
        txt_description.Content = "";
        ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"","alert('Details Saved Successfully')",true);
        #endregion
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Educational-Program.aspx");
    }
    

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }
    protected void ddl_page_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetData();
        FillGrid();
    }

    protected void GenerateAttachmentID()
    {
        try
        {
            lbl_Id.Text = sql_op.generate_id("select max(file_id) from tbl_educational_file").ToString();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while generating Attachment ID<br>"+ee.Message;
        }
    }

    protected void img_add_Click(object sender, ImageClickEventArgs e)
    {
        if (ddl_page.Text == "Select Page")
        {
            lblInfo.Text = "Error : Please select page";
            ddl_page.Focus();
        }
        if (ddl_session.Text == "Select Session")
        {
            lblInfo.Text = "Error : Please select session";
            ddl_session.Focus();
        }
        else if (txt_details.Text == "")
        {
            lblInfo.Text = "Error : Please Enter Details";
            txt_details.Focus();
        }
        else if (!FileUpload1.HasFile && lbl_attachment.Text == "0")
        {
            lblInfo.Text = "Error : File Required";
        }
        else
        {
            if (lbl_attachment.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                saveLocation = "Syllabus/" + lbl_Id.Text.ToString() + picext;
                FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
            }
            else
            {
                saveLocation = lbl_attachment.Text;
            }

            #region Process Save or Update
            OleDbDataAdapter adptExists = new OleDbDataAdapter("select file_id from tbl_educational_file where file_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
            DataSet dsExists = new DataSet();
            adptExists.Fill(dsExists, "tblExists");
            if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
            {
                conn.Open();
                OleDbCommand cmdupdate = new OleDbCommand("update tbl_educational_file set file_session='"+ddl_session.SelectedItem.Text+"',file_details=@file_details, file_path='" + saveLocation + "' where file_id=" + lbl_Id.Text + "", conn);
                cmdupdate.Parameters.AddWithValue("@file_details", txt_details.Text);
                cmdupdate.ExecuteNonQuery();
                conn.Close();

                //WebLog.SqlOperation().Update_log("" + txt_details.Text + ": Attachment Uodated in  " + ddl_page.Text + " Program", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "Educational-Program.aspx?dp=" + ddl_page.Text + "");
            }
            else
            {
                //generateId();
                conn.Open();
                OleDbCommand cmdsave = new OleDbCommand("insert into tbl_educational_file values(" + Convert.ToInt32(lbl_Id.Text) + ",'" + Server.HtmlEncode(ddl_page.Text) + "',@file_details,'" + saveLocation + "','" + ddl_session.SelectedItem.Text + "')", conn);
                cmdsave.Parameters.AddWithValue("@file_details", txt_details.Text);
                cmdsave.ExecuteNonQuery();
                conn.Close();

                //WebLog.SqlOperation().Update_log("" + txt_details.Text + ": Attachment Added in  " + ddl_page.Text + " Program", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "Educational-Program.aspx?dp=" + ddl_page.Text + "");
            }

            GenerateAttachmentID();
            txt_details.Text = "";
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            lbl_attachment.Text = "0";
            chk_new.Checked = false;
            FillGrid();
            #endregion
        }
    }
    protected void img_del_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string path = Server.MapPath(lbl_attachment.Text);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }

            string str = "delete from tbl_educational_file where file_id=" + lbl_Id.Text + "";
            sql_op.perform_sql_operation(str);

            //WebLog.SqlOperation().Update_log("" + txt_details.Text + ": Attachment Deleted from  " + ddl_page.Text + " Program", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "Educational-Program.aspx?dp="+ddl_page.Text+"");

            GenerateAttachmentID();
            txt_details.Text = "";
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            lbl_attachment.Text = "0";
            FillGrid();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error on delete record<br>" + ee.Message;
        }
    }

    protected void FillGrid()
    {
        try
        {
            string str_query = "select file_id as [ID], file_details as [Details],file_path as [Path], file_session as [Session] from tbl_educational_file where event_page='" + ddl_page.Text+"'";
            DataTable dt_data = sql_op.get_datatable(str_query);

            gv_record.DataSource = dt_data;
            gv_record.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error while getting attachment record<br>"+ee.Message;
        }
    }
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            lbl_attachment.Text = "0";
        }
    }
    protected void gv_record_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gv_record.SelectedRow;
        lbl_Id.Text = row.Cells[1].Text.ToString();
        txt_details.Text = row.Cells[2].Text.ToString();

        lbl_attachment.Text = row.Cells[3].Text.ToString();
        ddl_session.Text = row.Cells[4].Text.ToString();
        chk_new.Visible = true;
        FileUpload1.Visible = false;
    }
    protected void delete_Click(object sender, ImageClickEventArgs e)
    {
        string str = "delete from tbl_educational_file";
        sql_op.perform_sql_operation(str);
    }
}
