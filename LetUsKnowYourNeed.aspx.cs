using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Configuration;
using System.Data;

public partial class LetUsKnowYourNeed : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
    string saveLocation;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt_course = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT COURSEID,COURSENAME FROM [dbo].[tbl_Course] order by coursename");
            ddl_course.DataSource = dt_course;
            ddl_course.DataTextField = "COURSENAME";
            ddl_course.DataValueField = "COURSEID";
            ddl_course.DataBind();
            ddl_course.Items.Insert(0, new ListItem("Select", "0"));
        }
    } 

    protected void btn_submit_Click(object sender, EventArgs e)
    
    {
        try
        {

            #region Process Save or Update

            string str_insert = @"INSERT INTO [dbo].[TBL_KNOW_YOUR_NEEDS]
                               ([A_ID]
                               ,[NAME]
                               ,[ADMISSION]
                               ,[COURSE]
                               ,[DISABILITY]
                               ,[DISABILITY_PERCENTAGE]
                               ,[HELP]
                               ,[MOBILE_NO]
                               ,[EMAIL_ID]
                               ,[CONTACTED])
                         VALUES
                               (@A_ID
                               ,@NAME
                               ,@ADMISSION
                               ,@COURSE
                               ,@DISABILITY
                               ,@DISABILITY_PERCENTAGE
                               ,@HELP
                               ,@MOBILE_NO
                               ,@EMAIL_ID
                               ,@CONTACTED)";

            SqlParameter[] sp = new SqlParameter[10];

            sp[0] = new SqlParameter("@A_ID", SqlDbType.Int);
            sp[0].Value = Convert.ToInt32(op.generate_id_sql("select ISNULL(max(A_ID),0) from TBL_KNOW_YOUR_NEEDS").ToString());

            sp[1] = new SqlParameter("@NAME", SqlDbType.NVarChar, 150);
            sp[1].Value = Server.HtmlEncode(txt_Name.Text.ToString());

            sp[2] = new SqlParameter("@ADMISSION", SqlDbType.NVarChar, 150);
            sp[2].Value = Server.HtmlEncode(txt_admission.Text);

            sp[3] = new SqlParameter("@COURSE", SqlDbType.NVarChar, 60);
            sp[3].Value = Server.HtmlEncode(ddl_course.SelectedItem.Text);

            sp[4] = new SqlParameter("@DISABILITY", SqlDbType.NVarChar, 60);
            sp[4].Value = Server.HtmlEncode(txt_disability.Text);

            sp[5] = new SqlParameter("@DISABILITY_PERCENTAGE", SqlDbType.NVarChar, 60);
            sp[5].Value = Server.HtmlEncode(txt_percentage.Text);

            sp[6] = new SqlParameter("@HELP", SqlDbType.NVarChar, 60);
            sp[6].Value = Server.HtmlEncode(txt_howhelp.Text);

            sp[7] = new SqlParameter("@MOBILE_NO", SqlDbType.NVarChar, 10);
            sp[7].Value = Server.HtmlEncode(txt_mobile.Text);

            sp[8] = new SqlParameter("@EMAIL_ID", SqlDbType.NVarChar, -1);
            sp[8].Value = Server.HtmlEncode(txt_email.Text);

            sp[9] = new SqlParameter("@CONTACTED", SqlDbType.NVarChar, -1);
            sp[9].Value = Server.HtmlEncode(ddl_tobecontacted.SelectedItem.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_insert, sp);

            Response.Redirect("thanks.aspx");

            #endregion

        }
        catch (Exception ee)
        {
            lblInfo.Text = "Error in Save Process " + ee.Message;
        }
    }
}
