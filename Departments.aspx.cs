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

public partial class _Pasteventsdetails : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);

    string my_table, my_video, my_table1, st_id;
    int i, blank_cells, row_num, pageid;
    sql_operations op = new sql_operations();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["dp"] != null)
            {
                st_id = Request.QueryString["dp"];

                if (st_id == "IQAC")
                {
                    lbl_Department_of.Visible = false;
                    lbl_Department_of1.Visible = false;
                }

                lblCategoryName.Text = st_id;
                GetTopics(st_id);
                lbl_title.Text = st_id;
                lbldepname.Text = st_id;

                this.Title = st_id.ToString() + " Department | Govt. V.Y.T.PG. Autonomous College Durg | Best Govt. College in Durg";
                object did = GetDepartmentID(lbldepname.Text);
              
                ShowAllTopics(did);
                
                #region Faculties
                DataTable dt = new DataTable();
                dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(),CommandType.Text,"select * from tbl_faculty where faculty_department='" + st_id.ToString() + "' order by faculty_order, faculty_id");

                if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "")
                {
                   gv_faculty.DataSource = dt;
                    gv_faculty.DataBind();

                    HtmlGenericControl links = new HtmlGenericControl();
                    links.InnerHtml = "<li class='list-categories__item'><a  class='list-categories__link' href='#Faculty Members'>Faculty Members</a>";

                    links.InnerHtml = "<li class='list-categories__item'>" +
                                                       "<a class='list-categories__link' href='#Faculty Members'>" +
                                                           "<span class='list-categories__name' >Faculty Members</span>" +
                                                               "</a>" +
                                                           "</li>";
                    facultyph.Controls.Add(links);

                    

                    

                    HtmlGenericControl fhead = new HtmlGenericControl();
                    if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "")
                    {
                        string facultyhead = "";
                        facultyhead += "<a name='Faculty Members'>Faculty Members</a>";
                        fhead.InnerHtml = facultyhead;
                        lbl_faculty.Controls.Add(fhead);                      
                    }
                }
                #endregion

                #region Load Events
                LoadEvents(did);
                #endregion

                #region Load Achievements
                LoadAchievements(did);
                #endregion
            }

        }
        catch (Exception ee)
        {
 
        }
    }

    private void LoadEvents(object deptid)
    {
        try
        {

            HtmlGenericControl ctrlevent = new HtmlGenericControl();

            string eventhead = "";
            eventhead += "<a name='" + st_id.ToString() + " Department Events" + "'>" + st_id.ToString() + " Department Events" + "</a>";
            ctrlevent.InnerHtml = eventhead;
            event_holder.Controls.Add(ctrlevent);

            DataTable dt_events = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_department_event where department_id = " + deptid + " order by event_id desc");
            
            my_table="";

            if (dt_events.Rows.Count > 0 && dt_events.Rows[0][0].ToString() != "")
            {
                event_holder.Visible = true;

                HtmlGenericControl links1 = new HtmlGenericControl();
                links1.InnerHtml = "<li class='list-categories__item'>" +
                                                       "<a class='list-categories__link' href='#" + st_id + " Department Events'>" +
                                                           "<span class='list-categories__name' >Events</span>" +
                                                               "</a>" +
                                                           "</li>";
                eventph.Controls.Add(links1);
                my_table += "<div class='container-fluid'>";
                for(int i=0;i<dt_events.Rows.Count;i++)
                {
                    my_table += "<div class='container-fluid'>";

                    my_table += "<div class='row'>";
                    my_table += "<div class='col-lg-4 col-md-4 col-sm-4'>";
                    my_table += "<figure><a href='department_events_details.aspx?eid=" + dt_events.Rows[i]["event_id"].ToString() + "&did=" + deptid + "' style='color:#000;' target='_blank'><img src='" + ResolveUrl(""+ dt_events.Rows[i]["event_pic"].ToString()) + "' class='img-responsive' /></a></figure></div>";
                    my_table += "<div class='col-lg-8 col-md-8 col-sm-8'><span><h4>" + dt_events.Rows[i]["event_name"].ToString() + "<h4></span><br><span style='color:#333; font-size:14px; line-height:1.8em;'>Venue : " + dt_events.Rows[i]["event_venue"].ToString() + "<br>Date : " + dt_events.Rows[i]["event_date"].ToString() + "</span><br>";
                    my_table += "<span style='line-height:1.8em;'><a href='department_events_details.aspx?eid=" + dt_events.Rows[i]["event_id"].ToString() + "&did=" + deptid + "' style='color:#000;' target='_blank'>Click here for details</a></span></div>";
                    my_table += "</div>";
                    my_table += "</div>";

                    my_table += "<div class='container-fluid'>";
                    my_table += "<div class='row'>";
                    my_table += "<div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                    my_table += "</div>";

                }
                my_table += "</div>";
                
                desc_content1.InnerHtml = my_table.ToString();
            }
        }
        catch (Exception ee)
        {
 
        }
    }

    private void LoadAchievements(object deptid)
    {
        try
        {
            DataTable dt_achievements = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_achievement where department = '" + st_id + "' order by event_id desc");

            if (dt_achievements.Rows.Count > 0 && dt_achievements.Rows[0][0].ToString() != "")
            {
                HtmlGenericControl links2 = new HtmlGenericControl();
                links2.InnerHtml = "<li class='list-categories__item'>" +
                                                                  "<a class='list-categories__link' href='#" + st_id + " Department Achievements'>" +
                                                                      "<span class='list-categories__name' >Achievements</span>" +
                                                                          "</a>" +
                                                                      "</li>";
                achievementph.Controls.Add(links2);

                HtmlGenericControl ctrlevent = new HtmlGenericControl();
                string eventhead = "";
                eventhead += "<a name='" + st_id.ToString() + " Department Achievements" + "'>" + st_id.ToString() + " Department Achievement" + "</a>";
                ctrlevent.InnerHtml = eventhead;
               ach_holder.Controls.Add(ctrlevent);


                my_table = "";

                if (dt_achievements.Rows.Count > 0 && dt_achievements.Rows[0][0].ToString() != "")
                {
                  
                    for (int i = 0; i < dt_achievements.Rows.Count; i++)
                    {
                        my_table += "<div class='container-fluid'>";
                        my_table += "<div class='row'>";
                        my_table += "<div class='col-lg-4 col-md-4 col-sm-4'>";
                        my_table += "<figure><a  style='color:#000;' target='_blank'><img src='" + ResolveUrl("" + dt_achievements.Rows[i]["event_pic"].ToString()) + "' class='img-responsive' /></a></figure></div>";
                        my_table += "<div class='col-lg-8 col-md-8 col-sm-8'><span><h4>" + dt_achievements.Rows[i]["event_name"].ToString() + "<h4></span><br><span style='color:#333; font-size:14px; line-height:1.8em;'>Year : " + dt_achievements.Rows[i]["ayear"].ToString() + "<br>Date : " + dt_achievements.Rows[i]["event_date"].ToString() + "<br>Type : " + dt_achievements.Rows[i]["event_type"].ToString() + "</span><br>";
                        my_table += "<span style='line-height:1.8em;'>" + dt_achievements.Rows[i]["event_description"] + "</span></div>";
                        my_table += "</div>";
                        my_table += "</div>";
                        my_table += "<div class='container-fluid'>";
                        my_table += "<div class='row'>";
                        my_table += "<div class='col-lg-12 col-md-12 col-sm-12'>&nbsp;</div></div>";
                        my_table += "</div>";

                    }
                    desc_content2.InnerHtml = my_table.ToString();
                }
            }
        }
        catch (Exception ee)
        {

        }
    }

    private void ShowAllTopics(object deptid)
    {
        string sql = @"SELECT tbl_department_details.topic_id, tbl_department_details.department_description
FROM tbl_department_details INNER JOIN tbl_department_topic ON (tbl_department_details.topic_id = tbl_department_topic.topic_id) AND (tbl_department_details.department_id = tbl_department_topic.department_id)
WHERE (((tbl_department_details.department_id)=" + deptid + ")) ORDER BY topic_order, tbl_department_details.topic_id";

        DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, sql);
       if (dt.Rows.Count > 0)
       {
           string topics = "";
           foreach (DataRow dr in dt.Rows)
           {
               string topicname = FindTopicName(dr["topic_id"], deptid);
               topics += "<div style='margin-bottom:20px;'><center><h1 class='font-weight-600 mt-0 font-28 line-bottom dept_ach'><a name='" + topicname + "'>" + topicname + "</a></h1></center>";
               topics += "" + Server.HtmlDecode(dr["department_description"].ToString()) + "</div>";
           }
           HtmlGenericControl control = new HtmlGenericControl();
           control.InnerHtml = topics;

           desc_content.Controls.Add(control);
       }
    }

    private string FindTopicName(object topicid,object deptid)
    {
        DataTable topicName = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text,"select topic_name from tbl_department_topic where topic_id = " + topicid + " and department_id=" + deptid + " order by topic_order, topic_id");
        return "" + topicName.Rows[0]["topic_name"];
    }

    private void GetTopics(string dept)
    {
        object deptid = GetDepartmentID(dept);

        DataTable dt = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text,"select topic_id,topic_name from tbl_department_topic where department_id = " + deptid + " order by topic_order, topic_id");

        if (dt.Rows.Count > 0)
        {
            HtmlGenericControl control = new HtmlGenericControl();

            string categories = "";
            foreach (DataRow dr in dt.Rows)
            {
                string topicname = FindTopicName(dr["topic_id"], deptid);
                categories += "<li class='list-categories__item'>" +
                                            "<a class='list-categories__link' href='" + ResolveUrl("Departments.aspx?dp=" + dept + "#" + topicname) + "'>" +
                                                "<span class='list-categories__name' >" + dr["topic_name"] + " </span>" +
                                                    "</a>" +
                                                "</li>";
            }

            control.InnerHtml = categories;
            placeCategory.Controls.Add(control);
        }
    }

    private object GetDepartmentID(string str)
    {
        string str_query = "select department_id from tbl_department where department_name like '" + str + "'";

        object deptid = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, str_query);
        return "" + deptid;
    }

    protected void btnViewProfile_Click(object sender, EventArgs e)
    {

    }
    protected void gv_faculty_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Profile")
        {
            string argument = "" + e.CommandArgument;
            Response.Redirect("FacultyProfile.aspx?fid=" + argument);
        }
    }
}
