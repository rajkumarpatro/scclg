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
using System.Data.OleDb;
using System.IO;

public partial class delete_Latest_News : System.Web.UI.Page
{
   
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    string saveLocation, myUrl, linkType, displayDate;
    int Id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            getdata();
        }
    }

    protected void getdata()
    {
       
        try
        {
            OleDbDataAdapter adpt_fill = new OleDbDataAdapter("select news_Id,news_filepath from tbl_News where news_filepath<>'#'", conn);
            DataSet ds_fill = new DataSet();
            adpt_fill.Fill(ds_fill, "tbl_fill");

            news_Grid.DataSource = ds_fill.Tables["tbl_fill"];
            news_Grid.DataBind();

            
        }
        catch (Exception ee)
        {
            lblInfo.Text = "Problem in fill_grid<br>" + ee.Message;
        }
    }
    protected void btn_delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < news_Grid.Rows.Count; i++)
            {
                string path = news_Grid.Rows[i].Cells[2].Text;

                if (path != "")
                {
                    string path1 = Server.MapPath(path);
                    FileInfo file = new FileInfo(path1);
                    if (file.Exists)//check file exsit or not
                    {
                        file.Delete();
                    }
                }
            }


        }
        catch (Exception ex)
        {
            lblInfo.Text = ex.Message;
        }
    }
   

  

}
