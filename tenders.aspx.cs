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
    string saveLocation, myUrl, linkType, displayDate;
    int Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            generateId();
            rbNot.Checked = true;
            check_rb();
            txt_date_from.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txt_date_to.Text = DateTime.Now.ToString("dd/MM/yyyy");
            try
            {
                if (Session["iamuser"].ToString() == "")
                {
                    Response.Redirect("CLogin.aspx");
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
            if (rbFile.Checked == true)
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
                    picname = txt_date_to.Text.ToString();
                    saveLocation = "newsData" + "/Tender" + lbl_Id.Text.ToString() + picext;
                    FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                    
                }
                    myUrl = "#";
                    linkType = "File";
            }
            else if (rbURL.Checked == true)
            {
                String check_str;

                check_str = txtURL.Text.Substring(0, 7);
                if (check_str == "http://")
                {
                    myUrl = txtURL.Text;
                }
                else
                {
                    myUrl = "http://" + txtURL.Text;
                }
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
            OleDbDataAdapter adptExists = new OleDbDataAdapter("select * from tbl_tenders where news_Id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
            DataSet dsExists = new DataSet();
            adptExists.Fill(dsExists, "tblExists");
            if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
            {
                conn.Open();
                OleDbCommand cmd_update = new OleDbCommand("update tbl_tenders set news_Date_From='" + txt_date_from.Text + "',news_Date_To='" + txt_date_to.Text + "',news_Description=@description,news_filepath='" + saveLocation + "',news_Link='" + myUrl + "',news_LinkType='" + linkType + "' where news_Id=" + Convert.ToInt32(lbl_Id.Text) + "", conn);
                cmd_update.Parameters.AddWithValue("@description", txt_Description.Text);
                cmd_update.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A tender updated in tender & notice", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "index.aspx");
              }
            else
            {
                conn.Open();
                OleDbCommand cmd_insert = new OleDbCommand("insert into tbl_tenders values(" + Convert.ToInt32(lbl_Id.Text) + ",'" + txt_date_from.Text + "','"+txt_date_to.Text+"',@description,'" + saveLocation + "','" + myUrl.ToString() + "','" + linkType + "')", conn);
                cmd_insert.Parameters.AddWithValue("@description", txt_Description.Text);
                cmd_insert.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A new tender inserted in tender & notice", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "index.aspx");
       
            }
            Response.Redirect("tenders.aspx");
            #endregion
        }
        else
        {
        }
    }

    protected void generateId()
    {
        OleDbDataAdapter adptCheck = new OleDbDataAdapter("select max(news_Id) from tbl_tenders", conn);
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
        if (txt_date_from.Text == "")
        {
            lblInfo.Text = "Error : Start Date Required";
            return (0);
        }
        else if (txt_date_to.Text == "")
        {
            lblInfo.Text = "Error : Last Date Required";
            return (0);
        }
        else if (txt_Description.Text == "")
        {
            lblInfo.Text = "Error : Description Required";
            return (0);
        }
        else if (rbURL.Checked == false && rbFile.Checked == false && rbNot.Checked == false)
        {
            lblInfo.Text = "Error : Link Required (Note: If File And URL Not Required Then Please Select Not Applicable)";
            return (0);
        }
        else if (rbFile.Checked == true && !FileUpload1.HasFile && Label1.Text == "0")
        {
                lblInfo.Text = "Error : File Required";
                return (0);
        }
        else if (rbURL.Checked == true && txtURL.Text == "")
        {
            lblInfo.Text = "Error : URL Required";
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
        txt_date_from.Text = row.Cells[2].Text.ToString();
        txt_date_to.Text = row.Cells[3].Text.ToString();
        txt_Description.Text = row.Cells[4].Text.ToString();

        if (row.Cells[7].Text.ToString() == "URL")
        {
            lblFilePath.Visible = false;
            FileUpload1.Visible = false;
            lblUrl.Visible = true;

            txtURL.Visible = true;
            rbNot.Checked = false;
            rbFile.Checked = false;

            txtURL.Text=row.Cells[6].Text.ToString();
        }
        else if (row.Cells[7].Text.ToString() == "File")
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

            Label1.Text = row.Cells[5].Text.ToString();
        }
        else if (row.Cells[7].Text.ToString() == "#")
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
    protected void rbFile_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    protected void rbLink_CheckedChanged(object sender, EventArgs e)
    {
        check_rb();
    }
    protected void news_Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)news_Grid.Rows[e.RowIndex];
        OleDbDataAdapter adpt_delete= new OleDbDataAdapter("delete from tbl_tenders where news_Id=" + Convert.ToInt32(row.Cells[1].Text) + "", conn);
        DataSet ds_delete = new DataSet();
        adpt_delete.Fill(ds_delete,"tbl_delete");
        WebLog.SqlOperation().Update_log("A tender deleted from tender & notice", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "index.aspx");
       
        Response.Redirect("tenders.aspx");
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
}
