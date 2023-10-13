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

public partial class Assignments : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string str_session = Request.QueryString["year"].ToString();
            string str_type = Request.QueryString["type"].ToString();
            btn_search.Text = "Search " + str_type;
            if (str_type == "Question Paper")
            {
                //string cls = Request.QueryString["cls"].ToString();

                //lbl_title.Text = "Question Paper of " + cls + " for Annual Exam 2020";
                //this.Title = lbl_title.Text;
                //dv_class.Visible = false;

                //Above code is for Class and Date Wise

                lbl_title.Text = "Question Papers for Annual & Semester Exam " + str_session;
                this.Title = lbl_title.Text;
                dv_class.Visible = true;

                //GetCourse();
                GetDate(str_session, str_type);
                //GetRecord();
            }
            else
            {
                dv_class.Visible = true;
                this.Title = str_type + " " + str_session;
                lbl_title.Text = str_type + " " + str_session;
                
                GetCourse();
            }
        }
    }

    protected void GetDate(string str_session,string str_type)
    {
        try
        {
            string str_query = "SELECT DISTINCT(CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105)) as ADate FROM [dbo].[tbl_assignment] where AYEAR='" + str_session + "' and AType='" + str_type + "' and ASHOW='Yes' order by ADate";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_date.DataSource = dt;
            ddl_date.DataTextField = "ADate";
            ddl_date.DataValueField = "ADate";
            ddl_date.DataBind();

            ddl_date.Items.Insert(0, new ListItem("Select", "0"));
        }
        catch (Exception ee)
        {
            
        }
    }

    protected void GetCourse()
    {
        try
        {
            string str_query = "select CourseId,CourseName from tbl_Course where CourseType='" + ddl_admissionclasstype.SelectedValue + "'";

            DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            ddl_admissionclass.DataSource = dt;
            ddl_admissionclass.DataTextField = "CourseName";
            ddl_admissionclass.DataValueField = "CourseId";
            ddl_admissionclass.DataBind();

            //ddl_part.Items.Clear();
            //ddl_part.Items.Insert(0, new ListItem("1", "1"));
            //ddl_part.Items.Insert(1, new ListItem("2", "2"));
            //ddl_part.Items.Insert(2, new ListItem("3", "3"));

            //lbl_classtype.Text = "Year";

            //if (ddl_admissionclasstype.SelectedValue == "PG")
            //{
            //    ddl_part.Items.Insert(3, new ListItem("4", "4"));
            //    lbl_classtype.Text = "Semester";
            //}
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
            string str_type = Request.QueryString["type"].ToString();
            if (str_type == "Question Paper")
            {
                //Old Code
                //cls = "and COURSETYPE = '"+Request.QueryString["cls"].ToString()+"'";
            }
            string str_where = "";

            if (dv_class.Visible == true)
            {
                str_where = " and [CourseId]=" + ddl_admissionclass.SelectedValue + " and Part=" + ddl_part.SelectedValue + "";
            }

            string str_select = "SELECT [ATitle] ,[APath],CONVERT(VARCHAR(10), dbo.tbl_assignment.ADate, 105) as ADate FROM [dbo].[tbl_assignment] where AYEAR='" + str_session + "' and AType='" + str_type + "' and ASHOW='Yes' "+cls+" " + str_where + " order by ATitle";

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
