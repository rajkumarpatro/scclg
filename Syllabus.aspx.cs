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
using System.Data.SqlClient;
using System.Net;
using System.Data.OleDb;

public partial class introduction : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                GetSession();
            }
            catch (Exception ee)
            {

            }
        }
    }


    protected void GetSession()
    {
        try
        {
            string str_select = "SELECT DISTINCT file_session FROM tbl_educational_file where event_page='" + ddl_programme.SelectedValue + "'";
            OleDbDataAdapter adpt_fill = new OleDbDataAdapter(str_select, conn);
            DataSet ds_fill = new DataSet();
            adpt_fill.Fill(ds_fill, "tbl_fill");

            ddl_session.DataSource = ds_fill.Tables[0];
            ddl_session.DataTextField = "file_session";
            ddl_session.DataValueField = "file_session";
            ddl_session.DataBind();

            ddl_session.Items.Insert(0, new ListItem("Select Session", "0"));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Get Session<br>" + ee.Message;
        }
    }

    protected void GetRecord(string str_course)
    {
        string str_select = "SELECT file_details, file_path,file_session FROM tbl_educational_file where event_page='" + str_course + "' and file_session='"+ddl_session.SelectedValue+"' order by file_details";

        DataSet ds_select = sql_op.get_dataset(str_select);

        gv_topic.DataSource = ds_select.Tables[0];
        gv_topic.DataBind();

    }

    protected void ddl_programme_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSession();
        GetRecord(ddl_programme.Text);
    }

    protected void ddl_session_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetRecord(ddl_programme.Text);
    }
    protected void gv_topic_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
