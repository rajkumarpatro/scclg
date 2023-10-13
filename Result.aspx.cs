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

public partial class introduction : System.Web.UI.Page
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
            dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select ResultClassID,ResultClassName from tbl_ResultClassMaster where ResultClassStatus='Yes' order by DateTimeStamp DESC,ResultClassID");

            ddl_topic.DataSource = dt_topics;
            ddl_topic.DataTextField = "ResultClassName";
            ddl_topic.DataValueField = "ResultClassID";
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

                sp[0] = new SqlParameter("@ResultClassID", SqlDbType.Int);
                sp[0].Value = Convert.ToInt32(ddl_topic.SelectedValue);

                sp[1] = new SqlParameter("@ResultRollNumber", SqlDbType.VarChar, 20);
                sp[1].Value = Server.HtmlEncode(txt_enroll.Text);
                DataTable dt_result = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [ResultRollNumber] ,[ResultYear] ,[ResultPath] FROM [dbo].[tbl_ResultDetails] where [ResultClassID] =  @ResultClassID and [ResultRollNumber]=@ResultRollNumber", sp);

                gv_topic.DataSource = dt_result;
                gv_topic.DataBind();

                //Response.Redirect("http://govtsciencecollegedurg.ac.in/" + dt_result.Rows[0]["ResultPath"].ToString());

                //string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"600px\">";
                //embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
                //embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                //embed += "</object>";
                //ltEmbed.Text = string.Format(embed, ResolveUrl("http://govtsciencecollegedurg.ac.in/" + dt_result.Rows[0]["ResultPath"].ToString()));

                //ltEmbed.Text = "<iframe src='http://govtsciencecollegedurg.ac.in/" + dt_result.Rows[0]["ResultPath"].ToString() + "' width='100%' height='600px' scrolling='no' frameborder='0'></iframe>";

            }
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Result Not Available<br/>Please Visit After Some Time";
        }
    }
    protected void img_reset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Result.aspx");
    }
}
