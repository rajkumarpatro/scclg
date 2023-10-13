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

using System.Web.Script.Serialization;
using System.IO;
using System.Net;
using System.Text;


using System.Data.SqlClient;

/// <summary>
/// Summary description for Notification
/// </summary>
public class Notification
{
	public Notification()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string CheckPromotionNotification(int PromotionId)
    {
        SqlParameter[] sp = new SqlParameter[1];

        sp[0] = new SqlParameter("@PromotionId", SqlDbType.Int);
        sp[0].Value = PromotionId;

        DataTable dt_check = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select Notification from tbl_NewPromotion where PromotionId=@PromotionId", sp);

        return(dt_check.Rows[0][0].ToString());
    }

    public static void SendNormalNotification(string str_body,string str_title,string str_url,string str_topic)
    {
        try
        {
            string SERVER_API_KEY = "AAAA6qMFYsI:APA91bGiwvK4Cgbi1Ez_UoJJKrgUztL6m-eJGZLlwhOpsnalYl_xIAPGwQVSR_Xc_pErqzQmv8b-2CVyhyBTjDIc-oc5_kTHEyZpIv94ekrzfmRuMzruqLnk72yeU-ZrcCXWMuvgkr4cXLPjQSNHiBfPTvidmFJrbA";

            var SENDER_ID = "1007757386434";
            
            var value = str_body;
            WebRequest tRequest;
            tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
            tRequest.Method = "post";
            tRequest.ContentType = " application/json";
            tRequest.Headers.Add(string.Format("Authorization: key={0}", SERVER_API_KEY));

            tRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));

            // Send notification to devices which are subscribed to ravi.
            var notification_data = new
            {
                to = "/topics/"+str_topic+"",
                priority = "high",
                notification = new
                {
                    title = str_title,
                    body = str_body,
                    click_action = "Notification1",
                    sound = "notificationsound.mp3"
                },
                data = new
                {
                    title = str_title,
                    body = str_body,
                    url = str_url
                }
            };

            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(notification_data);

            //lblHello.Text = json;

            Byte[] byteArray = Encoding.UTF8.GetBytes(json);

            tRequest.ContentLength = byteArray.Length;

            Stream dataStream = tRequest.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();

            WebResponse tResponse = tRequest.GetResponse();

            dataStream = tResponse.GetResponseStream();

            StreamReader tReader = new StreamReader(dataStream);
            String sResponseFromServer = tReader.ReadToEnd();

            tReader.Close();
            dataStream.Close();
            tResponse.Close();
        }

        catch (Exception ex)
        {
            
        } 
    }
}
