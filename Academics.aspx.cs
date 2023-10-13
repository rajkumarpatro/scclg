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

public partial class introduction : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        OleDbDataAdapter adpt_fill = new OleDbDataAdapter("SELECT [event_page],event_description, event_image FROM [tbl_academics] where event_page='" + Request.QueryString["pname"].ToString() + "'", conn);
        DataSet ds_fill = new DataSet();
        adpt_fill.Fill(ds_fill, "tbl_fill");

        desc_content.InnerHtml = ds_fill.Tables["tbl_fill"].Rows[0]["event_description"].ToString();
        this.Title = lbl_title.Text;
        lbl_title.Text = Request.QueryString["pname"];
      //  img_head.ImageUrl = ds_fill.Tables["tbl_fill"].Rows[0]["event_image"].ToString(); 
    }
}
