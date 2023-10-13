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

public partial class introduction : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    OleDbParameter[] sp;
    protected void Page_Load(object sender, EventArgs e)
    {

        lbl_title.Text = Request.QueryString["tp"].ToString();
        this.Title = lbl_title.Text;
        if (lbl_title.Text == "LATEST NEWS AND UPDATES")
        {
            string str_query = @"select [news_Id] ,CONVERT(VARCHAR(10),news_Date,105) AS news_Date ,[news_Title] ,[news_filepath] ,[news_Link] ,[news_LinkType] from TBL_SCD_LATEST_UPDATE  order by NEWS_ID desc";
            DataTable dt_latest_notice = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            grid_record.DataSource = dt_latest_notice;
            grid_record.DataBind();
            grid_record.Visible = true;
        }
        else
        {
            string str_query = @"SELECT [news_Id] ,[news_Date] ,[news_Title] ,[news_filepath] ,[news_Link] ,[news_LinkType] FROM [dbo].[tbl_AutonomousNotice] ORDER BY news_Id DESC";
            DataTable dt_ac_notice = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            grid_record.DataSource = dt_ac_notice;
            grid_record.DataBind();
            grid_record.Visible = true;
        }
    }
}
