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

public partial class ScienceCPanel : System.Web.UI.Page
{
   SqlParameter[] sp = null;
    int photo_id ;
    string saveLocation;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["iamuser"] == null)
                {
                    Response.Redirect("science_login.aspx");
                }
                else
                {
                    
                }
            }
            catch
            {
                Response.Redirect("science_login.aspx");
            }
        }
       
    }

   
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("user_management.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("update_news.aspx");
    }
   
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_facilities.aspx");
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_pastevents.aspx");
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_event_photos.aspx");
    }
    protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_toppers.aspx");
    }
    protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_videos.aspx");
    }
    protected void ImageButton13_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Result.aspx");
    }
    protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Topper_of_the_week.aspx");
    }
    protected void ImageButton10_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_faculties.aspx");
    }
    protected void ImageButton11_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_studentsection.aspx");
    }
    protected void ImageButton12_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_quicklinks.aspx");
    }
    protected void img_tenders_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("tenders.aspx");
    }
  
    protected void btn_intro_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_introduction.aspx");
    }
    protected void btn_principal_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_principal.aspx");
    }
    protected void btn_department_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_department.aspx");
    }
    protected void btn_academics_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post_academics.aspx");
    }
    protected void btn_reports_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_reports.aspx");
    }
    protected void ImageButton19_Click1(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("post_vision.aspx");
    }
    protected void ImageButton21_Click1(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Post_Upcoming_Events.aspx");
    }
    protected void img_tenders0_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Pending_SMS_Registration.aspx");
    }
    protected void img_iqac_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_IQAC.aspx");
    }
    protected void img_achievements_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_toppers.aspx");
    }
    protected void ImageButton22_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Latest_update.aspx");
    }
    protected void btn_research_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_research.aspx");
    }
    protected void img_media_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_media.aspx");
    }
    protected void btn_studentsection_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_studentsection.aspx");
    }

    protected void btn_IQAC_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_IQAC.aspx");
    }
}
