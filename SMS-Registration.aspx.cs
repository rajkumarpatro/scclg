using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class User_Control_Faculties : System.Web.UI.Page
{
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

    protected void btn_reset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SMS-Registration.aspx");
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            op.perform_sql_operation("insert into tbl_sms values(" + op.generate_id("select max(smsid) from tbl_sms") + ",'" + Server.HtmlEncode(txt_name.Text) + "','" + Server.HtmlEncode(txt_father.Text) + "','" + Server.HtmlEncode(txt_class.Text) + "','" + Server.HtmlEncode(txt_mobile.Text) + "','Not Verified')");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('You are registered successfully, we will be in touch with you')", true);

            txt_mobile.Text = "";
            txt_class.Text = "";
            txt_father.Text = "";
            txt_name.Text = "";

            lblInfo.Text="रजिस्ट्रेशन के लिए धन्यवाद, आपकी जानकारी सुरक्षित कर ली गई है|";
        }
        catch (Exception ee)
        {
            lblInfo.Text = "There is some problem to save you record, Please contact to College Office";
        }
    }
}