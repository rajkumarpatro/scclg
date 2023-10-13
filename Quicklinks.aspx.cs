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
using Ionic.Zip;
using System.Data.SqlClient;

public partial class Quicklinks : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    string my_table, my_video, my_table1, st_id;
    int i, blank_cells, row_num, pageid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            st_id = Request.QueryString["pname"];
            this.Title = st_id;
        }
        catch (Exception ee)
        {
 
        }
    }
}
