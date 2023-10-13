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

public partial class CPanel : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    int photo_id ;
    string saveLocation;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["ResultAdminUser"] == null)
                {
                    Response.Redirect("SCDURG-Result.aspx");
                }
                else
                {
                    //lbl_user.Text = "Hello " + Session["ResultAdminName"].ToString();
                }
            }
            catch
            {
                Response.Redirect("SCDURG-Result.aspx");
            }
        }
       
    }


    protected void ImageButton5_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ChangeResultPassword.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Result.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post-admitcard.aspx");
    }
}
