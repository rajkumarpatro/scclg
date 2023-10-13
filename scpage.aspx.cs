using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class scpage : System.Web.UI.Page
{
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string page_name = Request.QueryString["PageName"].ToString();
            this.Title = page_name + " - Govt. V.Y.T. PG AUTONOMOUS COLLEGE,DURG";
        }
        catch (Exception ee)
        {

        }
    }
}