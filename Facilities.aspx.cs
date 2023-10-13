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
using System.Data.SqlClient;

public partial class _Pasteventsdetails : System.Web.UI.Page
{
    SqlParameter[] sp = null;

    string my_table, my_video, my_table1, st_id;
    int i, blank_cells, row_num, pageid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            st_id = Request.QueryString["pname"];

           

            DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_facility where facility_page='" + st_id.ToString() + "'");
            

            //lbl_event.Text = ds_select.Tables["tbl_select"].Rows[i]["facility_page"].ToString();
            pageid = Convert.ToInt32(dtLogin.Rows[i]["facility_id"].ToString());
            //this.Title = lbl_event.Text;
            this.Title = dtLogin.Rows[i]["facility_page"].ToString(); 

            //img_head.ImageUrl = ds_select.Tables["tbl_select"].Rows[i]["facility_img"].ToString();

            desc_content.InnerHtml =Server.HtmlDecode (dtLogin.Rows[i]["facility_description"].ToString());


            #region photos

            DataTable dtfacili = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_facility_photos where event_id=" + pageid + " order by Photo_id");
            

            my_table1 = "";

            if (dtfacili.Rows.Count > 0 && dtfacili.Rows[0][0].ToString() != "")
            {
                //lbl_photo.Visible = true;
                //lbl_photo.Text = lbl_event.Text + " Photos";

                row_num = dtfacili.Rows.Count / 3;
                blank_cells = dtfacili.Rows.Count % 3;

                for (i = 0; i < row_num; i++)
                {
                    my_table1 = my_table1 + "<div class='row'>";
                    for (int j = 0; j <= 2; j++)
                    {
                        my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'><figure><a class='fancybox' href='" + dtfacili.Rows[(i * 3) + j][2].ToString() + "' data-fancybox-group='gallery' title='" + dtfacili.Rows[(i * 3) + j][1].ToString() + "'><img src='" + dtfacili.Rows[(i * 3) + j][2].ToString() + "' border='3' class='img-responsive'/></a></figure></div>";
                    }

                    my_table1 = my_table1 + "</div>";
                    my_table1 = my_table1 + "<div class='row'><div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                }

                if (blank_cells == 1)
                {
                    my_table1 = my_table1 + "<div class='row'>";
                    for (int j = 0; j <= 0; j++)
                    {
                        my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'><figure><a class='fancybox' href='" + dtfacili.Rows[(i * 3) + j][2].ToString() + "' data-fancybox-group='gallery' title='" + dtfacili.Rows[(i * 3) + j][1].ToString() + "'><img src='" + dtfacili.Rows[(i * 3) + j][2].ToString() + "' border='3' class='img-responsive'/></a></figure></div>";
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
                        my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'><figure><a class='fancybox' href='" + dtfacili.Rows[(i * 3) + j][2].ToString() + "' data-fancybox-group='gallery' title='" + dtfacili.Rows[(i * 3) + j][1].ToString() + "'><img src='" + dtfacili.Rows[(i * 3) + j][2].ToString() + "' border='3' class='img-responsive'/></a></figure></div>";
                        my_table1 = my_table1 + "<div class='col-lg-4 col-md-4 col-sm-4'>&nbsp;</div>";
                    }

                    my_table1 = my_table1 + "</div>";
                    my_table1 = my_table1 + "<div class='row'><div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                }

                //span_photos.InnerHtml = my_table1.ToString();
            }

            #endregion

            

        }
        catch (Exception ee)
        {
 
        }
    }
}
