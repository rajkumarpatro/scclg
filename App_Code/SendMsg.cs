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

using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.IO;

/// <summary>
/// Summary description for SendMsg
/// </summary>
public class SendMsg
{
	public SendMsg()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void Send(string str_contacts, string str_msg)
    {
        try
        {
            string PostData = "key=45A8D41031FDBB&campaign=0&routeid=7&type=text&contacts=" + str_contacts + "&senderid=VYTPGC&msg=" + str_msg;

            var request = (HttpWebRequest)WebRequest.Create("http://msg.ravisolutions.com/app/smsapi/index.php");
            
            var data = Encoding.ASCII.GetBytes(PostData);

            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = data.Length;

            using (var stream = request.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }

            var response = (HttpWebResponse)request.GetResponse();

            var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
        }
        catch (Exception ee)
        {
 
        }
    }
}
