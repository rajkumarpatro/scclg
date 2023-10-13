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
    sql_operations sql_op = new sql_operations();
    SqlParameter[] sp = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            sp = new SqlParameter[2];

            sp[0] = new SqlParameter("@U_Name", SqlDbType.VarChar, 50);
            sp[0].Value = Server.HtmlEncode(txt_Username.Text);

            sp[1] = new SqlParameter("@U_Password", SqlDbType.VarChar, 50);
            sp[1].Value = Server.HtmlEncode(txt_Password.Text);

            DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [U_Fullname] ,[U_Type] ,[U_Status] FROM [dbo].[tbl_ResultLogin] where [U_Name]=@U_Name and [U_Password]=@U_Password", sp);
            if (dt_data.Rows.Count == 1)
            {
                if (dt_data.Rows[0]["U_Status"].ToString() != "Block")
                {

                    Session.Add("ResultAdminUser", Server.HtmlEncode(txt_Username.Text));
                    Session.Add("ResultAdminName", dt_data.Rows[0]["U_Fullname"].ToString());
                    Session.Add("ResultAdminType", dt_data.Rows[0]["U_Type"].ToString());

                    Session.Add("Topic", "0");
                    Session.Add("Year", "0");

                    Response.Redirect("ResultPanel.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Block by Super Admin')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Wrong User Name or Password')", true);
            }
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Finding Error, Contact to Website Administrator')", true);
        }
    }
}
