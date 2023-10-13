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

public partial class _Pastevents : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);

    string my_table;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["title"] != null)
            {
                OleDbDataAdapter adpt_select = new OleDbDataAdapter("select * from tbl_achievement where event_type like '"+Request.QueryString["title"]+"' order by event_id desc", conn);
                DataSet ds_select = new DataSet();
                adpt_select.Fill(ds_select, "tbl_achievement");
                my_table = "";
                if (ds_select.Tables["tbl_achievement"].Rows.Count > 0 && ds_select.Tables["tbl_achievement"].Rows[0][0].ToString() != "")
                {
                    for (int i = 0; i < ds_select.Tables["tbl_achievement"].Rows.Count; i++)
                    {                      
                        my_table += "<div class='row'>";
                        my_table += "<div class='col-lg-4 col-md-4 col-sm-4'>";
                        my_table += "<figure><a  style='color:#000;' target='_blank'><img src='" + ResolveUrl("" + ds_select.Tables["tbl_achievement"].Rows[i]["event_pic"].ToString()) + "' class='img-responsive' /></a></figure></div>";
                        my_table += "<div class='col-lg-8 col-md-8 col-sm-8'><span><h4>" + ds_select.Tables["tbl_achievement"].Rows[i]["event_name"].ToString() + "<h4></span><br><span style='color:#333; font-size:14px; line-height:1.8em;'>Year : " + ds_select.Tables["tbl_achievement"].Rows[i]["ayear"].ToString() + "<br>Date : " + ds_select.Tables["tbl_achievement"].Rows[i]["event_date"].ToString() + "<br>Type : " + ds_select.Tables["tbl_achievement"].Rows[i]["event_type"].ToString() + "</span><br>";
                        my_table += "<span style='line-height:1.8em;'>" + ds_select.Tables["tbl_achievement"].Rows[i]["event_description"] + "</span></div>";
                        my_table += "</div>";
                        my_table += "<div class='row'>";
                        my_table += "<div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                    }

                    desc_content.InnerHtml = my_table.ToString();
                }
            }
        }
        catch (Exception ee)
        {
 
        }
    }
}
