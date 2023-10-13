using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl control = new HtmlGenericControl();
        OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
        if (!IsPostBack)
        {
            //placeHolderLatestNews
            OleDbDataAdapter adpt_news = new OleDbDataAdapter("select top 10 * from tbl_news1 order by news_Id desc", conn);
            DataSet ds_news = new DataSet();
            adpt_news.Fill(ds_news, "tbl_news");
            if (ds_news.Tables["tbl_news"].Rows.Count > 0 && ds_news.Tables["tbl_news"].Rows[0][0].ToString() != "")
            {
                string str_news = "";
                for (int i = 0; i < ds_news.Tables["tbl_news"].Rows.Count; i++)
                {
                    if (ds_news.Tables["tbl_news"].Rows[i][5].ToString() == "File")
                    {
                        str_news = str_news + "<span style='color: #f6f944; font-family: Calibri; font-size: 14px;'><a href='" + ds_news.Tables["tbl_news"].Rows[i][3].ToString() + "' target='_blank' style='color:#f6f944;'><img src='images/new1.gif' border='0' width='30' height='10'> " + ds_news.Tables["tbl_news"].Rows[i][2].ToString() + "</a> &nbsp; &nbsp; &nbsp; &nbsp;</span>";
                    }
                    else if (ds_news.Tables["tbl_news"].Rows[i][5].ToString() == "URL")
                    {
                        str_news = str_news + "<span style='color: #f6f944; font-family: Calibri; font-size: 14px;'><a href='" + ds_news.Tables["tbl_news"].Rows[i][4].ToString() + "' target='_blank' style='color:#f6f944;'><img src='images/new1.gif' border='0' width='30' height='10'> " + ds_news.Tables["tbl_news"].Rows[i][2].ToString() + "</a> &nbsp; &nbsp; &nbsp; &nbsp;</span>";
                    }
                    else if (ds_news.Tables["tbl_news"].Rows[i][5].ToString() == "#")
                    {
                        str_news = str_news + "<span style='color: #f6f944; font-family: Calibri; font-size: 14px;'><img src='assets/images/new1.gif' border='0' width='30' height='10'> " + ds_news.Tables["tbl_news"].Rows[i][2].ToString() + " &nbsp; &nbsp; &nbsp; &nbsp;</span>";
                    }
                }
                control.InnerHtml = str_news;
                //placeHolderLatestNews.Controls.Add(control);
            }
        }
    }
}
