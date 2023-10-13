<%@ Page Title="Best Colleges in Durg | Bhilai | Raipur | Chhattisgarh | Govt Science College, Durg (C.G.)" Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="index_page.aspx.cs" Inherits="index" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.OleDb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- #region Jssor Slider Begin -->
    <!-- Generator: Jssor Slider Maker -->
    <!-- Source: https://www.jssor.com -->
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jssor.slider-27.5.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            var jssor_1_SlideoTransitions = [
                [{ b: -1, d: 1, o: -0.7 }],
                [{ b: 900, d: 2000, x: -379, e: { x: 7 } }],
                [{ b: 900, d: 2000, x: -379, e: { x: 7 } }],
                [{ b: -1, d: 1, o: -1, sX: 2, sY: 2 }, { b: 0, d: 900, x: -171, y: -341, o: 1, sX: -2, sY: -2, e: { x: 3, y: 3, sX: 3, sY: 3 } }, { b: 900, d: 1600, x: -283, o: -1, e: { x: 16 } }]
            ];

            var jssor_1_options = {
                $AutoPlay: 1,
                $SlideDuration: 800,
                $SlideEasing: $Jease$.$OutQuint,
                $CaptionSliderOptions: {
                    $Class: $JssorCaptionSlideo$,
                    $Transitions: jssor_1_SlideoTransitions
                },
                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$
                },
                $BulletNavigatorOptions: {
                    $Class: $JssorBulletNavigator$
                }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 3000;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        });
    </script>
    <link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300italic,regular,italic,700,700italic&subset=latin-ext,greek-ext,cyrillic-ext,greek,vietnamese,latin,cyrillic" rel="stylesheet" type="text/css" />
    <style>
        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /*jssor slider bullet skin 032 css*/
        .jssorb032 {position:absolute;}
        .jssorb032 .i {position:absolute;cursor:pointer;}
        .jssorb032 .i .b {fill:#fff;fill-opacity:0.7;stroke:#000;stroke-width:1200;stroke-miterlimit:10;stroke-opacity:0.25;}
        .jssorb032 .i:hover .b {fill:#000;fill-opacity:.6;stroke:#fff;stroke-opacity:.35;}
        .jssorb032 .iav .b {fill:#000;fill-opacity:1;stroke:#fff;stroke-opacity:.35;}
        .jssorb032 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 051 css*/
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
    </style>
    <style>
.wrap_news
{
    height: 250px;
    overflow-y: scroll;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script runat='server'>
            DataTable dt_menu = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [PAGE_ID] ,[PAGE_HEAD_ID] ,[PAGE_NAME] ,[SHOW] ,[SUB_MENU] ,[REORDER],IS_LINK,LINK_URL FROM [TBL_SCD_PAGE] WHERE SHOW='Yes' ORDER BY REORDER,PAGE_ID");

            public string SubMenuFuction(string pageheadid)
            {
                string str_menu = "";
                foreach (DataRow dr in dt_menu.Select("PAGE_HEAD_ID = "+pageheadid))
                {
                    string issubmenu = dr["SUB_MENU"].ToString();
                    if (issubmenu == "Yes")
                    {
                        str_menu += "<li class='dropdown'><a href='#'>" + dr["PAGE_NAME"].ToString() + "</a>";
                        str_menu += "<ul role='menu' class='has-sub' style='display: none;'>";

                        string str_submenu_query = @"SELECT [PAGE_ID] ,[TBL_SCD_PAGE].[PAGE_HEAD_ID] ,[PAGE_NAME] ,[TBL_SCD_PAGE].[SHOW] ,[SUB_MENU] ,[TBL_SCD_PAGE].[REORDER],IS_LINK,LINK_URL FROM [TBL_SCD_PAGE] WHERE [TBL_SCD_PAGE].SHOW='Yes' AND PAGE_HEAD_ID=(SELECT PAGE_HEAD_ID FROM TBL_SCD_PAGE_HEAD WHERE PAGE_HEAD_NAME='" + dr["PAGE_NAME"].ToString() + "') ORDER BY [TBL_SCD_PAGE].REORDER,PAGE_ID";
                        DataTable dt_submenu = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_submenu_query);

                        foreach (DataRow drs in dt_submenu.Rows)
                        {
                            string str_link = drs["PAGE_NAME"].ToString();
                            string str_pageid = drs["PAGE_ID"].ToString();

                            string str_linkdescription = drs["IS_LINK"].ToString();
                            string str_url = drs["LINK_URL"].ToString();

                            if (str_linkdescription == "Link")
                            {
                                str_menu += "<h5 ><a href='" + str_url + "'>" + str_link + "</a></h5></hr>";
                            }
                            else
                            {
                                str_menu += "<h5 ><a href='" + Page.ResolveUrl("~/scpage.aspx?PageName=" + str_link + "") + "'>" + str_link + "</a></h5></hr>";
                            }

                        }
                        str_menu += "</ul></li>";
                    }
                    else
                    {
                        string str_link = dr["PAGE_NAME"].ToString();
                        string str_pageid = dr["PAGE_ID"].ToString();

                        string str_linkdescription = dr["IS_LINK"].ToString();
                        string str_url = dr["LINK_URL"].ToString();

                        if (str_linkdescription == "Link")
                        {
                            str_menu += "<h5 ><a href='" + str_url + "'>" + dr["PAGE_NAME"].ToString() + "</a></h5></hr>";
                        }
                        else
                        {
                            str_menu += "<h5 ><a href='" + Page.ResolveUrl("~/scpage.aspx?PageName=" + str_link + "") + "'>" + dr["PAGE_NAME"].ToString() + "</a></h5></hr>";
                        }
                    }
                }

                return str_menu;
            }
        </script>
<%
        OleDbConnection con = new OleDbConnection(ConfigurationManager.AppSettings["connect"]);    
        
        string latestnewssql = @"SELECT  top 10 [news_Id],CONVERT(VARCHAR(10),NEWS_DATE,105) as NEWS_DATE
                                                                              ,[news_Title]                                          
                                                                              ,[news_filepath]
                                                                              ,[news_Link]
                                                                              ,[news_LinkType]
                                                                          FROM [TBL_SCD_LATEST_UPDATE] where ((NEWS_SECTION='LATEST NEWS AND UPDATES') ) order by TBL_SCD_LATEST_UPDATE.NEWS_DATE desc";
        string eventssql = "select Event_date,Event_Title from tbl_upcoming_events";
        
        string []months= {"JAN","FEB","MAR","APR","MAY","JUNE","JULY","AUG","SEP","OCT","NOV","DEC"};
        DataTable dsnewsPlacementnews = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, latestnewssql);
        
        
        
        
     %>
    
           <section class="slider-section">
		
			
			<!-- end single slider -->
			
            <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:1900px;height:700px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1900px;height:700px;overflow:hidden;">
             <%                              
                 DataTable flash = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select event_caption,filepath from TBL_SCD_FLASH order by event_id desc");

                    if (flash.Rows.Count > 0)
                    {
                        foreach (DataRow dr in flash.Rows)
                        {
                %>
            <div>
               <img src='<%= ResolveUrl(""+dr["filepath"]) %>' class="img-responsive" />
            </div>
              <%
                        }
                    }
                %>
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb032" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:16px;height:16px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora051" style="width:65px;height:65px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora051" style="width:65px;height:65px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
    </div>
    <!-- #endregion Jssor Slider End -->

		
	</section>
	<!-- END SLIDER SECTION  -->


    <div class="container" style="margin-top:-50px;">
        <div class="border-decor_bottom">
          <div class="section-default">
    

            <div class="row">

              <!-- end col -->
              
                <div class="col-md-4">
                
                    <div style="height:500px; border-width:1px; border-color:#000; border-style:solid; padding:5px; border-radius:5px;">
                        <div class="title-w-icon" style="margin-bottom:0px; background-color:#eeeded; color:#000; padding:3px;"> <%--<i class="icon stroke icon-Book" style="color:#000;"></i>--%>
                        <h5 style="color:#000; padding-left:5px;">News & Updates</h5>
                    </div>
                  
                    <marquee direction="up" scrollamount="3" height="100" onmouseover="this.stop();" onmouseout="this.start();" style="height:400px;">
                                           <div >
                    <%
                               
                        if (dsnewsPlacementnews.Rows.Count > 0)
                    {
                        foreach(DataRow dr in dsnewsPlacementnews.Rows)
                        {
                            
                         %>
                  <article class="post clearfix" style="margin-bottom:10px;">
                   
                    <%--<div class="entry-main">--%>
                      
                      <div class="entry-content">
                        <p><%
                            if (dr["news_LinkType"].ToString().Equals("URL") || dr["news_LinkType"].ToString().Equals("File"))
                            {
                                if (dr["news_LinkType"].ToString().Equals("URL"))
                                {
                                    %>
                                    <a href='<%= dr["news_Link"] %>' target="_blank" style="text-decoration:underline; color:#0252ac;" >  <%= dr["news_Title"]%> </a>
                                    <%
                                }
                                else
                                {
                                %>
                                    <a href='<%= dr["news_filepath"] %>' target="_blank" style="text-decoration:underline; color:#0252ac;">  <%= dr["news_Title"]%> </a>
                                    <%
                                }
                           }
                           else
                           {
                                %>
                                <%= dr["news_Title"]%>                                              
                                <%
                           }                           
                           %></p>
                      </div>
                    <%--</div>--%>
                  </article>
                    <%
                        
                    }
                    }
                         %>
                  <!-- end post -->                                 
              </div>
                        </marquee>
                        <a href="Archive.aspx?tp=LATEST NEWS AND UPDATES"><div class="btn btn-primary" style="width:100%;">Click here for All Latest News & Updates</div>
                    </div>
                    
                        
                    
                </div>
              <!-- end col -->
              
                <div class="col-md-4">
                
                    <div style="height:500px; border-width:1px; border-color:#000; border-style:solid; padding:5px; border-radius:5px;">
                        <div class="title-w-icon" style="margin-bottom:0px; background-color:#eeeded; color:#000; padding:3px;"> <%--<i class="icon stroke icon-Book" style="color:#000;"></i>--%>
                        <h5 style="color:#000; padding-left:5px;">Autonomous Cell Notifications</h5>
                    </div>
                  
                    <marquee direction="up" scrollamount="3" height="100" onmouseover="this.stop();" onmouseout="this.start();" style="height:400px;">
                                           <div >
                    <%
                        string str_query = @"SELECT top 15 [news_Id] ,[news_Date] ,[news_Title] ,[news_filepath] ,[news_Link] ,[news_LinkType] FROM [dbo].[tbl_AutonomousNotice] ORDER BY news_Id DESC";
                        DataTable dt_ac_notice = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);
                        
                               
                    if(dt_ac_notice.Rows.Count>0)
                    {
                        foreach(DataRow dr in dt_ac_notice.Rows)
                        {
                            
                         %>
                  <article class="post clearfix" style="margin-bottom:10px;">
                   
                    <%--<div class="entry-main">--%>
                      
                      <div class="entry-content">
                        <p><%
                            if (dr["news_LinkType"].ToString().Equals("URL") || dr["news_LinkType"].ToString().Equals("File"))
                            {
                                if (dr["news_LinkType"].ToString().Equals("URL"))
                                {
                                    %>
                                    <a href='<%= dr["news_Link"] %>' target="_blank" style="text-decoration:underline; color:#0252ac; font-weight:bold;;" >  <%= dr["news_Title"]%> </a>
                                    <%
                                }
                                else
                                {
                                %>
                                    <a href='<%= dr["news_filepath"] %>' target="_blank" style="text-decoration:underline; color:#0252ac; font-weight:bold;;">  <%= dr["news_Title"]%> </a>
                                    <%
                                }
                           }
                           else
                           {
                                %>
                                <%= dr["news_Title"]%>                                              
                                <%
                           }                           
                           %></p>
                      </div>
                    <%--</div>--%>
                  </article>
                    <%
                        
                    }
                    }
                         %>
                  <!-- end post -->                                 
              </div>
                        </marquee>
                        <a href="Archive.aspx?tp=Autonomous Cell Notifications"><div class="btn btn-primary" style="width:100%;">Click here for All Autonomous Cell Notifications</div>
                    </div>
                    
                        
                    
                </div>

              <div class="col-md-4">
                  <div style="height:500px; border-width:1px; border-color:#000; border-style:solid; padding:5px; border-radius:5px;">
                        <div class="title-w-icon" style="margin-bottom:0px; background-color:#eeeded; color:#000; padding:3px;"> <%--<i class="icon stroke icon-Book" style="color:#000;"></i>--%>
                        <h5 style="color:#000; padding-left:5px;">Impotant Links</h5>
                    </div>
                      <%
                          object examname = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select exam_name from tbl_examination where exam_enable='YES'");

                          if(examname!=null)
                          {
                    %>
                            <div style="margin-bottom: 10px;">
                                <a href="https://online.govtsciencecollegedurg.ac.in/examindex.aspx"><h3 class="blinking"><%= examname %></h3></a>
                            </div>
                      <%
                          }
                    %>

                <div style="margin-bottom: 10px;">
                    <a href="QuestionPapers.aspx?year=2020-21&ct=UG&examtitle=Supple. Exam Question Papers Nov. 2021"><h3 class="blinkingRed">Supple. Exam Question Papers Nov. 2021</h3></a>
                </div>
                <div style="margin-bottom: 10px;">
                        <a href="https://online.govtsciencecollegedurg.ac.in/ewsindex.aspx"><h3 class="blinking">महाविद्यालय में अध्ययनरत अन्य पिछड़ा वर्ग (OBC) एवं आर्थिक रूप से कमजोर वर्ग (EWS) के विद्यार्थियों की जानकारी भरने हेतु फॉर्म के लिए यहाँ क्लिक करें</h3></a>
                </div>

                    <%--<div style="margin-bottom: 10px;">
                        <a href="Student_section.aspx?title=Admission Notice and List"><h3 class="blinking">Click here for PG Admission List</h3></a>
                  </div>

                    

                    <div style="margin-bottom: 10px;">
                        <a href="ExamQuestionPaper.aspx?cls=UG"><h3 class="blinking" style="color:#0252ac;">Click here for Special Online Examination November  2020 Question Papers UG</h3></a>
                  </div>
                    <div style="margin-bottom: 10px;">
                        <a href="ExamQuestionPaper.aspx?cls=PG"><h3 class="blinking" style="color:#185e1d;">Click here for Special Online Examination November  2020 Question Papers PG</h3></a>
                  </div>

                    <div style="margin-bottom: 10px;">
                        <a href="UploadAnswer.aspx"><h3 class="blinking" style="color:#0252ac;">Upload Answer Sheet</h3></a>
                  </div>--%>
                    
                    <%--<div style="margin-bottom: 10px;">
                        <a href="https://online.govtsciencecollegedurg.ac.in/admissionindex.aspx"><h3 class="blinking">Re-Registration Form (Admission Form for UG 2nd,3rd Year and PG 3rd Sem.) for Session 2020-2021</h3></a>
                  </div>--%>
                  
                  <%--<h3 class="ui-title-inner decor decor_mod-a"><a href="assignment.aspx"><img src="images/new1.gif"/> &nbsp; Upload Assignment</a></h3>
                    
                    <div style="margin-bottom: 10px;">
                        <a href="QuestionPapers.aspx?year=2020-21&ct=UG&examtitle=Question Papers for Annual Exam 2021"><h3 class="blinking">Question Papers for Annual Exam 2021</h3></a>
                    </div>--%>

                <%
                    object pageheadid = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "SELECT TOP 10 PAGE_HEAD_ID FROM TBL_SCD_PAGE_HEAD WHERE PAGE_HEAD_NAME='IMPORTANT LINKS'");
                                            string str_s_menu = "";
                                            str_s_menu = SubMenuFuction(pageheadid.ToString());
                                        %>
                                        <%= str_s_menu %>
                        
                <!-- end post --> 
              </div>
                </div>
              <!-- end col --> 
                <%--<div class="col-md-4">
                    <div style="height:500px; border-width:3px; border-color:#ddd8d8; border-style:solid; padding:5px; border-radius:5px;">
                    <div class="title-w-icon" style="margin-bottom:0px; background-color:#3b99d7; color:#fff; padding:3px;"> <i class="icon stroke icon-Book" style="color:#fff;"></i>
                  <h2 class="ui-title-inner" style="color:#fff;">Impotant Links</h2>
                </div>
                    
                    
                    <a href="Student_section.aspx?title=Admission Notice and List">
                        <div class="btn btn-info" style="margin-bottom: 10px;">
                            &nbsp;&nbsp;&nbsp; Admission Notice and List</div>
                    </a>
                    <a href="https://durg1.ucanapply.com/univer/public/secure?app_id=UElZMDAwMDAyOA==">
                        <div class="btn btn-primary" style="margin-bottom: 10px;">
                            <img src="images/new1.gif">
                            &nbsp;&nbsp;&nbsp; Online Admission for UG First year</div>
                    </a>
                    
                    <a href="UploadAnswer.aspx">
                        <div class="btn btn-success" style="margin-bottom: 10px;">
                            <img src="images/new1.gif" />
                            &nbsp; Upload Online Exam Answers</div>
                    </a>
                    <a href="http://online.govtsciencecollegedurg.ac.in/" target="_blank">
                        <img src="online.gif" class="img-responsive" style="margin-bottom: 7px; width:250px;"></a>
                                        <a href="https://ocm.govtsciencecollegedurg.ac.in/" target="_blank">
                        <img src="images/onlinelect.gif" class="img-responsive" style="margin-bottom: 10px;"></a>
                    <br />
                    
                    
                </div>
                </div>--%>
            </div>
            <!-- end row --> 
          </div>
          <!-- end section-default --> 
        </div>
        <!-- end border-decor_bottom --> 
      </div>

    <div class="container" style="margin-top:-50px;">
        <div class="border-decor_bottom">
          <div class="section-default">
              <h2 class="ui-title-block">Academics</h2>
              
              <div class="row">
                  <div class="col-md-3">
                      <a href="AcademicDepartments.aspx?pname=Science">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #f00; color: #fff; padding: 3px;">
                              <i class="icon fa fa-flask" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Science</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="AcademicDepartments.aspx?pname=Arts">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #0252ac; color: #fff; padding: 3px;">
                              <i class="icon fa fa-language" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Arts</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="Departments.aspx?dp=Commerce">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color:#43B14B; color: #fff; padding: 3px;">
                              <i class="icon fa fa-money" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Commerce</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="Departments.aspx?dp=Library">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #2bb2b2; color: #fff; padding: 3px;">
                              <i class="icon fa fa-book" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Library & Info. Science</h2>
                          </div>
                      </a>
                  </div>
              </div>
            <!-- end row --> 
          </div>
          <!-- end section-default --> 
        </div>
        <!-- end border-decor_bottom --> 
      </div>
      
      
      <!-- end section_mod-a -->
      
      
      <!-- end section-default -->
    <section class="section_mod-c wow bounceInUp" data-wow-duration="2s">
        <div class="container events_activities">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="ui-title-block">Events <strong>at College</strong></h2>
                    <div class="wrap-subtitle">
                        <div class="ui-subtitle-block ui-subtitle-block_w-line">Explore What's Happening at our College</div>
                    </div>
                    <!-- end wrap-title -->
                    <div class="carousel_mod-a owl-carousel owl-theme enable-owl-carousel"
                            data-min480="1"
                            data-min768="2"
                            data-min992="3"
                            data-min1200="3"
                            data-pagination="true"
                            data-navigation="false"
                            data-auto-play="4000"
                            data-stop-on-hover="true">

                        <%
                                    string str_query_gallery = "";
                                    DataTable dt_gallery = new DataTable();
                                    str_query_gallery = @"SELECT top 8 event_id, department_show, event_page, event_name, CONVERT(VARCHAR(10),event_date,105) as eventdate, event_pic, event_order
FROM tbl_past_event order by tbl_past_event.event_date desc";
                                    dt_gallery = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query_gallery);

                                    if (dt_gallery.Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in dt_gallery.Rows)
                                        {
                                            int eventid = Convert.ToInt32(dr["event_id"].ToString());
                                            string eventname = dr["event_name"].ToString();
                                            string photopath = "";
                                            string eventdate = dr["eventdate"].ToString();

                                            SqlParameter[] spgallery = new SqlParameter[1];

                                            spgallery[0] = new SqlParameter("@event_id", SqlDbType.Int);
                                            spgallery[0].Value = eventid;

                                            string str_getphotos = "SELECT event_id,Photo_id,filepath FROM tbl_past_photos WHERE event_id=@event_id ORDER BY Photo_id";

                                            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_getphotos, spgallery);

                                            if (dt_photos.Rows.Count > 0)
                                            {
                                                photopath = dt_photos.Rows[0]["filepath"].ToString();

                                                string path = Server.MapPath(photopath);
                                                FileInfo file = new FileInfo(path);
                                                if (!file.Exists)//check file exsit or not
                                                {
                                                    photopath = "images/home.jpg";
                                                }
                                            }
                                            else
                                            {
                                                photopath = "images/home.jpg";
                                            }
                                %>

                        <article class="post post_mod-c clearfix">
                            <div class="entry-media">
                                <div class="entry-thumbnail"> <a href="events_details.aspx?eid=<%= eventid %>" ><img class="img-responsive" src='<%= ResolveUrl(""+photopath) %>' style="width:370px; height:250px;" width="370" height="250" alt="Foto"/></a> </div>
                            </div>
                            <div class="entry-main">
                                <h3 class="entry-title ui-title-inner"><a href="events_details.aspx?eid=<%= eventid %>"><%= eventname %></a></h3>
                                <div class="entry-meta decor decor_mod-b"><span class="entry-date"><a href="javascript:void(0);"><%= eventdate %></a></span> </div>
                            </div>
                        </article>

                            <% 

                                    }
                                }
                            %>
                        <!-- end post -->
                    </div>
                    <!-- end owl-carousel -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
    </section>
    <!-- end section-default -->
      
       

</asp:Content>

