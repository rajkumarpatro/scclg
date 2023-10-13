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
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    generateId();
                    txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    GetRecords("");
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {

            if (Label1.Text == "0")
            {
                string picname = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string picext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                saveLocation = "newsData" + "/D" + lbl_Id.Text.ToString() + picext;
                FileUpload1.PostedFile.SaveAs(MapPath(saveLocation));
                Label1.Text = saveLocation.ToString();
            }

            try
            {
                #region Process Save or Update
                OleDbDataAdapter adptExists = new OleDbDataAdapter("select * from downloads where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
                DataSet dsExists = new DataSet();
                adptExists.Fill(dsExists, "tblExists");
                if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
                {
                    conn.Open();
                    OleDbCommand cmd_update = new OleDbCommand("update downloads set D_date='" + txtDisplayDate.Text + "',Description=@description,filepath='" + Label1.Text + "',D_page='" + ddl_page.Text + "' where D_id=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
                    cmd_update.Parameters.AddWithValue("@description", txt_Description.Text);
                    cmd_update.ExecuteNonQuery();
                    conn.Close();

                    //WebLog.SqlOperation().Update_log(ddl_page.Text + " section updated in student section", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "Student_section.aspx?title=" + ddl_page.Text);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Updated Successfully')", true);
                    ClearMyPage();
                }
                else
                {
                    conn.Open();
                    OleDbCommand cmd_insert = new OleDbCommand("insert into downloads values(" + Convert.ToInt32(lbl_Id.Text) + ",'" + txtDisplayDate.Text + "',@description,'" + Label1.Text + "','" + ddl_page.Text + "')", conn);
                    cmd_insert.Parameters.AddWithValue("@description", txt_Description.Text);
                    cmd_insert.ExecuteNonQuery();
                    conn.Close();
                    //WebLog.SqlOperation().Update_log(ddl_page.Text + " section inserted in student section", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "Student_section.aspx?title=" + ddl_page.Text);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Saved Successfully')", true);
                    ClearMyPage();
                }
                
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
        OleDbDataAdapter adptCheck = new OleDbDataAdapter("select max(D_id) from downloads", conn);
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

    protected void chk_new_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_new.Checked == true)
        {
            chk_new.Visible = false;
            FileUpload1.Visible = true;
            Label1.Text = "0";
        }
    }
    protected void btn_Reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_studentsection.aspx");
    }

    protected void btn_Menu_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

    protected void btn_delete_selected_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvrow in news_Grid.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("chk_select");
            if (chk.Checked)
            {
                int id = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString());
                string path = Server.MapPath(news_Grid.DataKeys[gvrow.RowIndex].Values["filepath"].ToString());

                FileInfo file = new FileInfo(path);
                if (file.Exists)//check file exsit or not
                {
                    file.Delete();
                }

                OleDbDataAdapter adpt_delete = new OleDbDataAdapter("delete from downloads  where D_id=" + id + " ", conn);
                DataSet ds_delete = new DataSet();
                adpt_delete.Fill(ds_delete,"tbl_delete");
            }
        }

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Selected Records Deleted Successfully')", true);

        ClearMyPage();
    }
    

    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_Id.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString();
            string path = news_Grid.DataKeys[gvrow.RowIndex].Values["filepath"].ToString();
            Label1.Text = path;
            chk_new.Visible = true;
            FileUpload1.Visible = false;
            txtDisplayDate.Text = gvrow.Cells[1].Text.ToString();
            txt_Description.Text = gvrow.Cells[2].Text.ToString();
            ddl_page.SelectedItem.Text= gvrow.Cells[3].Text.ToString();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Edit " + ee.Message + "')", true);
        }
    }

    protected void GetRecords(string str_where)
    {
        try
        {
            if (str_where != "")
            {
                str_where = " where D_page='"+str_where+"'";
            }

            OleDbDataAdapter adptrecord = new OleDbDataAdapter("SELECT [D_id], [D_date], [Description],D_page, [filepath] FROM [downloads] "+str_where+" order by D_page, D_id desc", conn);
            DataSet dsrecords = new DataSet();
            adptrecord.Fill(dsrecords, "tbl_records");

            news_Grid.DataSource = dsrecords.Tables["tbl_records"];
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "error : " + ee.Message;
        }
    }
    protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            int id = Convert.ToInt32(news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString());
            string path = Server.MapPath(news_Grid.DataKeys[gvrow.RowIndex].Values["filepath"].ToString());

            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }

            OleDbDataAdapter adpt_delete = new OleDbDataAdapter("delete from downloads  where D_id=" + id + " ", conn);
            DataSet ds_delete = new DataSet();
            adpt_delete.Fill(ds_delete, "tbl_delete");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Deleted Successfully')", true);
            ClearMyPage();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Delete " + ee.Message + "')", true);
        }
    }

    protected void ClearMyPage()
    {
        generateId();
        txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        txt_Description.Text = "";
        GetRecords(ddl_page.SelectedItem.Text);
        Label1.Text = "0";
    }

    protected void ddl_page_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetRecords(ddl_page.SelectedItem.Text);
    }
}
