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

public partial class post_course_code : System.Web.UI.Page
{

    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;
    string saveLocation;

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
                    getSession();
                    getDepartments();
                    if (Session["iamuser"].ToString() != "scdurg")
                    {
                        string pageid = Session["iamuser"].ToString();
                        ddl_department.SelectedValue = pageid;
                        ddl_department.Enabled = false;
                        checkRecord();
                    }
                }
            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
    }

    protected void getDepartments()
    {
        DataTable dt_category = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT PAGE_ID,PAGE_NAME FROM [dbo].[TBL_SCD_PAGE] WHERE SHOW='Yes' AND IS_DEPARTMENT='Yes' ORDER BY PAGE_NAME");
        ddl_department.DataSource = dt_category;
        ddl_department.DataTextField = "PAGE_NAME";
        ddl_department.DataValueField = "PAGE_ID";
        ddl_department.DataBind();
        ddl_department.Items.Insert(0, new ListItem("Select", "0"));
    }
    protected void getSession()
    {
        DataTable dt_session = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT SESSION_ID,SESSION_VALUE FROM TBL_SESSION ORDER BY SESSION_VALUE DESC");
        ddl_session.DataSource = dt_session;
        ddl_session.DataTextField = "SESSION_VALUE";
        ddl_session.DataValueField = "SESSION_ID";
        ddl_session.DataBind();
    }
   
    protected void DeleteRecord(int courseid)
    {
        sp = new SqlParameter[1];

        sp[0] = new SqlParameter("@COURSE_ID", SqlDbType.Int);
        sp[0].Value = courseid;

        string str_delete = "DELETE FROM TBL_SESSION_COURSE_CODE WHERE COURSE_ID=@COURSE_ID";
        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_delete, sp);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Deleted Successfully')", true);
        checkRecord();
    }
    protected void btn_delete_dsc_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string id = gv_dsc.DataKeys[gvrow.RowIndex].Values["COURSE_ID"].ToString();

            DeleteRecord(Convert.ToInt32(id));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete<br>" + ee.Message;
        }
    }

    protected void btn_delete_dse_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string id = gv_dse.DataKeys[gvrow.RowIndex].Values["COURSE_ID"].ToString();

            DeleteRecord(Convert.ToInt32(id));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete<br>" + ee.Message;
        }
    }

    protected void btn_delete_gec_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string id = gv_gec.DataKeys[gvrow.RowIndex].Values["COURSE_ID"].ToString();

            DeleteRecord(Convert.ToInt32(id));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete<br>" + ee.Message;
        }
    }

    protected void btn_delete_sec_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btnedit = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btnedit.NamingContainer;

            string id = gv_sec.DataKeys[gvrow.RowIndex].Values["COURSE_ID"].ToString();

            DeleteRecord(Convert.ToInt32(id));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete<br>" + ee.Message;
        }
    }

    protected DataTable getRecord(string courseType)
    {
        DataTable dt_record = new DataTable();
        string str_query = "SELECT COURSE_ID,COURSE_TYPE,COURSE_CODE,COURSE_NAME,COURSE_CREDIT FROM TBL_SESSION_COURSE_CODE WHERE SESSION_ID=" + ddl_session.SelectedValue + " AND COURSE_TYPE='"+ courseType + "' AND PAGE_ID=" + ddl_department.SelectedValue + " ORDER BY COURSE_ID";
        return dt_record = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);
    }
    protected void checkRecord()
    {
        try
        {
            DataTable dt_dsc = getRecord("DSC");
            if(dt_dsc.Rows.Count>0)
            {
                DataTable dt_dse = getRecord("DSE");
                DataTable dt_gec = getRecord("GEC");
                DataTable dt_sec = getRecord("SEC");
                btn_generate_record.Visible = false;

                gv_dsc.DataSource = dt_dsc;
                gv_dsc.DataBind();

                gv_dse.DataSource = dt_dse;
                gv_dse.DataBind();

                gv_gec.DataSource = dt_gec;
                gv_gec.DataBind();

                gv_sec.DataSource = dt_sec;
                gv_sec.DataBind();
            }
            else
            {
                btn_generate_record.Visible = true;

                gv_dsc.DataSource = null;
                gv_dsc.DataBind();

                gv_dse.DataSource = null;
                gv_dse.DataBind();

                gv_gec.DataSource = null;
                gv_gec.DataBind();

                gv_sec.DataSource = null;
                gv_sec.DataBind();
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error :"+ee.Message+"')", true);
        }
    }
    protected void ddl_department_SelectedIndexChanged(object sender, EventArgs e)
    {
        checkRecord();
    }

    protected void btn_generate_record_Click(object sender, EventArgs e)
    {
        //generateRecords("DSC", 7);
        //generateRecords("DSE", 8);
        //generateRecords("GEC", 2);
        //generateRecords("SEC", 2);

        generateRecords("DSC", 1);
        generateRecords("DSE", 1);
        generateRecords("GEC", 1);
        generateRecords("SEC", 1);
        checkRecord();
    }

    protected void generateRecords(string courseType,int count)
    {
        string str_query = @"INSERT INTO [dbo].[TBL_SESSION_COURSE_CODE] ([SESSION_ID] ,[PAGE_ID] ,[COURSE_TYPE])
                            VALUES("+ddl_session.SelectedValue+" ,"+ddl_department.SelectedValue+" ,'"+courseType+"')";

        for(int i=0; i<count;i++)
        {
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_query);
        }        
    }

    protected void btn_save_dsc_Click(object sender, EventArgs e)
    {
        for(int i=0;i<gv_dsc.Rows.Count;i++)
        {
            int id = Convert.ToInt32(gv_dsc.DataKeys[i].Values["COURSE_ID"].ToString());
            string code = ((TextBox)gv_dsc.Rows[i].FindControl("txt_dsc_code")).Text;
            string course = ((TextBox)gv_dsc.Rows[i].FindControl("txt_dsc_couse")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_dsc.Rows[i].FindControl("txt_dsc_credit")).Text);

            UpdateRecord(id, code, course, credit);
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('DSC Records Updated Successfully')", true);
    }

    protected void btn_add_dsc_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btadd = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btadd.NamingContainer;

            string type = "DSC";
            string code = ((TextBox)gv_dsc.FooterRow.FindControl("txt_dsc_code_add")).Text;
            string course = ((TextBox)gv_dsc.FooterRow.FindControl("txt_dsc_couse_add")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_dsc.FooterRow.FindControl("txt_dsc_credit_add")).Text);

            InsertRecord(type, code, course, credit);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Added Successfully')", true);

            ((TextBox)gv_dsc.FooterRow.FindControl("txt_dsc_code_add")).Text = "";
            ((TextBox)gv_dsc.FooterRow.FindControl("txt_dsc_couse_add")).Text = "";
            ((TextBox)gv_dsc.FooterRow.FindControl("txt_dsc_credit_add")).Text = "";
            checkRecord();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Add<br>" + ee.Message;
        }
    }

    protected void btn_save_dse_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gv_dse.Rows.Count; i++)
        {
            int id = Convert.ToInt32(gv_dse.DataKeys[i].Values["COURSE_ID"].ToString());
            string code = ((TextBox)gv_dse.Rows[i].FindControl("txt_dse_code")).Text;
            string course = ((TextBox)gv_dse.Rows[i].FindControl("txt_dse_couse")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_dse.Rows[i].FindControl("txt_dse_credit")).Text);

            UpdateRecord(id, code, course, credit);
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('DSE Records Updated Successfully')", true);
    }

    protected void btn_add_dse_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btadd = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btadd.NamingContainer;

            string type = "DSE";
            string code = ((TextBox)gv_dse.FooterRow.FindControl("txt_dse_code_add")).Text;
            string course = ((TextBox)gv_dse.FooterRow.FindControl("txt_dse_couse_add")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_dse.FooterRow.FindControl("txt_dse_credit_add")).Text);

            InsertRecord(type, code, course, credit);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Added Successfully')", true);

            ((TextBox)gv_dse.FooterRow.FindControl("txt_dse_code_add")).Text = "";
            ((TextBox)gv_dse.FooterRow.FindControl("txt_dse_couse_add")).Text = "";
            ((TextBox)gv_dse.FooterRow.FindControl("txt_dse_credit_add")).Text = "";
            checkRecord();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Add<br>" + ee.Message;
        }
    }

    protected void btn_save_gec_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gv_gec.Rows.Count; i++)
        {
            int id = Convert.ToInt32(gv_gec.DataKeys[i].Values["COURSE_ID"].ToString());
            string code = ((TextBox)gv_gec.Rows[i].FindControl("txt_gec_code")).Text;
            string course = ((TextBox)gv_gec.Rows[i].FindControl("txt_gec_couse")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_gec.Rows[i].FindControl("txt_gec_credit")).Text);

            UpdateRecord(id, code, course, credit);
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('GEC Records Updated Successfully')", true);
    }

    protected void btn_add_gec_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btadd = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btadd.NamingContainer;

            string type = "GEC";
            string code = ((TextBox)gv_gec.FooterRow.FindControl("txt_gec_code_add")).Text;
            string course = ((TextBox)gv_gec.FooterRow.FindControl("txt_gec_couse_add")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_gec.FooterRow.FindControl("txt_gec_credit_add")).Text);

            InsertRecord(type, code, course, credit);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Added Successfully')", true);

            ((TextBox)gv_gec.FooterRow.FindControl("txt_gec_code_add")).Text = "";
            ((TextBox)gv_gec.FooterRow.FindControl("txt_gec_couse_add")).Text = "";
            ((TextBox)gv_gec.FooterRow.FindControl("txt_gec_credit_add")).Text = "";
            checkRecord();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Add<br>" + ee.Message;
        }
    }

    protected void btn_save_sec_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gv_sec.Rows.Count; i++)
        {
            int id = Convert.ToInt32(gv_sec.DataKeys[i].Values["COURSE_ID"].ToString());
            string code = ((TextBox)gv_sec.Rows[i].FindControl("txt_sec_code")).Text;
            string course = ((TextBox)gv_sec.Rows[i].FindControl("txt_sec_couse")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_sec.Rows[i].FindControl("txt_sec_credit")).Text);

            UpdateRecord(id, code, course, credit);
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('SEC Records Updated Successfully')", true);
    }

    protected void btn_add_sec_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            ImageButton btadd = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btadd.NamingContainer;

            string type = "SEC";
            string code = ((TextBox)gv_sec.FooterRow.FindControl("txt_sec_code_add")).Text;
            string course = ((TextBox)gv_sec.FooterRow.FindControl("txt_sec_couse_add")).Text;
            int credit = Convert.ToInt32(((TextBox)gv_sec.FooterRow.FindControl("txt_sec_credit_add")).Text);

            InsertRecord(type, code, course, credit);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Record Added Successfully')", true);

            ((TextBox)gv_sec.FooterRow.FindControl("txt_sec_code_add")).Text = "";
            ((TextBox)gv_sec.FooterRow.FindControl("txt_sec_couse_add")).Text = "";
            ((TextBox)gv_sec.FooterRow.FindControl("txt_sec_credit_add")).Text = "";
            checkRecord();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Add<br>" + ee.Message;
        }
    }

    protected void UpdateRecord(int courseid,string coursecode,string coursename,int coursecredit)
    {
        sp = new SqlParameter[4];

        sp[0] = new SqlParameter("@COURSE_CODE", SqlDbType.NVarChar, 20);
        sp[0].Value = coursecode;

        sp[1] = new SqlParameter("@COURSE_NAME", SqlDbType.NVarChar, 100);
        sp[1].Value = coursename;

        sp[2] = new SqlParameter("@COURSE_CREDIT", SqlDbType.Int);
        sp[2].Value = coursecredit;

        sp[3] = new SqlParameter("@COURSE_ID", SqlDbType.Int);
        sp[3].Value = courseid;

        string str_update = @"UPDATE [dbo].[TBL_SESSION_COURSE_CODE] SET [COURSE_CODE] = @COURSE_CODE ,[COURSE_NAME] = @COURSE_NAME ,[COURSE_CREDIT] = @COURSE_CREDIT WHERE COURSE_ID=@COURSE_ID";

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
    }

    protected void InsertRecord(string coursetype, string coursecode, string coursename, int coursecredit)
    {
        sp = new SqlParameter[6];

        sp[0] = new SqlParameter("@SESSION_ID", SqlDbType.Int);
        sp[0].Value = Convert.ToInt32(ddl_session.SelectedValue);

        sp[1] = new SqlParameter("@PAGE_ID", SqlDbType.Int);
        sp[1].Value = Convert.ToInt32(ddl_department.SelectedValue);

        sp[2] = new SqlParameter("@COURSE_TYPE", SqlDbType.VarChar, 10);
        sp[2].Value = coursetype;

        sp[3] = new SqlParameter("@COURSE_CODE", SqlDbType.NVarChar, 20);
        sp[3].Value = coursecode;

        sp[4] = new SqlParameter("@COURSE_NAME", SqlDbType.NVarChar, 100);
        sp[4].Value = coursename;

        sp[5] = new SqlParameter("@COURSE_CREDIT", SqlDbType.Int);
        sp[5].Value = coursecredit;

        string str_update = @"INSERT INTO [dbo].[TBL_SESSION_COURSE_CODE] ([SESSION_ID] ,[PAGE_ID] ,[COURSE_TYPE] ,[COURSE_CODE] ,[COURSE_NAME] ,[COURSE_CREDIT])
                            VALUES (@SESSION_ID ,@PAGE_ID ,@COURSE_TYPE ,@COURSE_CODE ,@COURSE_NAME ,@COURSE_CREDIT)";

        SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);
    }
}
