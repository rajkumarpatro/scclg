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

public partial class Department_Login : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_web_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("CLogin.aspx");

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@MOBILE_NO", SqlDbType.NVarChar, 10);
            sp[0].Value = Server.HtmlEncode(txt_Username.Text);

            sp[1] = new SqlParameter("@DEPARTMENT_PASSWORD", SqlDbType.NVarChar, 50);
            sp[1].Value = Server.HtmlEncode(txt_Password.Text);

            string str_query = "SELECT PAGE_ID, PAGE_HEAD_ID, PAGE_NAME, MOBILE_NO, DEPARTMENT_PASSWORD, U_Status FROM TBL_COLLEGE_PAGE WHERE MOBILE_NO=@MOBILE_NO and DEPARTMENT_PASSWORD=@DEPARTMENT_PASSWORD";

            DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp);
            if (dtLogin.Rows.Count > 0)
            {
                Session.Add("DpUser", dtLogin);
                Response.Redirect("Department_panel.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Wrong User Name or Password')", true);
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('" + ee.Message + "')", true);
        }
    }
}
