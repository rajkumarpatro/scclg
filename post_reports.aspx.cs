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
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    string saveLocation,displayDate;
    int Id;

    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            generateId();
            txtDisplayDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            try
            {
                if (Session["iamuser"]==null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    
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
                    picname = lbl_Id.Text.ToString();
                    saveLocation = "newsData" + "/Report" + lbl_Id.Text.ToString() + picext;
                    FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                    Label1.Text = saveLocation.ToString();
                }

                try
                {
                    #region Process Save or Update
                    OleDbDataAdapter adptExists = new OleDbDataAdapter("select * from tbl_reports where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
                    DataSet dsExists = new DataSet();
                    adptExists.Fill(dsExists, "tblExists");
                    if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
                    {
                        conn.Open();
                        OleDbCommand cmd_update = new OleDbCommand("update tbl_reports set D_date='" + txtDisplayDate.Text + "',Description=@description,filepath='" + Label1.Text + "',D_page='"+ddl_page.Text+"' where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
                        cmd_update.Parameters.AddWithValue("@description",txt_Description.Text);
                        cmd_update.ExecuteNonQuery();
                        conn.Close();
                        WebLog.SqlOperation().Update_log(ddl_page.Text + " section updated in Reports", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "Reports.aspx?title=" + ddl_page.Text);
                  
                    }
                    else
                    {
                        conn.Open();
                        OleDbCommand cmd_insert = new OleDbCommand("insert into tbl_reports values(" + Convert.ToInt32(lbl_Id.Text) + ",'" + txtDisplayDate.Text + "',@description,'" + Label1.Text + "','" + ddl_page.Text + "')", conn);
                        cmd_insert.Parameters.AddWithValue("@description", txt_Description.Text);
                        cmd_insert.ExecuteNonQuery();
                        conn.Close();
                        WebLog.SqlOperation().Update_log(ddl_page.Text + " section inserted in Reports", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "Reports.aspx?title=" + ddl_page.Text);
                               
                    }
                    Response.Redirect("post_reports.aspx");
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
        OleDbDataAdapter adptCheck = new OleDbDataAdapter("select max(D_id) from tbl_reports", conn);
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
        txtDisplayDate.Text = row.Cells[2].Text.ToString();
        txt_Description.Text = row.Cells[3].Text.ToString();
        ddl_page.Text = row.Cells[4].Text.ToString();
        Label1.Text = row.Cells[5].Text.ToString();

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
        OleDbDataAdapter adpt_delete= new OleDbDataAdapter("delete from tbl_reports where D_id=" + Convert.ToInt32(row.Cells[1].Text) + "", conn);
        DataSet ds_delete = new DataSet();
        adpt_delete.Fill(ds_delete,"tbl_delete");
        WebLog.SqlOperation().Update_log(ddl_page.Text + " section deleted in Reports", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "Reports.aspx?title=" + ddl_page.Text);
       
        Response.Redirect("post_reports.aspx");
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
            Label1.Text = "0";
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_reports.aspx");
    }
    protected void img_del_Click(object sender, ImageClickEventArgs e)
    {
        string str_query = "delete from tbl_reports where D_id=" + lbl_Id.Text + "";

        op.perform_sql_operation(str_query);

        Response.Redirect("post_reports.aspx");
    }

    

    
}
