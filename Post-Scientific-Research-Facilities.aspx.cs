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
using System.IO;

public partial class update_news : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    string saveLocation,displayDate;
    int Id;

    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            try
            {
                if (Session["iamuser"]==null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    generateId();
                    FillGrid();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    protected void FillGrid()
    {
        try
        {
            DataTable dt_data = new DataTable();
            dt_data = op.get_datatable("SELECT [D_id] as [ID], [D_name] as [Name], [Description], [filepath] FROM [tbl_scientific_instruments] order by D_id desc");
            news_Grid.DataSource = dt_data;
            news_Grid.DataBind();

        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error While Fill Grid<br>"+ee.Message;
        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {

            if (lbl_pic.Text == "0")
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
                picname = txt_name.Text;
                saveLocation = Server.MapPath("newsData/Scientific-Research-Facilities-" + lbl_Id.Text.ToString() + picext);
                //FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));

                Stream strm = FileUpload1.PostedFile.InputStream;
                var targetFile = saveLocation;
                //Based on scalefactor image size will vary
                op.GenerateFixedSizeImage(700, 480, strm, targetFile);

                saveLocation = "newsData/Scientific-Research-Facilities-" + lbl_Id.Text.ToString() + picext;
                lbl_pic.Text = saveLocation;
            }

                try
                {
                    #region Process Save or Update
                    OleDbDataAdapter adptExists = new OleDbDataAdapter("select * from tbl_scientific_instruments where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
                    DataSet dsExists = new DataSet();
                    adptExists.Fill(dsExists, "tblExists");
                    if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
                    {
                        conn.Open();
                        OleDbCommand cmd_update = new OleDbCommand("update tbl_scientific_instruments set D_name='" + txt_name.Text + "',Description=@description,filepath='" + lbl_pic.Text + "' where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
                        cmd_update.Parameters.AddWithValue("@description",txt_Description.Text);
                        cmd_update.ExecuteNonQuery();
                        conn.Close();
                        WebLog.SqlOperation().Update_log(txt_name.Text + " Details Updated in Scientific Research Facilities", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "index.aspx");
                  
                    }
                    else
                    {
                        conn.Open();
                        OleDbCommand cmd_insert = new OleDbCommand("insert into tbl_scientific_instruments values(" + Convert.ToInt32(lbl_Id.Text) + ",'" + txt_name.Text + "',@description,'" + lbl_pic.Text + "')", conn);
                        cmd_insert.Parameters.AddWithValue("@description", txt_Description.Text);
                        cmd_insert.ExecuteNonQuery();
                        conn.Close();
                        WebLog.SqlOperation().Update_log(txt_name.Text + " Details Added in Scientific Research Facilities", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "index.aspx");
                               
                    }
                    Response.Redirect("Post-Scientific-Research-Facilities.aspx");
                    #endregion
                }
                catch (Exception ee)
                {
                    lblInfo.Text = "Error in Save or update<br>" + ee.Message;
                }
        }
    }

    protected void generateId()
    {
        OleDbDataAdapter adptCheck = new OleDbDataAdapter("select max(D_id) from tbl_scientific_instruments", conn);
        DataSet dsCheck = new DataSet();
        adptCheck.Fill(dsCheck, "tblCheck");

        if (dsCheck.Tables["tblCheck"].Rows[0][0].ToString() == "")
        {
            Id = 1;
            lbl_Id.Text = Id.ToString();
        }
        else
        {
            Id = Convert.ToInt32(dsCheck.Tables["tblCheck"].Rows[0][0]) + 1;
            lbl_Id.Text = Id.ToString();
        }
    }

    protected int validateThis()
    {
        if (lbl_Id.Text == "")
        {
            lblInfo.Text = "Error : ID can not be empty";
            return (0);
        }
        else if (txt_name.Text == "")
        {
            lblInfo.Text = "Error : Name Required";
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

    protected void news_Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = news_Grid.SelectedRow;
        lbl_Id.Text = row.Cells[1].Text.ToString();
        txt_name.Text = row.Cells[2].Text.ToString();
        txt_Description.Text = row.Cells[3].Text.ToString();
        lbl_pic.Text = row.Cells[4].Text.ToString();

        chk_new.Visible = true;
        FileUpload1.Visible = false;
    }
    protected void rbFile_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void rbLink_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void news_Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)news_Grid.Rows[e.RowIndex];
        OleDbDataAdapter adpt_delete= new OleDbDataAdapter("delete from tbl_scientific_instruments where D_id=" + Convert.ToInt32(row.Cells[1].Text) + "", conn);
        DataSet ds_delete = new DataSet();
        adpt_delete.Fill(ds_delete,"tbl_delete");
        WebLog.SqlOperation().Update_log(txt_name.Text + " Details Deleted in Scientific Research Facilities", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "index.html");
       
        Response.Redirect("Post-Scientific-Research-Facilities.aspx");
    }

    protected void check_rb()
    {
        
    }
    protected void rbNot_CheckedChanged(object sender, EventArgs e)
    {
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            lbl_pic.Text = "0";
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Scientific-Research-Facilities.aspx");
    }
    protected void img_del_Click(object sender, ImageClickEventArgs e)
    {
        string str_query = "delete from tbl_scientific_instruments where D_id=" + lbl_Id.Text + "";

        op.perform_sql_operation(str_query);
        WebLog.SqlOperation().Update_log(txt_name.Text + " Details Deleted in Scientific Research Facilities", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "index.html");

        Response.Redirect("Post-Scientific-Research-Facilities.aspx");
    }

    

    
}
