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

public partial class ExamQuestionPaper : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string str_session = Request.QueryString["year"].ToString();
            string cls = Request.QueryString["cls"].ToString();

            lbl_title.Text = "Question Paper of " + cls + " for Special Exam 2019-20";
            //lbl_title.Text = "Question Paper of " + cls + " for Annual Exam 2019-20";
            this.Title = lbl_title.Text;

            if (Request.QueryString["dt"] != null)
            {
                GetRecord();
            }

        }
    }

    protected void GetRecord()
    {
        try
        {
            string str_dt = Request.QueryString["dt"].ToString();
            string cls = Request.QueryString["cls"].ToString();

            string str_select = "SELECT [ATitle] ,[APath],CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) as ADate FROM [dbo].[tbl_assignment] where ATYPE='Question Paper' AND COURSETYPE='" + cls + "' and CONVERT(VARCHAR(10),ADATE,105)='" + str_dt + "' and ASHOW='Yes' order by ATitle";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_select);

            grid_record.DataSource = dt;
            grid_record.DataBind();
            grid_record.Visible = true;
            lbl_msg.Text = "";
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error :" + ee.Message;
        }
    }
}