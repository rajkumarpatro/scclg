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
using System.Net;

public partial class AdmitCard : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                GetTopics();
            }
            catch (Exception ee)
            {

            }
        }
    }

    protected void GetTopics()
    {
        try
        {
            DataTable dt_topics = new DataTable();
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select AcardClassID,AcardClassName from tbl_AdmitCardClass where AcardClassStatus='Yes' order by DateTimeStamp DESC,AcardClassID");

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "AcardClassName";
            ddl_topic.DataValueField = "AcardClassID";
            ddl_topic.DataBind();

            ddl_topic.Items.Insert(0, new ListItem("Select Title", "0"));
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in Get Topics<br>" + ee.Message;
        }
    }

    protected void btn_Save_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (txt_enroll.Text == "")
            {
                lblInfo.Text = "Please Enter Roll No.";
            }
            else
            {
                sp = new SqlParameter[2];

                sp[0] = new SqlParameter("@AcardClassID", SqlDbType.Int);
                sp[0].Value = Convert.ToInt32(ddl_topic.SelectedValue);

                sp[1] = new SqlParameter("@AcardRollNumber", SqlDbType.VarChar, 20);
                sp[1].Value = Server.HtmlEncode(txt_enroll.Text);
                DataTable dt_result = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [AcardRollNumber] ,[AcardYear] ,[AcardPath] FROM [dbo].[tbl_AdmitCardDetails] where [AcardClassID] =  @AcardClassID and [AcardRollNumber]=@AcardRollNumber and AcardShow='Yes'", sp);

                gv_topic.DataSource = dt_result;
                gv_topic.DataBind();
            }
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Admit Card Not Available<br/>Please Visit After Some Time";
        }
    }
    protected void img_reset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AdmitCard.aspx");
    }
}
