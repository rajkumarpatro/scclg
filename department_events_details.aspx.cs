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
using Ionic.Zip;

public partial class department_events_details : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);

    string my_table, my_video, my_table1, st_id,did;
    int i, blank_cells, row_num;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["eid"] != null && Request.QueryString["did"] != null)
            {
                st_id = Request.QueryString["eid"];
                did = Request.QueryString["did"];

                OleDbDataAdapter adpt_select = new OleDbDataAdapter("select event_id,event_name,event_date,event_venue,event_pic,event_description,event_order from tbl_department_event where event_id=" + st_id + " and department_id ="+did+" order by event_id", conn);
                DataSet ds_select = new DataSet();
                adpt_select.Fill(ds_select, "tbl_select");

                my_table = "";

                if (ds_select.Tables["tbl_select"].Rows.Count > 0 && ds_select.Tables["tbl_select"].Rows[0][0].ToString() != "")
                {
                    my_table = my_table + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";

                    my_table = my_table + "<tr><td>";

                    lbl_event.Text = ds_select.Tables["tbl_select"].Rows[i][1].ToString();
                    lbl_title.Text = lbl_event.Text;
                    this.Title = lbl_event.Text;

                    img_caption.ImageUrl = ds_select.Tables["tbl_select"].Rows[i]["event_pic"].ToString();

                    span_story_details.InnerHtml = ds_select.Tables["tbl_select"].Rows[i]["event_description"].ToString();
                    desc_content.InnerHtml = "<h4>" + ds_select.Tables["tbl_select"].Rows[i]["event_name"].ToString() + "</h4><br><span style='color:#333; font-size:18px; line-height:1.8em;'>Venue : " + ds_select.Tables["tbl_select"].Rows[i]["event_venue"].ToString() + "<br>Date : " + ds_select.Tables["tbl_select"].Rows[i]["event_date"].ToString() + "</span>";
                }




                #region photos

                OleDbDataAdapter adpt_select1 = new OleDbDataAdapter("select * from tbl_department_photos where event_id=" + st_id + " and department_id =" + did + "  order by Photo_id", conn);
                DataSet ds_select1 = new DataSet();
                adpt_select1.Fill(ds_select1, "tbl_select1");

                my_table1 = "";

                if (ds_select1.Tables["tbl_select1"].Rows.Count > 0 && ds_select1.Tables["tbl_select1"].Rows[0][0].ToString() != "" && ds_select1.Tables["tbl_select1"].Rows[0][1].ToString() != "")
                {
                    lbl_photo.Visible = true;
                    lbl_photo.Text = lbl_event.Text + " Photos";

                    row_num = ds_select1.Tables["tbl_select1"].Rows.Count / 3;
                    blank_cells = ds_select1.Tables["tbl_select1"].Rows.Count % 3;

                    for (i = 0; i < row_num; i++)
                    {
                        my_table1 = my_table1 + "<div class='row'>";
                        for (int j = 0; j <= 2; j++)
                        {
                            my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'><figure><a class='fancybox' href='" + ResolveUrl(""+ ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j]["filepath"].ToString()) + "' data-fancybox-group='gallery' title='" +  ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j][2].ToString() + "'><img class='img-responsive' src='" + ResolveUrl("" + ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j]["filepath"].ToString()) + "' border='3'/></a></figure></div>";
                        }

                        my_table1 = my_table1 + "</div>";
                        my_table1 = my_table1 + "<div class='row'><div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                    }

                    if (blank_cells == 1)
                    {
                        my_table1 = my_table1 + "<div class='row'>";
                        for (int j = 0; j <= 0; j++)
                        {
                            my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'><figure><a class='fancybox' href='" + ResolveUrl(""+ ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j]["filepath"].ToString()) + "' data-fancybox-group='gallery' title='" + ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j][2].ToString() + "'><img class='img-responsive' src='" + ResolveUrl(""+ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j]["filepath"].ToString()) + "' border='3'/></a></figure></div>";
                            my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'>&nbsp;</div>";
                            my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'>&nbsp;</div>";
                        }

                        my_table1 = my_table1 + "</div>";
                        my_table1 = my_table1 + "<div class='row'><div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                    }
                    else if (blank_cells == 2)
                    {
                        my_table1 = my_table1 + "<tr>";
                        for (int j = 0; j <= 1; j++)
                        {
                            my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'><figure><a class='fancybox' href='" + ResolveUrl(""+ ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j]["filepath"].ToString()) + "' data-fancybox-group='gallery' title='" + ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j][1].ToString() + "'><img class='img-responsive' src='" + ResolveUrl("" + ds_select1.Tables["tbl_select1"].Rows[(i * 3) + j]["filepath"].ToString()) + "' border='3'/></a></figure></div>";
                            my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'>&nbsp;</div>";
                        }

                        my_table1 = my_table1 + "</div>";
                        my_table1 = my_table1 + "<div class='row'><div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                    }

                    desc_content1.InnerHtml = my_table1.ToString();
                }

                #endregion



            }
        }
        catch (Exception ee)
        {

        }
    }

    protected void lnk_download_Click(object sender, EventArgs e)
    {
        try
        {
            //lbl_type.Text = Request.QueryString["type"];

            OleDbDataAdapter adpt_select = new OleDbDataAdapter("select * from tbl_department_photos where event_id=" + st_id + " and department_id ="+did+" order by Photo_id", conn);
            DataSet ds_select = new DataSet();
            adpt_select.Fill(ds_select, "tbl_select");

            my_table = "";

            if (ds_select.Tables["tbl_select"].Rows.Count > 0 && ds_select.Tables["tbl_select"].Rows[0][0].ToString() != "" && ds_select.Tables["tbl_select"].Rows[0][1].ToString() != "")
            {
                using (ZipFile zip = new ZipFile())
                {

                    for (i = 0; i < ds_select.Tables["tbl_select"].Rows.Count; i++)
                    {
                        string filePath = Server.MapPath(ds_select.Tables["tbl_select"].Rows[i]["filepath"].ToString());
                        zip.AddFile(filePath, "files");
                    }

                    Response.Clear();
                    Response.AddHeader("Content-Disposition", "attachment; filename=DownloadedFile.zip");
                    Response.ContentType = "application/zip";
                    zip.Save(Response.OutputStream);
                    Response.End();

                }
            }
        }
        catch (Exception ee)
        {

        }
    }
}
