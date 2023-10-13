using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class Post_Upcoming_Events : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    int Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["iamuser"] == null)
            {
                Response.Redirect("CLogin.aspx");
            }
            else
            {
                generateId();
                txtDisplayDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }
    }
    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            #region Process Save or Update
            OleDbDataAdapter adptExists = new OleDbDataAdapter("select * from tbl_upcoming_events where ID=" + Convert.ToInt32(lbl_Id.Text) + " ", conn);
            DataSet dsExists = new DataSet();
            adptExists.Fill(dsExists, "tblExists");
            if (dsExists != null && dsExists.Tables.Count > 0 && dsExists.Tables["tblExists"].Rows.Count > 0)
            {
                conn.Open();
                OleDbCommand cmd_update = new OleDbCommand("update tbl_upcoming_events set Event_date='" + txtDisplayDate.Text + "',Event_Title=@title where ID=" + Convert.ToInt32(lbl_Id.Text) + "", conn);
                cmd_update.Parameters.AddWithValue("@title", txt_News_Title.Text);
                cmd_update.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A event details updated in Upcoming Event", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Update", "index.aspx");
       
            }
            else
            {
                conn.Open();
                OleDbCommand cmd_insert = new OleDbCommand("insert into tbl_upcoming_events values(" + Convert.ToInt32(lbl_Id.Text) + ",'" + txtDisplayDate.Text + "',@title)", conn);
                cmd_insert.Parameters.AddWithValue("@title", txt_News_Title.Text);
                cmd_insert.ExecuteNonQuery();
                conn.Close();
                WebLog.SqlOperation().Update_log("A new event inserted in Upcoming Event", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Insert", "index.aspx");
       
            }
            Response.Redirect("Post_Upcoming_Events.aspx");
            #endregion
        }
        else
        {
        }
    }


    protected void generateId()
    {
        OleDbDataAdapter adptCheck = new OleDbDataAdapter("select max(Id) from tbl_upcoming_events", conn);
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
        if (txt_News_Title.Text == "")
        {
            lblInfo.Text = "Error : News Title Required";
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
    protected void news_Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = news_Grid.SelectedRow;
        lbl_Id.Text = row.Cells[1].Text.ToString();
        txtDisplayDate.Text = row.Cells[2].Text.ToString();
        txt_News_Title.Text = row.Cells[3].Text.ToString();
    }
    protected void news_Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)news_Grid.Rows[e.RowIndex];
        OleDbDataAdapter adpt_delete = new OleDbDataAdapter("delete from tbl_upcoming_events where Id=" + Convert.ToInt32(row.Cells[1].Text) + "", conn);
        DataSet ds_delete = new DataSet();
        adpt_delete.Fill(ds_delete, "tbl_delete");
        WebLog.SqlOperation().Update_log("A old event details Deleted from Upcoming Event", DateTime.Now.ToString(), Session["iamuser"].ToString(), "Delete", "index.aspx");
       
        Response.Redirect("Post_Upcoming_Events.aspx");
    }
}