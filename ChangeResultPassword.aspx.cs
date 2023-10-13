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
using System.Data.OleDb;

public partial class user_management : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    int flag = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ResultAdminUser"] == null)
            {
                Response.Redirect("SCDURG-Result.aspx");
            }
        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        if (txtOldPassword.Text == "")
        {
            flag = 0;
            lblError.Text = "Error : Old Password Required";
        }
        else if (txtNewPassword.Text == "")
        {
            flag = 0;
            lblError.Text = "Error : New Password Required";
        }
        else if (txtRetypePasssword.Text == "")
        {
            flag = 0;
            lblError.Text = "Error : Retype Password Required";
        }
        else if (txtNewPassword.Text.ToString() != txtRetypePasssword.Text.ToString())
        {
            flag = 0;
            lblError.Text = "Error : New Password and Retype Password Not Matched";
        }
        else
        {
            string str_old=SqlHelper.ExecuteScalar(Connection.My_Connection(),CommandType.Text,"select U_Password from tbl_ResultLogin where U_Name='SCDURG'").ToString();
            
            if (txtOldPassword.Text.ToString() != str_old)
            {
                flag = 0;
                lblError.Text = "Error : Old Password Not Correct";
            }
        }

        if (flag == 1)
        {
            SqlHelper.ExecuteNonQuery(Connection.My_Connection(),CommandType.Text,"update tbl_ResultLogin set U_Password='" + txtNewPassword.Text.ToString() + "' where U_Name='SCDURG'");

            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Message : New Password Successfully Saved";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ResultPanel.aspx");
    }
}
