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

public partial class latest_updates : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        string str_news = "";
        #region latest_news

        OleDbDataAdapter adpt_news = new OleDbDataAdapter("select * from tbl_news1 order by news_Id desc", conn);
        DataSet ds_news = new DataSet();
        adpt_news.Fill(ds_news, "tbl_news");

        if (ds_news.Tables["tbl_news"].Rows.Count > 0 && ds_news.Tables["tbl_news"].Rows[0][0].ToString() != "")
        {
            str_news = str_news + "<marquee direction='left' scrollamount='3'  onMouseOver='this.setAttribute('scrollamount', 0, 0);' onMouseOut='this.setAttribute('scrollamount', 3, 0);'>";
            for (int i = 0; i < ds_news.Tables["tbl_news"].Rows.Count; i++)
            {
                if (ds_news.Tables["tbl_news"].Rows[i][5].ToString() == "File")
                {
                    str_news = str_news + "<span style='color: #fff; font-family: Calibri; font-size: 16px;'><a href='" + ds_news.Tables["tbl_news"].Rows[i][3].ToString() + "' target='_blank' style='color:#fff;'><img src='images/new1.gif' border='0' width='30' height='10'> " + ds_news.Tables["tbl_news"].Rows[i][2].ToString() + "</a> &nbsp; &nbsp; &nbsp; &nbsp;</span>";
                }
                else if (ds_news.Tables["tbl_news"].Rows[i][5].ToString() == "URL")
                {
                    str_news = str_news + "<span style='color: #fff; font-family: Calibri; font-size: 16px;'><a href='" + ds_news.Tables["tbl_news"].Rows[i][4].ToString() + "' target='_blank' style='color:#fff;'><img src='images/new1.gif' border='0' width='30' height='10'> " + ds_news.Tables["tbl_news"].Rows[i][2].ToString() + "</a> &nbsp; &nbsp; &nbsp; &nbsp;</span>";
                }
                else if (ds_news.Tables["tbl_news"].Rows[i][5].ToString() == "#")
                {
                    str_news = str_news + "<span style='color: #fff; font-family: Calibri; font-size: 16px;'><img src='images/new1.gif' border='0' width='30' height='10'> " + ds_news.Tables["tbl_news"].Rows[i][2].ToString() + " &nbsp; &nbsp; &nbsp; &nbsp;</span>";
                }
            }
            str_news = str_news + "</marquee>";

            latest_news.InnerHtml = str_news.ToString();
        }

        #endregion
    }
}
