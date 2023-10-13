using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;


using System.Xml;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public XmlElement GetNewsNotice()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_news order by news_Id", conn);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        // Create an instance of DataSet.
        DataSet ds= new DataSet();
        da.Fill(ds);
        conn.Close();
        // Return the DataSet as an XmlElement.
        XmlDataDocument xmldata = new XmlDataDocument(ds);
        XmlElement xmlElement = xmldata.DocumentElement;
        return xmlElement;
    }

    [WebMethod]
    public XmlElement GetAchievers()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_success_story order by story_id", conn);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        // Create an instance of DataSet.
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        // Return the DataSet as an XmlElement.
        XmlDataDocument xmldata = new XmlDataDocument(ds);
        XmlElement xmlElement = xmldata.DocumentElement;
        return xmlElement;
    }

    [WebMethod]
    public XmlElement GetUpdates()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_site_updates order by update_id desc", conn);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        // Create an instance of DataSet.
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        // Return the DataSet as an XmlElement.
        XmlDataDocument xmldata = new XmlDataDocument(ds);
        XmlElement xmlElement = xmldata.DocumentElement;
        return xmlElement;
    }
}

