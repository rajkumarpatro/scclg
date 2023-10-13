<%@ Page Title="Govt College Akaltara | Govt. Dr. Indrajeet Singh College | Govt College Janjgir Champa" Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="College.aspx.cs" Inherits="College" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="source/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Add fancyBox main JS and CSS files -->
    <script type="text/javascript" src="source/jquery.fancybox.js?v=2.1.5"></script>
    <link rel="stylesheet" type="text/css" href="source/jquery.fancybox.css?v=2.1.5" media="screen" />

    <!-- Add Button helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
    <script type="text/javascript" src="source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

    <!-- Add Thumbnail helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <script type="text/javascript" src="source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

    <!-- Add Media helper (this is optional) -->
    <script type="text/javascript" src="source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

    <style>
        .rtd .container-fluid {
            padding-left: 0px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             *  Simple image gallery. Uses default settings
             */

            $('.fancybox').fancybox();

            /*
             *  Different effects
             */

            // Change title type, overlay closing speed
            $(".fancybox-effects-a").fancybox({
                helpers: {
                    title: {
                        type: 'outside'
                    },
                    overlay: {
                        speedOut: 0
                    }
                }
            });

            // Disable opening and closing animations, change title type
            $(".fancybox-effects-b").fancybox({
                openEffect: 'none',
                closeEffect: 'none',

                helpers: {
                    title: {
                        type: 'over'
                    }
                }
            });

            // Set custom style, close if clicked, change title type and overlay color
            $(".fancybox-effects-c").fancybox({
                wrapCSS: 'fancybox-custom',
                closeClick: true,

                openEffect: 'none',

                helpers: {
                    title: {
                        type: 'inside'
                    },
                    overlay: {
                        css: {
                            'background': 'rgba(238,238,238,0.85)'
                        }
                    }
                }
            });

            // Remove padding, set opening and closing animations, close if clicked and disable overlay
            $(".fancybox-effects-d").fancybox({
                padding: 0,

                openEffect: 'elastic',
                openSpeed: 150,

                closeEffect: 'elastic',
                closeSpeed: 150,

                closeClick: true,

                helpers: {
                    overlay: null
                }
            });

            /*
             *  Button helper. Disable animations, hide close button, change title type and content
             */

            $('.fancybox-buttons').fancybox({
                openEffect: 'none',
                closeEffect: 'none',

                prevEffect: 'none',
                nextEffect: 'none',

                closeBtn: false,

                helpers: {
                    title: {
                        type: 'inside'
                    },
                    buttons: {}
                },

                afterLoad: function () {
                    this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
                }
            });


            /*
             *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
             */

            $('.fancybox-thumbs').fancybox({
                prevEffect: 'none',
                nextEffect: 'none',

                closeBtn: false,
                arrows: false,
                nextClick: true,

                helpers: {
                    thumbs: {
                        width: 50,
                        height: 50
                    }
                }
            });

            /*
             *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
            */
            $('.fancybox-media')
                .attr('rel', 'media-gallery')
                .fancybox({
                    openEffect: 'none',
                    closeEffect: 'none',
                    prevEffect: 'none',
                    nextEffect: 'none',

                    arrows: false,
                    helpers: {
                        media: {},
                        buttons: {}
                    }
                });


            $("#fancybox-manual-b").click(function () {
                $.fancybox.open({
                    href: 'iframe.html',
                    type: 'iframe',
                    padding: 1
                });
            });

            $("#fancybox-manual-c").click(function () {
                $.fancybox.open([
                    {

                    }
                ], {
                    helpers: {
                        thumbs: {
                            width: 75,
                            height: 50
                        }
                    }
                });
            });


        });
    </script>

    <style>
        .dept_ach {
            margin: 20px;
        }
    </style>
    <style>
        blink {
            animation: blinker 0.9s linear infinite;
            color: #f00;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }

        .blink-one {
            animation: blinker-one 1s linear infinite;
        }

        @keyframes blinker-one {
            0% {
                opacity: 0;
            }
        }

        .blink-two {
            animation: blinker-two 1.4s linear infinite;
        }

        @keyframes blinker-two {
            100% {
                opacity: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%
        //string page_name = RouteData.Values["PageName"].ToString();
        string page_name = Request.QueryString["PageName"].ToString();
        string actual_url = page_name;
        string topic_name = "";
        //page_name = page_name.Replace("-", " ");
    %>

    <div class="wrap-title-page">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page"><%= page_name %></h1>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->





    <section class="rtd">
        <div class="container-fluid">

            <div class="row">

                <div class="element-size-100">


                    <%-- <%
                                    
                        SqlParameter[] sp_news = new SqlParameter[1];
                        sp_news[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                        sp_news[0].Value = page_name;



                        DataTable dsUpdates = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT TBL_LATEST_UPDATE.NEWS_ID, TBL_LATEST_UPDATE.NEWS_TITLE, TBL_LATEST_UPDATE.NEWS_SECTION, TBL_LATEST_UPDATE.NEWS_FILEPATH, TBL_LATEST_UPDATE.NEWS_LINK, TBL_LATEST_UPDATE.NEWS_LINKTYPE, TBL_LATEST_NEWS_DEPARTMENT.DEPARTMENT_ID, TBL_COLLEGE_PAGE.PAGE_NAME,  FORMAT(TBL_LATEST_UPDATE.NEWS_DATE,'dd-MM-yyyy') as NEWS_DATE
FROM (TBL_LATEST_UPDATE INNER JOIN TBL_LATEST_NEWS_DEPARTMENT ON TBL_LATEST_UPDATE.NEWS_ID = TBL_LATEST_NEWS_DEPARTMENT.NEWS_ID) INNER JOIN TBL_COLLEGE_PAGE ON TBL_LATEST_NEWS_DEPARTMENT.DEPARTMENT_ID = TBL_COLLEGE_PAGE.PAGE_ID WHERE TBL_COLLEGE_PAGE.PAGE_NAME=@PAGE_NAME ORDER BY TBL_LATEST_UPDATE.NEWS_DATE DESC", sp_news);
                        if (dsUpdates.Rows.Count > 0)
                        {
                    %>
                    <div class="col-md-12" style="margin-bottom: 15px;">
                        <div class="news-ticker" style="margin-bottom: 15px; margin-top: 10px;">
                            <div class="col-md-3">
                                <span class="button-4">Departmental News</span>
                            </div>
                            <div class="col-md-9">
                                <div class="slides">

                                    <marquee direction="left" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
                                          
                    <%
                                string[] months = { "JAN", "FEB", "MAR", "APR", "MAY", "JUNE", "JULY", "AUG", "SEP", "OCT", "NOV", "DEC" };
                                if (dsUpdates.Rows.Count > 0)
                                {

                                    int countnews = 1;

                                    foreach (DataRow dr in dsUpdates.Rows)
                                    {
                                        if (countnews < 6)
                                        {
                                            DateTime newsDate = DateTime.ParseExact("" + dr["news_Date"], "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                           
                         %>

            <%
                                               if (dr["news_LinkType"].ToString().Equals("URL") || dr["news_LinkType"].ToString().Equals("File"))
                                               {
                                                   if (dr["news_LinkType"].ToString().Equals("URL"))
                                                   {
                                    %>
                                    <img src="images/gif_new19.gif" />&nbsp;<a href='<%= dr["news_Link"] %>' target="_blank">  <%= dr["news_Title"]%> &nbsp;<span style="color:#f00;"><%= newsDate.Day %>-<%= months[newsDate.Month-1] %>-<%= newsDate.Year %></span> </a>  
                                
                                    <%
                                    }
                                    else
                                    {
                                %>
                                    <img src="images/gif_new19.gif" />  &nbsp;<a href='<%= dr["news_filepath"] %>' target="_blank">  <%= dr["news_Title"]%> <span style="color:#f00;"><%= newsDate.Day %>-<%= months[newsDate.Month-1] %>-<%= newsDate.Year %></span></a>
                                    <%
                                }
                                }
                                else
                                {
                                %>
                               <img src="images/gif_new19.gif" />&nbsp; <a href='#'><%= dr["news_Title"]%> <span style="color:#f00;"><%= newsDate.Day %>-<%= months[newsDate.Month-1] %>-<%= newsDate.Year %></span>     </a>                                        
                                <%
                            }                           
                           %>                 
                        &nbsp; &nbsp; &nbsp;
               
                                               <%
                        
                                           }
                                           countnews++;
                                       }
                                   }
                         %></marquee>

                                </div>
                            </div>



                        </div>
                    </div>

                    <%
                            }
                    %>--%>

                    <div class="row">

                        <%

                            SqlParameter[] sp_topic = new SqlParameter[1];
                            sp_topic[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                            sp_topic[0].Value = Server.HtmlEncode(page_name);

                            string str_query = @"SELECT TBL_COLLEGE_PAGE.PAGE_ID, TBL_COLLEGE_PAGE.PAGE_NAME, TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID, TBL_COLLEGE_PAGE_TOPIC.TOPIC_NAME,IS_DEPARTMENT 
                        FROM TBL_COLLEGE_PAGE INNER JOIN TBL_COLLEGE_PAGE_TOPIC ON TBL_COLLEGE_PAGE.PAGE_ID = TBL_COLLEGE_PAGE_TOPIC.PAGE_ID where PAGE_NAME=@PAGE_NAME order by TOPIC_ID";

                            DataTable dt_topics = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp_topic);

                            string str_col_size = "col-md-12 main-content";

                            if (dt_topics.Rows.Count > 1)
                            {
                                str_col_size = "col-xs-12 col-sm-12 col-md-9 main-content";
                        %>
                        <div class="col-md-3">
                            <aside class="sidebar sidebar_mod-a" id="content_left">
                                <section class="find-course find-course_mod-a">
                                    <h2 class="find-course__title"><i class="icon stroke icon-Search"></i>Major Topics</h2>
                                    <ul class="list-information list-unstyled">
                                        <%

                                            if (dt_topics.Rows.Count > 0)
                                            {
                                                foreach (DataRow dr in dt_topics.Rows)
                                                {


                                        %>
                                        <li class="list-information__item"><a href="College.aspx?PageName=<%= actual_url %>&topicid=<%= dr["TOPIC_ID"] %>" style="color: #FFFFFF"><span class="catTitle"><%= dr["TOPIC_NAME"] %></span><span class="catCounter"></span></a></li>

                                        <%

                                                }
                                            }

                                            SqlParameter[] sp_event = new SqlParameter[1];
                                            sp_event[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                                            sp_event[0].Value = Server.HtmlEncode(page_name);

                                            object ob_event = SqlHelper.ExecuteScalar(Connection.My_Connection(),CommandType.StoredProcedure,"SP_DEPARTMENT_HAVING_EVENTS",sp_event);

                                            if (ob_event != null)
                                            {
                                                %>
                                                    <li class="list-information__item"><a href="photo_gallery.aspx?page=<%= page_name %>" style="color: #FFFFFF"><span class="catTitle">Departmental Events</span><span class="catCounter"></span></a></li>
                                                <%
                                            }
                                        %>
                                    </ul>
                                </section>


                            </aside>
                        </div>

                        <%
                            }
                        %>

                        <div class="<%= str_col_size %>" id="content_main">
                            <div id="system-message-container"></div>
                            <div class="container-fluid">
                                <div id="yt_component">
                                    <div class="col-md-12 itemListView gridview" id="k2Container">
                                        <div class="row">
                                            <%
                                                string st_id = page_name;
                                                string str_where = "";

                                                string topicid = "";

                                                if (Request.QueryString["topicid"] != null)
                                                {
                                                    topicid = Request.QueryString["topicid"].ToString();
                                                    str_where = " and TOPIC_ID=" + topicid;
                                                }

                                                string str_pagedetails_query = @"SELECT TOP 1 TBL_COLLEGE_PAGE.PAGE_ID, TBL_COLLEGE_PAGE.PAGE_NAME, TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID, TBL_COLLEGE_PAGE_TOPIC.TOPIC_NAME
                                                    FROM TBL_COLLEGE_PAGE INNER JOIN TBL_COLLEGE_PAGE_TOPIC ON TBL_COLLEGE_PAGE.PAGE_ID = TBL_COLLEGE_PAGE_TOPIC.PAGE_ID where TBL_COLLEGE_PAGE.PAGE_NAME=@PAGE_NAME 
                                                    " + str_where + " ORDER BY TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID";

                                                SqlParameter[] sp = new SqlParameter[1];
                                                sp[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                                                sp[0].Value = st_id.ToString();

                                                DataTable dt_pagedetails = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_pagedetails_query, sp);


                                                if (dt_pagedetails.Rows.Count > 0)
                                                {
                                                    topic_name = dt_pagedetails.Rows[0]["TOPIC_NAME"].ToString();
                                            %>


                                            <div class="col-md-12">
                                                <div class="itemListCategoriesBlock">
                                                    <div class="itemListCategory">
                                                        <h2 style="color: #8e167d; font-weight: 700;"><%=  topic_name %></h2>
                                                        <hr class="widget widget-default widget_categories" style="padding: 0px;" />
                                                        <div class="main-cate"></div>
                                                        <div class="clr"></div>
                                                    </div>
                                                </div>
                                                <div class="catItemIntroText">
                                                    <%

                                                        string str_subtopic_query = @"SELECT TBL_COLLEGE_PAGE_DETAIL.SUB_TOPIC_ID, TBL_COLLEGE_PAGE_DETAIL.TOPIC_ID, TBL_COLLEGE_PAGE_DETAIL.SUB_TOPIC_NAME, CONVERT(VARCHAR(10),TBL_COLLEGE_PAGE_DETAIL.TOPIC_DATE,105) AS TOPIC_DATE, 
                         TBL_COLLEGE_PAGE_DETAIL.TOPIC_DESCRIPTION, TBL_COLLEGE_PAGE_DETAIL.TOPIC_FILEPATH, TBL_COLLEGE_PAGE_DETAIL.TOPIC_LINK_TYPE, 
                         TBL_COLLEGE_PAGE_TOPIC.TOPIC_NAME,TBL_COLLEGE_PAGE_DETAIL.SHOW_TOPIC_NAME FROM TBL_COLLEGE_PAGE_DETAIL INNER JOIN
                         TBL_COLLEGE_PAGE_TOPIC ON TBL_COLLEGE_PAGE_DETAIL.TOPIC_ID = TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID WHERE TBL_COLLEGE_PAGE_TOPIC.TOPIC_ID=@TOPIC_ID ORDER BY TBL_COLLEGE_PAGE_DETAIL.TOPIC_DATE desc,TBL_COLLEGE_PAGE_DETAIL.SUB_TOPIC_ID desc";

                                                        SqlParameter[] sp_sub = new SqlParameter[1];
                                                        sp_sub[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                                                        sp_sub[0].Value = Convert.ToInt32(dt_pagedetails.Rows[0]["TOPIC_ID"].ToString());

                                                        DataTable dt_sub = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_subtopic_query, sp_sub);

                                                        foreach (DataRow dr_sub in dt_sub.Rows)
                                                        {
                                                            //string str_subtopicname = "";
                                                            if (dr_sub["SHOW_TOPIC_NAME"].ToString() == "Yes")
                                                            {
                                                    %>
                                                    <h4 class="text-info" style="font-weight: bold;"><%= dr_sub["SUB_TOPIC_NAME"] %></h4>
                                                    <%
                                                        }

                                                        if (dr_sub["TOPIC_FILEPATH"].ToString() == "#")
                                                        {
                                                    %>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <%= dr_sub["TOPIC_DESCRIPTION"] %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <%
                                                        }
                                                        else if (dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".JPG") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".JPEG") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".PNG") == true)
                                                        {
                                                    %>
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <figcaption>
                                                                <img src="<%= dr_sub["TOPIC_FILEPATH"] %>" class="img-responsive" alt="<%= dr_sub["TOPIC_NAME"] %>" />
                                                            </figcaption>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <%= dr_sub["TOPIC_DESCRIPTION"] %>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <%
                                                        }
                                                        else if (dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".DOC") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".DOCX") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".XLS") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".XLSX") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".PPT") == true || dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".PPTX") == true)
                                                        {

                                                    %>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <%= dr_sub["TOPIC_DESCRIPTION"] %><br />
                                                            <h6><a href="<%= dr_sub["TOPIC_FILEPATH"] %>">Click here to download file</a></h6>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <%       
                                                        }
                                                        else if (dr_sub["TOPIC_FILEPATH"].ToString().ToUpper().Contains(".PDF") == true)
                                                        {
                                                    %>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <%= dr_sub["TOPIC_DESCRIPTION"] %><br />
                                                            <object data="<%= dr_sub["TOPIC_FILEPATH"] %>" type="application/pdf" width="100%" height="600">
                                                                <p><a href="<%= dr_sub["TOPIC_FILEPATH"] %>">Click here to View</a></p>
                                                            </object>
                                                        </div>
                                                    </div>
                                                    <hr />

                                                    <% 
                                                        }

                                                        SqlParameter[] sp_files = new SqlParameter[1];
                                                        sp_files[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                                                        sp_files[0].Value = Convert.ToInt32(dr_sub["SUB_TOPIC_ID"].ToString());

                                                        DataTable dt_file = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT FILE_ID,SUB_TOPIC_ID,FILE_DESCRIPTION,FILE_PATH,FILE_ORDER FROM TBL_COLLEGE_PAGE_FILES WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID", sp_files);

                                                        if (dt_file.Rows.Count > 0)
                                                        {
                                                            int sno = 1;
            %>
                <table class="table table-hover">
                    <thead style="background-color:#03409b; color:#FFFFFF;">
                        <tr>
                                <th>S.No.</th>
                            <th>Title</th>
                            <th>Downloads</th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <%
            foreach (DataRow dr_file in dt_file.Rows)
            {
                %>
                        <tr>
                            <td><%= (sno.ToString()) %></td>
                            <td><%= dr_file["FILE_DESCRIPTION"] %></td>
                            <td><a href='<%= dr_file["FILE_PATH"] %>' target="_blank" style="color:#f00;font-weight:700;">Click here</a></td>
                        </tr>
                <% 
                sno++;
            }
                        %>
                    </tbody>
                </table> 
            <% 
        }
             


                                                        SqlParameter[] sp_topic_photo = new SqlParameter[1];
                                                        sp_topic_photo[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                                                        sp_topic_photo[0].Value = Convert.ToInt32(dr_sub["SUB_TOPIC_ID"].ToString());

                                                        DataTable dt_photo = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select PHOTO_ID,PHOTO_PATH from TBL_COLLEGE_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID", sp_topic_photo);

                                                        if (dt_photo.Rows.Count > 0)
                                                        {
                                                            for (int i = 0; i < dt_photo.Rows.Count; i++)
                                                            {
                                                    %>
                                                    <div class="col-lg-4">
                                                        <figure>

                                                            <a class="fancybox img-responsive" href='<%= dt_photo.Rows[i]["PHOTO_PATH"].ToString() %>' data-fancybox-group="gallery" title="<%= dr_sub["TOPIC_NAME"].ToString() %>">
                                                                <img src='<%= dt_photo.Rows[i]["PHOTO_PATH"].ToString() %>' width="300" height="200" border='3' style="margin: 15px;" alt="<%= dr_sub["TOPIC_NAME"].ToString() %>" />
                                                            </a>

                                                        </figure>
                                                    </div>
                                                    <% 
                                                                }
                                                            }

                                                        }

                                                        if (topic_name.ToString().ToUpper().Trim() == "STAFF")
                                                        {
                                                            string fid = "Teaching Staff";

                                                            SqlParameter[] sp_faculty = new SqlParameter[2];
                                                            sp_faculty[0] = new SqlParameter("@faculty_type", SqlDbType.VarChar, 50);
                                                            sp_faculty[0].Value = Server.HtmlEncode(fid);

                                                            sp_faculty[1] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                                                            sp_faculty[1].Value = Request.QueryString["PageName"];

                                                            DataTable dt_Teaching_Staff = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT tbl_College_Faculty.faculty_id, tbl_College_Faculty.faculty_name, tbl_College_Faculty.faculty_qualification, tbl_College_Faculty.faculty_designation, 
tbl_College_Faculty.faculty_mobile, tbl_College_Faculty.faculty_type, tbl_College_Faculty.PAGE_ID, tbl_College_Faculty.faculty_order, tbl_College_Faculty.filepath, 
TBL_COLLEGE_PAGE.PAGE_NAME FROM tbl_College_Faculty INNER JOIN TBL_COLLEGE_PAGE ON tbl_College_Faculty.PAGE_ID = TBL_COLLEGE_PAGE.PAGE_ID WHERE faculty_type=@faculty_type and TBL_COLLEGE_PAGE.PAGE_NAME=@PAGE_NAME
ORDER BY faculty_order, tbl_College_Faculty.faculty_id", sp_faculty);
                                                            if (dt_Teaching_Staff.Rows.Count > 0)
                                                            {
                                                    %>
                                                    <div class="row">
                                                        <div class="col-md-12 main-content">
                                                            <!-- End row -->
                                                            <div class="row portfolio-all portfolio-0">
                                                                <ul>
                                                                    <%
                                                                        foreach (DataRow dr_faculty in dt_Teaching_Staff.Rows)
                                                                        {
                                                                    %>
                                                                    <li class="col-md-3 term-design portfolio-item portfolio-item-2 isotope-item">
                                                                        <div class="portfolio-one">
                                                                            <div class="portfolio-head">
                                                                                <a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank">
                                                                                    <div class="portfolio-img">
                                                                                        <img src="<%= ResolveUrl(""+dr_faculty["filepath"]) %>" style="width: 200px; height: 220px;" alt="<%= dr_faculty["faculty_name"] %>" />
                                                                                    </div>
                                                                                </a>

                                                                            </div>
                                                                            <!-- End portfolio-head -->
                                                                            <div class="caption" style="height: 80px;">
                                                                                <h4 style="text-align: center;"><a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank" style="color: #f00 !important; text-align: center; font-size: 14px; font-weight: 600;"><%= dr_faculty["faculty_name"] %></a>
                                                                                    <br />
                                                                                    <span style="text-align: center;"><a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank" style="color: #0026ff !important; text-align: center; font-size: 12px; font-weight: 600;"><%= dr_faculty["faculty_designation"] %></a></span>
                                                                                </h4>
                                                                            </div>
                                                                        </div>
                                                                        <!-- End portfolio-item -->
                                                                    </li>
                                                                    <%

                                                                        }

                                                                    %>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                        }
                                                    %>



                                                    <%    
                                                        string sid = "Non Teaching Staff";

                                                        SqlParameter[] sp_staff = new SqlParameter[2];
                                                        sp_staff[0] = new SqlParameter("@faculty_type", SqlDbType.VarChar, 50);
                                                        sp_staff[0].Value = Server.HtmlEncode(sid);

                                                        sp_staff[1] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                                                        sp_staff[1].Value = Request.QueryString["PageName"];

                                                        DataTable dt_Non_Teaching_Staff = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT tbl_College_Faculty.faculty_id, tbl_College_Faculty.faculty_name, tbl_College_Faculty.faculty_qualification, tbl_College_Faculty.faculty_designation, 
tbl_College_Faculty.faculty_mobile, tbl_College_Faculty.faculty_type, tbl_College_Faculty.PAGE_ID, tbl_College_Faculty.faculty_order, tbl_College_Faculty.filepath, 
TBL_COLLEGE_PAGE.PAGE_NAME FROM tbl_College_Faculty INNER JOIN TBL_COLLEGE_PAGE ON tbl_College_Faculty.PAGE_ID = TBL_COLLEGE_PAGE.PAGE_ID WHERE faculty_type=@faculty_type and TBL_COLLEGE_PAGE.PAGE_NAME=@PAGE_NAME
ORDER BY faculty_order, tbl_College_Faculty.faculty_id", sp_staff);
                                                        if (dt_Non_Teaching_Staff.Rows.Count > 0)
                                                        {
                                                    %>
                                                    <div class="row">
                                                        <div class="col-md-12 main-content">
                                                            <!-- End row -->
                                                            <div class="row portfolio-all portfolio-0">
                                                                <ul>
                                                                    <%
                                                                        foreach (DataRow dr_faculty in dt_Non_Teaching_Staff.Rows)
                                                                        {
                                                                    %>
                                                                    <li class="col-md-3 term-design portfolio-item portfolio-item-2 isotope-item">
                                                                        <div class="portfolio-one">
                                                                            <div class="portfolio-head">
                                                                                <a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank">
                                                                                    <div class="portfolio-img">
                                                                                        <img src="<%= ResolveUrl(""+dr_faculty["filepath"]) %>" style="width: 200px; height: 220px;" alt="<%= dr_faculty["faculty_name"] %>" />
                                                                                    </div>
                                                                                </a>

                                                                            </div>
                                                                            <!-- End portfolio-head -->
                                                                            <div class="caption" style="height: 80px;">
                                                                                <h4 style="text-align: center;"><a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank" style="color: #f00 !important; text-align: center; font-size: 14px; font-weight: 600;"><%= dr_faculty["faculty_name"] %></a>
                                                                                    <br />
                                                                                    <span style="text-align: center;"><a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank" style="color: #0026ff !important; text-align: center; font-size: 12px; font-weight: 600;"><%= dr_faculty["faculty_designation"] %></a></span></h4>
                                                                            </div>
                                                                        </div>
                                                                        <!-- End portfolio-item -->
                                                                    </li>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                            }

                                                        }

                                                        

                                                        //End of Topic
                                                        if (topic_name.ToString().ToUpper().Trim() == "DEPARTMENTAL VIDEO")
                                                        {
                                                            SqlParameter[] sp_video_online = new SqlParameter[1];
                                                            sp_video_online[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                                                            sp_video_online[0].Value = Request.QueryString["PageName"];

                                                            DataTable dt_video = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT TBL_STUDENTVIDEO.D_id, TBL_STUDENTVIDEO.department_show,CONVERT(VARCHAR(10),TBL_STUDENTVIDEO.D_date,105) AS D_date , TBL_STUDENTVIDEO.Description, TBL_STUDENTVIDEO.URL, TBL_COLLEGE_PAGE.PAGE_NAME
            FROM (TBL_STUDENTVIDEO INNER JOIN TBL_PAST_VIDEO_DEPARTMENT ON TBL_STUDENTVIDEO.D_id = TBL_PAST_VIDEO_DEPARTMENT.D_id) INNER JOIN TBL_COLLEGE_PAGE ON TBL_PAST_VIDEO_DEPARTMENT.DEPARTMENT_ID = TBL_COLLEGE_PAGE.PAGE_ID WHERE TBL_COLLEGE_PAGE.PAGE_NAME='" + Request.QueryString["PageName"].ToString() + "' ORDER BY tbl_past_event.event_date DESC", sp_video_online);



                                                            if (dt_video.Rows.Count > 0)
                                                            {
                                                    %>
                                                    <!-- Start  Video Gallery Section -->
                                                    <div class="row">
                                                        <%      


                                                            if (dt_video.Rows.Count > 0)
                                                            {
                                                                for (int i = 0; i < dt_video.Rows.Count; i++)
                                                                {
                                                        %>
                                                        <article class="col-md-3">
                                                            <figure>
                                                                <iframe width="274" height="207" src='<%= dt_video.Rows[i]["URL"].ToString() %>">' frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
                                                                <br />
                                                                <p style="text-align: center; color: #002F31 !important; font-weight: 600; font-size: 13px;"><%= dt_video.Rows[i]["Description"].ToString() %></p>
                                                            </figure>
                                                        </article>

                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </div>
                                                    <!-- End portfolio-slide -->
                                                    <%                    
                                                                }
                                                            }

                                                            //End of Topic
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </section>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=gv_faculty]').footable();
        });
    </script>
</asp:Content>

