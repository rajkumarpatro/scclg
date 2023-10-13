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

public partial class science_login : System.Web.UI.Page
{
    sql_operations sql_op = new sql_operations();

    SqlParameter[] sp = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        if(txt_Username.Text=="scdurg")
        {
            sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@U_Name", SqlDbType.NVarChar, 50);
            sp[0].Value = Server.HtmlEncode(txt_Username.Text);

            sp[1] = new SqlParameter("@U_Password", SqlDbType.NVarChar, 50);
            sp[1].Value = Server.HtmlEncode(txt_Password.Text);

            DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select [U_Name] ,[U_Fullname] ,[U_Password]  ,[U_Status] from tbl_Login where U_Name=@U_Name and U_Password=@U_Password", sp);
            if (dtLogin.Rows.Count == 1)
            {
                if (dtLogin.Rows[0]["U_Status"].ToString() != "Block")
                {

                    Session.Add("iamuser", dtLogin.Rows[0][0].ToString());
                    Session.Add("LoginType","Admin");
                    Response.Redirect("ScienceCPanel.aspx");
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
        else
        {
            string str_query = "select PAGE_ID,PAGE_HEAD_ID,PAGE_NAME,PASSWORD from TBL_SCD_PAGE where PAGE_NAME=@PAGE_NAME and PASSWORD=@PASSWORD";
            sp = new SqlParameter[2];
            sp[0] = new SqlParameter("@PAGE_NAME", SqlDbType.NVarChar, 50);
            sp[0].Value = Server.HtmlEncode(txt_Username.Text);

            sp[1] = new SqlParameter("@PASSWORD", SqlDbType.NVarChar, 50);
            sp[1].Value = Server.HtmlEncode(txt_Password.Text);

            DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp);

            if (dtLogin.Rows.Count == 1)
            {
                Session.Add("iamuser", dtLogin.Rows[0][0].ToString());
                Session.Add("LoginType", "Department");
                Response.Redirect("ScienceCPanel.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Wrong User Name or Password')", true);
            }
        }
        
    }
}
