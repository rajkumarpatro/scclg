using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for WebLog
/// </summary>
public class WebLog
{
    private static sql_operations sql_op = new sql_operations();
	public WebLog()
	{
		//
		// TODO: Add constructor logic here
		//        
	}

    public static sql_operations SqlOperation()
    {
        return sql_op;
    }
}
