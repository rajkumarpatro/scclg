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

public partial class CPanel : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);
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
                   Response.Redirect("CLogin.aspx");
                }
                else
                {
                    lbl_user.Text = "Hello " + Session["iamuser"].ToString();
                    
                }
            }
            catch
            {
                Response.Redirect("CLogin.aspx");
            }
        }
       
    }

    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("user_management.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Latest-News.aspx");
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
        Response.Redirect("Latest_update.aspx");
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
        Response.Redirect("post_achievements.aspx");
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
    protected void img_research_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_ProjectReport.aspx");
    }
    protected void img_educational_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Educational-Program.aspx");
    }
    protected void img_achievements_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_achievements.aspx");
    }
    protected void img_media_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post_MagazinePressNews.aspx");
    }
    protected void img_instruments_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Post-Scientific-Research-Facilities.aspx");
    }
    protected void img_ass_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_assignment.aspx");
    }
    protected void img_syllabus_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_roll_list.aspx");
    }
    protected void img_questionpaper_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_questionpaper.aspx");
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_feedback_from_alumni.aspx");
    }
    protected void parents_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_parents_feedback_form.aspx");
    }
    protected void Students_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_students_feedback_form.aspx");
    }
    protected void Teacher_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_students_feedback_form_about_Teachers.aspx");
    }
    protected void video_gallery_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("post_video.aspx");
    }
    protected void post_assign_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("poststudentsassignments.aspx");
    }
    protected void alumini_Click(object sender, EventArgs e)
    {
        Response.Redirect("Check_Alumni_Registration.aspx");
    }
    protected void post_examanswer_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ExamAnswerSheets.aspx");
    }
    protected void dept_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("dept_generate_master.aspx");
    }
}
