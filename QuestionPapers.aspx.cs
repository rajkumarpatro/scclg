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

public partial class QuestionPapers : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Request.QueryString["year"]!=null)
            {
                string str_session = Request.QueryString["year"].ToString();
                string str_coursetype= Request.QueryString["ct"].ToString();
                ddl_admissionclasstype.SelectedValue = str_coursetype;
                ddl_admissionclasstype.Enabled = false;

                string str_type = "Question Paper";
                btn_search.Text = "Search " + str_type;

                lbl_title.Text = Request.QueryString["examtitle"].ToString();
                this.Title = lbl_title.Text;
                dv_class.Visible = true;

                GetDate(str_session, str_type);
                GetCourse();
            }
        }
    }

    protected void GetDate(string str_session,string str_type)
    {
        try
        {
            string courseType = Request.QueryString["ct"].ToString();
            string str_query = "SELECT DISTINCT(CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105)) as ADate FROM [dbo].[tbl_assignment] where AYEAR='" + str_session + "' and AType='" + str_type + "' and ASHOW='Yes'  and COURSETYPE='"+ courseType + "' order by ADate";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_date.DataSource = dt;
            ddl_date.DataTextField = "ADate";
            ddl_date.DataValueField = "ADate";
            ddl_date.DataBind();

            ddl_date.Items.Insert(0, new ListItem("Select Date", "0"));
        }
        catch (Exception ee)
        {
            
        }
    }

    protected void GetCourse()
    {
        try
        {
            string str_session = Request.QueryString["year"].ToString();
            string str_query = @"SELECT DISTINCT(TA.COURSEID) COURSEID,CourseName FROM dbo.tbl_assignment TA INNER JOIN tbl_Course TC ON TA.CourseId=TC.CourseId 
            WHERE CONVERT(VARCHAR(10), TA.ADate, 105)= '"+ddl_date.SelectedValue+ "' and AType = 'Question Paper' and ASHOW = 'Yes' AND AYEAR='" + str_session + "'";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_admissionclass.DataSource = dt;
            ddl_admissionclass.DataTextField = "CourseName";
            ddl_admissionclass.DataValueField = "CourseId";
            ddl_admissionclass.DataBind();

            ddl_admissionclass.Items.Insert(0, new ListItem("Select Course", "0"));
        }
        catch (Exception ee)
        {

        }
    }

    protected void GetPart()
    {
        try
        {
            string str_session = Request.QueryString["year"].ToString();

            string str_query = @"SELECT DISTINCT(PART) as PART FROM dbo.tbl_assignment WHERE COURSEID=" + ddl_admissionclass.SelectedValue+" and AType = 'Question Paper' and ASHOW = 'Yes' AND AYEAR='" + str_session+"'";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_part.DataSource = dt;
            ddl_part.DataTextField = "PART";
            ddl_part.DataValueField = "PART";
            ddl_part.DataBind();

            ddl_part.Items.Insert(0, new ListItem("Select Part", "0"));
        }
        catch (Exception ee)
        {

        }
    }

    protected void GetRecord()
    {
        try
        {
            string cls="";
            string str_session = Request.QueryString["year"].ToString();
            string str_type = "Question Paper";
            string str_where = "";

            //str_where = " and [CourseId]=" + ddl_admissionclass.SelectedValue + " and Part=" + ddl_part.SelectedValue + "";
            //str_where = " and Part=" + ddl_part.SelectedValue + "";

            string str_select = "SELECT [ATitle] ,[APath],CONVERT(VARCHAR(10), ADate, 105) as ADate,COURSENAME FROM [dbo].[tbl_assignment] TA INNER JOIN tbl_Course TC ON TA.CourseId=TC.CourseId where AYEAR='" + str_session + "' AND CONVERT(VARCHAR(10), ADate, 105)='"+ddl_date.SelectedValue+"' and AType='" + str_type + "' and ASHOW='Yes' "+cls+" " + str_where + " order by ATitle";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_select);

            grid_record.DataSource = dt;
            grid_record.DataBind();
            grid_record.Visible = true;
            lbl_msg.Text = "";
        }
        catch (Exception ee)
        {
            lbl_msg.Text = "Error :"+ ee.Message;
        }
    }

    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }

    protected void ddl_admissionclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetPart();
    }

    protected void ddl_date_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCourse();
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        try
        {
            GetRecord();
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error while search "+ee.Message+"')", true);
        }

    }
}
