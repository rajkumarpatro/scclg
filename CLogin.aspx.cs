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

public partial class CLogin : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_web_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("Department_Login.aspx");

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@U_Name", SqlDbType.NVarChar, 150);
            sp[0].Value = Server.HtmlEncode(txt_Username.Text);

            sp[1] = new SqlParameter("@U_Password", SqlDbType.NVarChar, 150);
            sp[1].Value = Server.HtmlEncode(txt_Password.Text);

            DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select [U_Fullname] ,[U_Name] ,[U_Password]  ,[U_Status] from tbl_Login where U_Name=@U_Name and U_Password=@U_Password", sp);
            if (dtLogin.Rows.Count == 1)
            {
                if (dtLogin.Rows[0]["U_Status"].ToString() != "Block")
                {
                    Session.Add("iamuser", dtLogin.Rows[0]["U_Fullname"].ToString());
                    Response.Redirect("CPanel.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Blocked by Admin')", true);
                }
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
