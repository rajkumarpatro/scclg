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
using System.Data.SqlClient;

using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;



public partial class update_news : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
    

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
                    GetDetails();
                    txt_date.Text = DateTime.Now.ToString("dd-MM-yyyy");
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    protected void GetDetails()
    {
        try
        {
            string str_query = "SELECT [facility_id] as [ID], [facility_page] as [PageName], CONVERT(VARCHAR(10),facility_date,105) as [Date] FROM [dbo].[tbl_facility] ORDER BY [facility_id] DESC";
            DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            news_Grid.DataSource = dt_details;
            news_Grid.DataBind();
        }
        catch (Exception ee)
        {

        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        int flag = validateThis();
        if (flag == 1)
        {
            #region Process Save or Update
            
            string str_update = "update [dbo].[tbl_facility] set facility_page=@facility_page, facility_date=@facility_date, facility_description=@facility_description where facility_id=@facility_id";
            sp = new SqlParameter[4];

            sp[0] = new SqlParameter("@facility_page", SqlDbType.NVarChar, 50);
            sp[0].Value = Server.HtmlEncode(lbl_facility.Text);

            sp[1] = new SqlParameter("@facility_date", SqlDbType.DateTime);
            sp[1].Value = DateTime.ParseExact(txt_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

            sp[2] = new SqlParameter("@facility_description", SqlDbType.NVarChar, -1);
            sp[2].Value = Server.HtmlEncode(txt_description.Content);

            sp[3] = new SqlParameter("@facility_id", SqlDbType.Int);
            sp[3].Value = Convert.ToInt32(lbl_Id.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Data Saved Successfully')", true);

            Response.Redirect("post_facilities.aspx");
            #endregion           
        }
    }
    

    

    

    protected int validateThis()
    {
        if (lbl_Id.Text == "")
        {
            lblInfo.Text = "Error : Please select any page then proceed...";
            return (0);
        }
        else if (txt_date.Text == "")
        {
            lblInfo.Text = "Error : Date Required";
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
            lbl_facility.Text = row.Cells[2].Text.ToString();
            txt_date.Text = row.Cells[3].Text.ToString();

            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select facility_description from [dbo].[tbl_facility] where facility_id=" + lbl_Id.Text + "");


            txt_description.Content = Server.HtmlDecode(dt_data.Rows[0][0].ToString());
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in select " + ee.Message;
        }
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }

        
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_facilities.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string url = "post_facilities_photo.aspx?p_id=" + lbl_Id.Text;
        string s = "window.open('" + url + "', 'popup_window', 'width=800,height=600, resizable=yes, location=center,scrollbars=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}
