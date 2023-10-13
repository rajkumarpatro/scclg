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

public partial class Minor_Project : System.Web.UI.Page
{
    sql_operations op = new sql_operations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["title"] != null)
        {
            this.Title = Request.QueryString["title"].ToString();
            if (!IsPostBack)
            {
                lbl_title.Text = Request.QueryString["title"].ToString();
                GetRecord(lbl_title.Text);
            }
        }
    }

    protected void GetRecord(string dpage)
    {
        string str_select = "SELECT TBL_PROJECT.PROJECTTYPE, TBL_PROJECT.NAME,TBL_PROJECT.DEPARTMENT, TBL_PROJECT.DESIGNATION,TBL_PROJECT.TITLE,TBL_PROJECT.DURATION,TBL_PROJECT.AMOUNT,TBL_PROJECT.FILEPATH FROM TBL_PROJECT where TBL_PROJECT.PROJECTTYPE='" + dpage.ToString() + "' order by TBL_PROJECT.PROJECTID desc";

        DataSet ds_select = op.get_dataset(str_select);

        grid_record.DataSource=ds_select.Tables[0];
        grid_record.DataBind();

        grid_record.Visible = true;

    }


}
