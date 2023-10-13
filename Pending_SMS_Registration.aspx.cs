using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;


public partial class User_Control_Faculties : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("CLogin.aspx");
                }
                else
                {
                    GetData();
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
    }

    protected void GetData()
    {
        try
        {
            OleDbDataAdapter adpt_fill = new OleDbDataAdapter("SELECT tbl_sms.smsid as [ID], tbl_sms.smsname as [Student Name], smsfather as [Father Name], tbl_sms.smsclass as [Class], tbl_sms.smsmobile as [MobileNo] FROM tbl_sms where smsstatus='Not Verified' order by smsid", conn);
            DataSet ds_fill = new DataSet();
            adpt_fill.Fill(ds_fill, "tbl_fill");

            gv_record.DataSource = ds_fill.Tables["tbl_fill"];
            gv_record.DataBind();
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in GetData<br>"+ee.Message;
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
    protected void img_back_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CPanel.aspx");
    }
    protected void gv_record_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gv_record.SelectedRow;
        lbl_id.Text = row.Cells[1].Text.ToString();
        txt_name.Text = row.Cells[2].Text.ToString();
        txt_father.Text = row.Cells[3].Text.ToString();
        txt_class.Text = row.Cells[4].Text.ToString();
        txt_mobile.Text = row.Cells[5].Text.ToString();
    }
    protected void btn_verify_Click(object sender, EventArgs e)
    {
        try
        {
            op.perform_sql_operation("update tbl_sms set smsstatus='Verify' where smsid=" + lbl_id.Text + "");
            Response.Redirect("SMS-Registration.aspx");
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Verifying this Record";
        }
    }
    protected void btn_delete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            op.perform_sql_operation("delete from tbl_sms where smsid=" + lbl_id.Text + "");
            Response.Redirect("SMS-Registration.aspx");
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Delete this Record";
        }
    }
}