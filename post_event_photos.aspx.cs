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



public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    string saveLocation;
    int Id, update_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            generateId();
            try
            {
                if (Session["ResultAdminUser"] == null)
                {
                    Response.Redirect("SCDURG-Result.aspx");
                }
            }
            catch
            {
                Response.Redirect("SCDURG-Result.aspx");
            }
        }
    }
    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            if (Label1.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = picname;
                int namelength;
                namelength = picname.Length;
                int index = picname.IndexOf(".");
                int sub_length = namelength - index;


                //picname = picname.Substring(0, namelength - 4);
                namelength = picname.Length;
                //picext = picext.Substring(namelength, 4);
                picext = picname.Substring(index, sub_length);
                picname = txt_name.Text.ToString();
                saveLocation = "events/flash" + lbl_Id.Text.ToString() + picext;
                FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
            }
            else
            {
                saveLocation = Label1.Text;
            }

            #region Process Save or Update
            OleDbDataAdapter adptExists = new OleDbDataAdapter("select * from tbl_home_events where event_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
            DataSet dsExists = new DataSet();
            adptExists.Fill(dsExists, "tblExists");
            if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
            {
                saveLocation = Label1.Text;
                conn.Open();
                OleDbCommand cmdupdate = new OleDbCommand("update tbl_home_events set event_caption=@pic_caption, filepath='" + saveLocation + "' where event_id=" + lbl_Id.Text + "", conn);
                cmdupdate.Parameters.AddWithValue("@pic_caption", txt_name.Text);
                cmdupdate.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A flesh photos Updated in flesh", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "index.aspx");    
                
                
            }
            else
            {
                //generateId();
                conn.Open();
                OleDbCommand cmdsave = new OleDbCommand("insert into tbl_home_events values(" + Convert.ToInt32(lbl_Id.Text) + ",@pic_caption,'" + saveLocation + "')", conn);
                cmdsave.Parameters.AddWithValue("@pic_caption", txt_name.Text);
                cmdsave.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A flesh photos inserted in flesh", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "index.aspx");    
                
            }
            Response.Redirect("post_event_photos.aspx");
            #endregion
        }
    }

    protected void generateId()
    {
        try
        {
            string str = "select max(event_id) from tbl_home_events";
            lbl_Id.Text = (sql_op.generate_id(str)).ToString();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in generateId "+ee.Message;
        }
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

    protected void news_Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GridViewRow row = news_Grid.SelectedRow;
            lbl_Id.Text = row.Cells[1].Text.ToString();
            txt_name.Text = row.Cells[2].Text.ToString();
            Label1.Text = row.Cells[3].Text.ToString();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in select " + ee.Message;
        }
    }
    
    protected void news_Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
    }

    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_event_photos.aspx");
    }
    protected void img_del_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            
            string str = "delete from tbl_home_events where event_id=" + lbl_Id.Text + "";
            sql_op.perform_sql_operation(str);
            WebLog.SqlOperation().Update_log("A flesh photos deleted from flesh", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "index.aspx");    
                
            Response.Redirect("post_event_photos.aspx");
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error on delete record<br>" + ee.Message;
        }
    }
}
