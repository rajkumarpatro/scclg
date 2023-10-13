using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class contact_us : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "insert into tbl_enquiry(_name,_phone,msg,viewed) " +
                "values (@name,@phone,@msg,'0')";
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@name", Server.HtmlEncode(name.Value));
            cmd.Parameters.AddWithValue("@phone", Server.HtmlEncode(phone.Value));
            cmd.Parameters.AddWithValue("@msg", Server.HtmlEncode(comments.Value));

            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            conn.Close();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Enquiry", "alert('Thanks for contacting us.We will reach to you shortly.');", true);

            Clear();
        }
        catch (Exception)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Enquiry", "alert('Form could not be submitted successfully.');", true);
        }
    }

    private void Clear()
    {
        name.Value = "";
        phone.Value = "";
        comments.Value = "";
        name.Focus();
    }
}