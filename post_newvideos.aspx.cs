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
using System.Data.SqlClient;
using System.IO;

public partial class post_newvideos : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("science_login.aspx");
                }
                else
                {
                    txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    ClearMyPage();
                }

            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }
    protected void ClearMyPage()
    {
       
        txtDisplayDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        txt_Description.Text = "";
        txt_url.Text = "";
        lbl_Id.Text = "";
        GetVideoDetails();
        
    }

    protected void GetVideoDetails()
    {
        try
        {
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [D_id],CONVERT(VARCHAR(10),D_date,105) AS D_date,[Description],[URL],[D_page] FROM [dbo].[TBL_VIDEO] where D_page='NAAC' order by D_id desc");

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {

        }
    }


    protected int validateThis()
    {
        if (txt_Description.Text == "")
        {
            lblInfo.Text = "Error : Description Required";
            return (0);
        }
        else
        {
            return (1);
        }
    }  
    protected void btn_login_Click(object sender, EventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {

            string str_filepath = txt_url.Text.Replace("watch?v=", "embed/");

            try
            {
                #region Process Save or Update


                if (lbl_Id.Text != "")
                {
                    string str_update = @"update [dbo].[tbl_video] set D_date=@D_date,Description=@Description,URL=@URL where D_id=@D_id";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@D_date", SqlDbType.DateTime);
                    sp[0].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[1] = new SqlParameter("@Description", SqlDbType.NVarChar, -1);
                    sp[1].Value = Server.HtmlEncode(txt_Description.Text);

                    sp[2] = new SqlParameter("@URL", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlEncode(str_filepath);

                    sp[3] = new SqlParameter("@D_id", SqlDbType.Int);
                    sp[3].Value = Convert.ToInt32(lbl_Id.Text);


                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Video Update Successfully')", true);
                    ClearMyPage();
                }
                else
                {
                    int D_id = sql_op.generate_id_sql("SELECT ISNULL(MAX(D_id),0) FROM tbl_video");

                    string str_insert = @"INSERT INTO [dbo].[tbl_video]([D_id],[D_date],[Description],[URL],[D_page])
                        VALUES (@D_id,@D_date,@Description,@URL,'NAAC')";

                    sp = new SqlParameter[4];

                    sp[0] = new SqlParameter("@D_id", SqlDbType.Int);
                    sp[0].Value = D_id;

                    sp[1] = new SqlParameter("@D_date", SqlDbType.DateTime);
                    sp[1].Value = DateTime.ParseExact(txtDisplayDate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    sp[2] = new SqlParameter("@Description", SqlDbType.NVarChar, -1);
                    sp[2].Value = Server.HtmlEncode(txt_Description.Text);

                    sp[3] = new SqlParameter("@url", SqlDbType.NVarChar, -1);
                    sp[3].Value = Server.HtmlEncode(str_filepath);

                    SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Video Insert Successfully')", true);
                    ClearMyPage();
                }

                #endregion
            }
            catch (Exception ee)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Save/Update " + ee.Message + "')", true);
            }
        }
    }
    protected void imgbtn_edit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            lbl_Id.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString();
            txt_url.Text = news_Grid.DataKeys[gvrow.RowIndex].Values["URL"].ToString();
            
            txtDisplayDate.Text = gvrow.Cells[2].Text.ToString();
            txt_Description.Text = gvrow.Cells[3].Text.ToString();   
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Edit " + ee.Message + "')", true);
        }
    }
    protected void imgbtn_delete_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton btndelete = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndelete.NamingContainer;

            string str_eventid = news_Grid.DataKeys[gvrow.RowIndex].Values["D_id"].ToString();           


            SqlParameter[] sp1 = new SqlParameter[1];
            sp1[0] = new SqlParameter("@D_id", SqlDbType.Int);
            sp1[0].Value = Convert.ToInt32(str_eventid);

            string str_del = "delete from tbl_video where D_id=@D_id";

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_del, sp1);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Video Delete Successfully')", true);



            ClearMyPage();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error in Delete " + ee.Message + "')", true);
        }
    }
    
    protected void btn_Reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_Video.aspx");
    }    
}
