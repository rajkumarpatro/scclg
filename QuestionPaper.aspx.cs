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

public partial class QuestionPaper : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int j = 0;
            for (int i = 2017; i <= Convert.ToInt32(DateTime.Now.ToString("yyyy")); i++)
            {
                ddl_year.Items.Insert(j, new ListItem(i.ToString(), i.ToString()));
                j++;
            }
            GetCourse();
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

            if (ddl_admissionclasstype.SelectedValue == "PG")
            {
                ddl_admissionclass.Visible = false;
            }
            else
            {
                ddl_admissionclass.Visible = true;
            }
        }
        catch (Exception ee)
        {

        }
    }

    protected void GetRecord()
    {

        string str_select = "";

        if (ddl_admissionclasstype.SelectedValue == "PG")
        {
            str_select = "SELECT [ATitle],AYear ,[APath] FROM [dbo].[tbl_questionpaper] where [CourseType]='" + ddl_admissionclasstype.SelectedValue + "' and [Part]=" + ddl_part.SelectedValue + " and AYear=" + ddl_year.SelectedValue + " order by ATitle";
        }
        else
        {
            str_select = "SELECT [ATitle],AYear ,[APath] FROM [dbo].[tbl_questionpaper] where [CourseId]=" + ddl_admissionclass.SelectedValue + " and [Part]=" + ddl_part.SelectedValue + " and AYear="+ddl_year.SelectedValue+" order by ATitle";
        }

        DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(),CommandType.Text,str_select);

        grid_record.DataSource = dt;
        grid_record.DataBind();
        grid_record.Visible = true;

    }


    protected void ddl_admissionclasstype_SelectedIndexChanged(object sender, EventArgs e)
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

        }

    }
}
