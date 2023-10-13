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
using System.Data.SqlClient;

public partial class user_management : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    int flag = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["iamuser"]==null)
            {
                Response.Redirect("CLogin.aspx");
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
            string str_query = "select u_Password from tbl_Login where u_Name='admin'";

            string old_pw = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str_query).ToString();

            if (txtOldPassword.Text.ToString() != old_pw)
            {
                flag = 0;
                lblError.Text = "Error : Old Password Not Correct";
            }
        }

        if (flag == 1)
        {
            string str_update = "update tbl_Login set u_Password=@u_Password where u_Name='admin'";

            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@u_Password", SqlDbType.NVarChar, 150);
            sp[0].Value = Server.HtmlEncode(txtNewPassword.Text);

            SqlHelper.ExecuteNonQuery(Connection.My_Connection(), CommandType.Text, str_update, sp);

            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Message : New Password Successfully Saved";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
}
