using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
   

   

    protected void Unnamed_Click(object sender, EventArgs e)
    {

    }
    protected void btnSubscribe_Click(object sender, EventArgs e)
    {
       // try
       // {

        //    if (subscribe.Text.Trim() == string.Empty)
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Enquiry", "alert('Please enter whatsapp number.');", true);
        //        return;
        //    }
        //    else
        //    {
        //        string sql = "insert into tbl_subscribe(whatsapp) " +
        //                    "values (@whatsapp)";
        //        OleDbCommand cmd = new OleDbCommand(sql, conn);
        //        cmd.CommandType = CommandType.Text;
        //        cmd.Parameters.AddWithValue("@whatsapp", Server.HtmlEncode(subscribe.Text));
        //        if (conn.State != ConnectionState.Open)
        //        {
        //            conn.Open();
        //        }
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Enquiry", "alert('Thanks for subscribing us.');", true);
        //        subscribe.Text = "";
        //    }
        //}
        //catch (Exception ex)
        //{
        //}
    }
    
    protected void btnSubscribe_Click1(object sender, EventArgs e)
    {

    }
}