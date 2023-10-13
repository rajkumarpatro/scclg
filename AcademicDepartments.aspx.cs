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

public partial class AcademicDepartments : System.Web.UI.Page
{
     SqlParameter[] sp = null;
    
    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
        }
        catch (Exception ee)
        {
            
        }
    }
}
