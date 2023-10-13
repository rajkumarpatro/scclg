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

public partial class query_fire : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataAdapter adpt_get = new SqlDataAdapter(txt_query.Text, conn);
            DataSet ds_get = new DataSet();
            adpt_get.Fill(ds_get, "tbl_get");

            GridView1.DataSource = ds_get.Tables["tbl_get"];
            GridView1.DataBind();

            lbl_count.Text = ds_get.Tables["tbl_get"].Rows.Count.ToString();

            lbl_info.Text = "Success";
        }
        catch (Exception ee)
        {
            lbl_info.Text = "Problem <br>" + ee.Message;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataAdapter adpt_get = new SqlDataAdapter(txt_query.Text, conn);
            DataSet ds_get = new DataSet();
            adpt_get.Fill(ds_get, "tbl_get");

            
            lbl_info.Text = "Success action";
        }
        catch (Exception ee)
        {
            lbl_info.Text = "Problem <br>" + ee.Message;
        }
    }
}
