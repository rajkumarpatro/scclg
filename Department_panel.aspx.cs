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

public partial class Department_panel : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    int photo_id ;
    string saveLocation;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["DpUser"] == null)
            {
                Response.Redirect("Department_Login.aspx");
            }
            else
            {
                DataTable dt_user = Session["DpUser"] as DataTable;
                lbl_user.Text = "Welcome to " + dt_user.Rows[0]["PAGE_NAME"].ToString() + " Department";
            }
        }
       
    }

}
