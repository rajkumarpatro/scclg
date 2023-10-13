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
                if (Session["iamuser"].ToString() == "")
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    OleDbDataAdapter adpt_fill = new OleDbDataAdapter("SELECT [event_pic],event_description FROM [tbl_vision]", conn);
                    DataSet ds_fill = new DataSet();
                    adpt_fill.Fill(ds_fill, "tbl_fill");

                    txt_description.Content = ds_fill.Tables["tbl_fill"].Rows[0]["event_description"].ToString();
                    Label1.Text = ds_fill.Tables["tbl_fill"].Rows[0]["event_pic"].ToString(); 
                    FileUpload1.Visible = false;
                    chk_new.Visible = true;
                    img_intro.ImageUrl = ds_fill.Tables["tbl_fill"].Rows[0]["event_pic"].ToString(); 
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
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
                picname = "introduction";
                saveLocation = Server.MapPath("newsData/vision" + picext);
                //FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));

                Stream strm = FileUpload1.PostedFile.InputStream;
                var targetFile = saveLocation;
                //Based on scalefactor image size will vary
                sql_op.GenerateThumbnails(0.5, strm, targetFile);

                saveLocation = "newsData/vision" + picext;

            }
            else
            {
                saveLocation = Label1.Text;
            }

            #region Process Save or Update

                conn.Open();
                OleDbCommand cmdupdate = new OleDbCommand("update tbl_vision set event_pic='" + saveLocation + "', event_description=@description", conn);
                cmdupdate.Parameters.AddWithValue("@description", txt_description.Content);
                cmdupdate.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A new vision Added in Vision Mission Page", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "Vision-Mission.aspx");
       
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Saved Successfully')", true);

                Response.Redirect("post_vision.aspx");
            #endregion
        }
    }

    

    
    protected int validateThis()
    {
        if (!FileUpload1.HasFile && Label1.Text == "0")
        {
            lblInfo.Text = "Error : File Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_vision.aspx");
    }
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            FileUpload1.Visible = true;
            chk_new.Visible = false;

            Label1.Text = "0";
        }
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}
