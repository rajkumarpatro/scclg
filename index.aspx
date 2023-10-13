<%@ Page Title="Best Colleges in Durg | Bhilai | Raipur | Chhattisgarh | Govt Science College, Durg (C.G.)" Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.OleDb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <%--start popup--%>


    <link href="swc.css" rel="stylesheet" />
    <script src="swc.js"></script>

    <style type="text/css">
        .headerbg {
            background: rgb(215,249,215);
            background: radial-gradient(circle, rgba(215,249,215,1) 0%, rgba(172,194,219,0.9699230033810399) 100%);
        }

        .navbar-inverse {
            background: rgb(215,249,215);
            background: radial-gradient(circle, rgba(215,249,215,1) 0%, rgba(172,194,219,0.9699230033810399) 100%);
            background: url('Img/bg/bg_menu3.jpg') repeat;
        }

        .TopLine1 {
            background-color: #f5f5f5;
            color: #676fce;
            text-align: center;
            font-size: 12px;
            padding: 6px;
        }

        .navbar-inverse .navbar-nav > li > a {
            color: Maroon;
            font-weight: bold;
        }

            .navbar-inverse .navbar-nav > li > a:hover {
                color: Blue;
                font-weight: bold;
            }

        .navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
            color: Blue;
            background-color: transparent;
        }

        .navbar-inverse .navbar-nav .open .dropdown-menu > li > a {
            color: Black;
            background: url('Img/bg/bg_menu3.jpg') repeat;
            border-left: 4px solid red;
            border-bottom: 1px dotted red;
            padding: 5px;
        }

            .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover {
                color: Blue;
            }

        .NotificationBtn1 {
            float: left;
            text-align: left;
            margin: 1px;
            width: 49%;
            border-left: 4px solid red;
            border-bottom: 1px dotted red;
            font-size: 0.5vw;
            padding: 3px;
        }

            .NotificationBtn1 a:hover {
                color: Blue;
                font-weight: Bold;
            }

        .navbar {
            position: relative;
            min-height: 30px;
            margin-bottom: 0px;
            border: 0px solid transparent;
        }

        .nav > li > a {
            position: relative;
            display: block;
            padding: 5px 10px;
        }

        .row {
            margin-right: -5px;
            margin-left: -5px;
        }

        [class*="col-"] {
            float: left;
            padding: 2px;
        }

        .list-group-item {
            border-left: 6px solid #3b63a7;
            border-bottom: 1px dashed red;
            padding: 20px;
            margin: 8px;
            border-radius: 0px 0px 0px 0px;
        }

        .container {
            padding-right: 5px;
            padding-left: 5px;
            margin-right: auto;
            margin-left: auto;
        }

        .table1 {
            background: url('Img/bg/BG_final1.jpg') repeat;
        }

        .table tr:nth-child(odd) {
            background-color: #f2dede;
        }

        .table tr:nth-child(even) {
            background-color: #dff0d8;
        }

        .modal-title {
            border-bottom: 42px solid Red;
            border-right: 42px solid transparent;
            width: 423px;
        }



            .modal-title span {
                position: absolute;
                left: 20px;
                top: 15px;
                color: #fff;
                font-size: 16px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

        .modal-header {
            padding: 5px;
            border-bottom: 1px solid #e5e5e5;
        }

        .modal-footer {
            padding: 5px;
            text-align: right;
            border-top: 1px solid #e5e5e5;
        }



        #myBtn {
            display: none;
            position: fixed;
            bottom: 10px;
            right: 20px;
            z-index: 99;
            font-size: 15px;
            border: none;
            outline: none;
            background-color: Red;
            color: white;
            cursor: pointer;
            padding: 5px;
            border-radius: 15px;
        }


            #myBtn:hover {
                background-color: #555;
            }

        .btn {
            text-align: left;
        }
    </style>

    <script type="text/javascript">
        window.onload = function () {
            var scrollY = parseInt('');
            if (!isNaN(scrollY)) {
                window.scrollTo(0, scrollY);
            }
        };
        window.onscroll = function () {
            var scrollY = document.body.scrollTop;
            if (scrollY == 0) {
                if (window.pageYOffset) {
                    scrollY = window.pageYOffset;
                }
                else {
                    scrollY = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
                }
            }
            if (scrollY > 0) {
                var input = document.getElementById("scrollY");
                if (input == null) {
                    input = document.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.setAttribute("id", "scrollY");
                    input.setAttribute("name", "scrollY");
                    document.forms[0].appendChild(input);
                }
                input.value = scrollY;
            }
        };
    </script>


    <script type="text/javascript" language="javascript">

        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>

    <%--end popup--%>


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
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        /*jssor slider bullet skin 032 css*/
        .jssorb032 {
            position: absolute;
        }

            .jssorb032 .i {
                position: absolute;
                cursor: pointer;
            }

                .jssorb032 .i .b {
                    fill: #fff;
                    fill-opacity: 0.7;
                    stroke: #000;
                    stroke-width: 1200;
                    stroke-miterlimit: 10;
                    stroke-opacity: 0.25;
                }

                .jssorb032 .i:hover .b {
                    fill: #000;
                    fill-opacity: .6;
                    stroke: #fff;
                    stroke-opacity: .35;
                }

            .jssorb032 .iav .b {
                fill: #000;
                fill-opacity: 1;
                stroke: #fff;
                stroke-opacity: .35;
            }

            .jssorb032 .i.idn {
                opacity: .3;
            }

        /*jssor slider arrow skin 051 css*/
        .jssora051 {
            display: block;
            position: absolute;
            cursor: pointer;
        }

            .jssora051 .a {
                fill: none;
                stroke: #fff;
                stroke-width: 360;
                stroke-miterlimit: 10;
            }

            .jssora051:hover {
                opacity: .8;
            }

            .jssora051.jssora051dn {
                opacity: .5;
            }

            .jssora051.jssora051ds {
                opacity: .3;
                pointer-events: none;
            }
    </style>
    <style>
        .wrap_news {
            height: 250px;
            overflow-y: scroll;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <%
         DataTable dtpopup = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_pop_up where Show='Yes'");
         if (dtpopup.Rows.Count > 0)
         {
             foreach (DataRow dr in dtpopup.Rows)
             {
                 if (dr["Show"].ToString().Equals("Yes"))
                 {
            %>
                     <div id="boxes">
              <div style="display: none;" id="dialog" class="window">
                    <div id="san">
                        <%   string str_query_pop_ad = @"SELECT top 10 [news_Id]
                                                               ,FORMAT(NEWS_DATE,'dd-MM-yyyy') as NEWS_DATE
                                                                                      ,[news_Title]                                          
                                                                                      ,[news_filepath]
                                                                                      ,[news_Link]
                                                                                      ,[news_LinkType]
                                                                                      ,[NEWS_FILEPATH_POP_AD]
                                                                                  FROM [tbl_pop_up]  order by tbl_pop_up.NEWS_DATE desc";

                            DataTable dsnews_pop_ad = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query_pop_ad);


                            if (dsnews_pop_ad.Rows.Count > 0)
                            {
                        %>
                        <%   
                            foreach (DataRow dr_pop_ad in dsnews_pop_ad.Rows)
                            {

                        %>


                        <%

                            if (dr_pop_ad["news_LinkType"].ToString().Equals("URL") || dr_pop_ad["news_LinkType"].ToString().Equals("File"))
                            {
                                string link = "";
                                if (dr_pop_ad["news_LinkType"].ToString().Equals("URL"))
                                {
                                    link = dr_pop_ad["news_Link"].ToString();
                                }
                                else
                                {
                                    link = dr_pop_ad["news_filepath"].ToString();
                                }
                        %>
                        <a href="<%= link %>" target="_blank">
                            <div class="modal-content">
                                <div class="modal-header alert-danger ">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title">
                                        <span id="Span1">"<%= dr["news_Title"].ToString() %>"</span>
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <span id="ctl00_ContentPlaceHolder1_lbl_mymodal_body">
                                        <hr>
                                        <img src="<%= ResolveUrl(""+dr["NEWS_FILEPATH_POP_AD"]) %>" class="img-responsive"></span>
                                </div>
                                <div class="modal-footer alert-danger" style="text-align: right; margin: 5px;">
                                    <button type="button" class="close" style="Color: white; font-size: 14px; padding: 8px 22px; line-height: 1.38; color: #333; background-color: Blue; border-color: #ccc;" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </a>
                        <%                                        
                            }
                            else
                            {
                        %>
                        <div class="modal-content">
                            <div class="modal-header alert-danger ">
                                <button type="button" class="close" data-dismiss="modal">
                                    ×</button>
                                <h4 class="modal-title">
                                    <span id="Span2">"<%= dr["news_Title"].ToString() %>"</span>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <span id="Span3">
                                    <hr>
                                    <img src="<%= ResolveUrl(""+dr["NEWS_FILEPATH_POP_AD"]) %>" class="img-responsive"></span>
                            </div>
                            <div class="modal-footer alert-danger" style="text-align: right; margin: 5px;">
                                <button type="button" class="close" style="Color: white; font-size: 14px; padding: 8px 22px; line-height: 1.38; color: #333; background-color: Blue; border-color: #ccc;" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                        <%
                            }
                        %>
                   
            <%
                }
            %>


            <%
                }
                else
                {
            %>
            <h6>No updates found.</h6>
            <%
                }
            %>
            </div>
              </div>
                <div style="width: 2478px; font-size: 32pt; color: white; height: 1202px; display: none; opacity: 0.4;" id="Div4"></div>
          </div>
    
    <%
        }
        else
        {
               %> 
                
    <%
                }
            }
        }

    %>



<%


    string latestnewssql = "select top 15 * from TBL_SCD_LATEST_UPDATE  order by NEWS_ID desc";
    string eventssql = "select Event_date,Event_Title from tbl_upcoming_events";

    string[] months = { "JAN", "FEB", "MAR", "APR", "MAY", "JUNE", "JULY", "AUG", "SEP", "OCT", "NOV", "DEC" };

    DataTable dt_latest_notice = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, latestnewssql);




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
                 DataTable dt_flash = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT [event_id] ,[event_caption] ,[filepath], [Order] FROM [TBL_SCD_FLASH] WHERE SHOW_FLASH='YES' ORDER BY [Order]");

                 if (dt_flash.Rows.Count > 0)
                 {
                     foreach (DataRow dr in dt_flash.Rows)
                     {
					%>
            <div>
               <img src='<%= ResolveUrl("" + dr["filepath"]) %>' class="img-responsive" />
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

                        if (dt_latest_notice.Rows.Count > 0)
                        {
                            foreach (DataRow dr in dt_latest_notice.Rows)
                            {

                         %>
                  <article class="post clearfix" style="margin-bottom:10px;">
                   
                    <%--<div class="entry-main">--%>
                      
                      <div class="entry-content">
                        <p><%
                               if (dr["NEWS_LINKTYPE"].ToString().Equals("URL") || dr["NEWS_LINKTYPE"].ToString().Equals("File"))
                               {
                                   if (dr["NEWS_LINKTYPE"].ToString().Equals("URL"))
                                   {
                                    %>
                                    <a href='<%= dr["NEWS_LINK"] %>' target="_blank" style="text-decoration:underline; color:#0252ac;" >  <%= dr["NEWS_TITLE"]%> </a>
                                    <%
                                        }
                                        else
                                        {
                                %>
                                    <a href='<%= dr["NEWS_FILEPATH"] %>' target="_blank" style="text-decoration:underline; color:#0252ac;">  <%= dr["NEWS_TITLE"]%> </a>
                                    <%
                                            }
                                        }
                                        else
                                        {
                                %>
                                <%= dr["NEWS_TITLE"]%>                                              
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


                        if (dt_ac_notice.Rows.Count > 0)
                        {
                            foreach (DataRow dr in dt_ac_notice.Rows)
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
                      <%--<div style="margin-bottom: 10px;">
                                <a href="https://govtvytcollegedurg.netcampus.in/Enquiry/Admission"><h3 class="blinkingRed">Online Admission Registration</h3></a>
                            </div>--%>
                      <%
                          object examname = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "select exam_name from tbl_examination where exam_enable='YES' and SHOW_ON_INDEX='YES'");

                          if (examname != null)
                          {
                    %>
                            <div style="margin-bottom: 10px;">
                                <a href="https://online.govtsciencecollegedurg.ac.in/examindex.aspx"><h3 class="blinking"><%= examname %></h3></a>
                            </div>
                      <%
                          }
                    %>

                      <div style="margin-bottom: 10px;">
                    <a href="AdmitCard.aspx"><h3 class="blinkingRed">Supple Exam Admit Card Oct. 2023</h3></a>
                </div>
                      <div style="margin-bottom: 10px;">
                    <a href="https://www.govtsciencecollegedurg.ac.in/scpage.aspx?PageName=Programs%20Offered&topicid=718"><h3 class="blinking">Pool of Generic Elective Courses (2022-23)</h3></a>
                </div>

                      <%--<div style="margin-bottom: 10px;">
                          <a href="QuestionPapers.aspx?year=2021-22&ct=UG&examtitle=Question Papers Supplementary Exam Sept. 2022">
                              <h3 class="blinking">Question Papers Supplementary Exam Sept. 2022</h3>
                          </a>
                      </div>
                <div style="margin-bottom: 10px;">
                        <a href="https://online.govtsciencecollegedurg.ac.in/ewsindex.aspx"><h3 class="blinking">महाविद्यालय में अध्ययनरत अन्य पिछड़ा वर्ग (OBC) एवं आर्थिक रूप से कमजोर वर्ग (EWS) के विद्यार्थियों की जानकारी भरने हेतु फॉर्म के लिए यहाँ क्लिक करें</h3></a>
                </div>--%>
                    <%--<div style="margin-bottom: 10px;">
                        <a href="https://online.govtsciencecollegedurg.ac.in/admissionindex.aspx"><h3 class="blinking">Re-Registration Form (Admission Form for UG 2nd,3rd Year and PG 3rd Sem.) for Session 2020-2021</h3></a>
                  </div>--%>

                    <div style="margin-bottom: 10px;">
                        <a href="Assignments.aspx?year=2021-22&type=Assignments&title=UG Second Sem. Assignment 2023"><h3 class="blinking">UG Second Sem. Assignment 2023</h3></a>
                    </div>

                    <h5><a href="Result.aspx">Click here for Results</a></h5><hr />
                    <h5><a href="scpage.aspx?PageName=Roll List">Search Roll List</a></h5><hr />
                    <h5><a href="https://www.govtsciencecollegedurg.ac.in/scpage.aspx?PageName=College%20Prospectus">College Prospectus</a></h5><hr />
                    <h5><a href="Syllabus.aspx" style="color:#0252ac;">UG & PG Syllabus Download Old</a></h5><hr />
                    <h5><a href="https://www.govtsciencecollegedurg.ac.in/scpage.aspx?PageName=UG%20Syllabus" style="color:#0252ac;"><b>UG Syllabus Download- New</b></a></h5><hr />
                    <h5><a href="https://www.govtsciencecollegedurg.ac.in/scpage.aspx?PageName=PG%20Syllabus" style="color:#0252ac;"><b>PG Syllabus Download- New</b></a></h5><hr />
                    <h5><a href="QuestionPaper.aspx">Previous Question Paper</a></h5><hr />
                    <%--<h5><a href="Assignments.aspx?year=2021-22&type=Assignments"><img src="images/new1.gif"> &nbsp; Assignments 2021-22</a></h5><hr />
                    <h5><a href="Student_section.aspx?title=Enrollment List 2019-20">Enrollment List 2019-20</a></h5><hr />
                    <h5><a href="Student_section.aspx?title=Enrollment List 2020-21">Enrollment List 2020-21</a></h5><hr />--%>
                    <h5><a href="https://www.vidyasaarathi.co.in/Vidyasaarathi/">Scholarship From Vidyasaarathi</a></h5><hr />
                    <h5><a href="photo_gallery.aspx?pagename=Science Club" style="font-weight:bold; color:#0252ac;">Science Club</a></h5><hr />
                    <h5><a href="BEST_PRACTICES.pdf">Best Practices</a></h5><hr />
                    <%--<h5><a href="onlinevideo_lect.aspx?page=Cultural%20Activities">Celebration for Azadi ka Amrit Mahotsav</a></h5><hr />--%>
                        
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
    
    <section class="section_mod-c wow bounceInUp" data-wow-duration="2s">
        <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <h2 class="ui-title-block ui-title-block_mod-e">College News <strong>(कॉलेज समाचार)</strong></h2>
              
              <div class="carousel_mod-a owl-carousel owl-theme enable-owl-carousel"
											data-min480="2"
											data-min768="3"
											data-min992="4"
											data-min1200="4"
											data-pagination="true"
											data-navigation="false"
											data-auto-play="4000"
											data-stop-on-hover="true">
                
                  <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/JUNE2022/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/JUNE2022/mobile/index.html" target="_blank">JUNE 2022 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/JUNE2022/mobile/index.html" target="_blank">JUNE 2022</a></h3>
                  </div>
                </div>

        <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/DECEMBER2021/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/DECEMBER2021/mobile/index.html" target="_blank">DECEMBER 2021 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/DECEMBER2021/mobile/index.html" target="_blank">DECEMBER 2021</a></h3>
                  </div>
                </div>
                  
                  <div class="staff">
            <div class="staff__media">
                <img class="img-responsive" src="CollegeSamachar/June2021/files/thumb/1.jpg" height="348" width="270" alt="foto" />
                <div class="staff__hover"><a href="CollegeSamachar/June2021/mobile/index.html" target="_blank">JUNE 2021 (Click Here)</a></div>
            </div>
            <div class="staff__inner">
                <h3 class="staff__title"><a href="CollegeSamachar/June2021/mobile/index.html" target="_blank">JUNE 2021</a></h3>
            </div>
        </div>
                  
                  <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/DECEMBER2020/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/DECEMBER2020/mobile/index.html" target="_blank">DECEMBER 2020 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/DECEMBER2020/mobile/index.html" target="_blank">DECEMBER 2020</a></h3>
                  </div>
                </div>

                <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/JUNE2020/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/JUNE2020/mobile/index.html" target="_blank">JUNE 2020 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/JUNE2020/mobile/index.html" target="_blank">JUNE 2020</a></h3>
                  </div>
                </div>

                <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/JUNE2019/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/JUNE2019/mobile/index.html" target="_blank">JUNE 2019 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/JUNE2019/mobile/index.html" target="_blank">JUNE 2019</a></h3>
                  </div>
                </div>

                <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/JANUARY2019/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/JANUARY2019/mobile/index.html" target="_blank">JANUARY 2019 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/JANUARY2019/mobile/index.html" target="_blank">JANUARY 2019</a></h3>
                  </div>
                </div>

                <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/DECEMBER2018/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/DECEMBER2018/mobile/index.html" target="_blank">DECEMBER 2018 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/DECEMBER2018/mobile/index.html" target="_blank">DECEMBER 2018</a></h3>
                  </div>
                </div>

                <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/JUNE2018/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/JUNE2018/mobile/index.html" target="_blank">JUNE 2018 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/JUNE2018/mobile/index.html" target="_blank">JUNE 2018</a></h3>
                  </div>
                </div>

                <div class="staff">
                  <div class="staff__media">
                      <img class="img-responsive" src="CollegeSamachar/June2017/files/thumb/1.jpg" height="348" width="270" alt="foto"/>
                    <div class="staff__hover"><a href="CollegeSamachar/June2017/mobile/index.html" target="_blank">JUNE 2017 (Click Here)</a></div>
                  </div>
                  <div class="staff__inner">
                    <h3 class="staff__title"><a href="CollegeSamachar/June2017/mobile/index.html" target="_blank">JUNE 2017</a></h3>
                  </div>
                </div>

              </div>
            </div>
            <!-- end col --> 
          </div>
          <!-- end row --> 
        </div>
        <!-- end container --> 
      </section>
      <!-- end section_mod-c -->

    <div class="container" style="margin-top: -50px;">
        <div class="border-decor_bottom">
            <div class="section-default">
                <h2 class="ui-title-block ui-title-block_mod-e">College <strong>Magazines</strong></h2>
                <hr />
                <h4 class="text-primary">VYANJANA</h4>
                <div class="row">
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2022-23.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2022-23.pdf" target="_blank">2022-23 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2022-23.pdf" target="_blank">2022-23</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2021-22.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2021-22.pdf" target="_blank">2021-22 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2021-22.pdf" target="_blank">2021-22</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2020-21.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2020-21.pdf" target="_blank">2020-21 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2020-21.pdf" target="_blank">2020-21</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2019-20.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2019-20.pdf" target="_blank">2019-20 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2019-20.pdf" target="_blank">2019-20</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2018-19.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2018-19.pdf" target="_blank">2018-19 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2018-19.pdf" target="_blank">2018-19</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2016-17.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2016-17.pdf" target="_blank">2016-17 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2016-17.pdf" target="_blank">2016-17</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/vyanjana/2014-15.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/vyanjana/2014-15.pdf" target="_blank">2014-15 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/vyanjana/2014-15.pdf" target="_blank">2014-15</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <h4 class="text-primary">SOUVENIR<//h4>
                <div class="row">
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/souvenir/2020June.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/souvenir/2020June.pdf" target="_blank">June 2020 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/souvenir/2020June.pdf" target="_blank">June 2020</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/souvenir/2020.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/souvenir/2020.pdf" target="_blank">2020 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/souvenir/2020.pdf" target="_blank">2020</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/souvenir/SEP2018.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/souvenir/SEP2018.pdf" target="_blank">SEP2018 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/souvenir/SEP2018.pdf" target="_blank">SEP2018</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/souvenir/2018.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/souvenir/2018.pdf" target="_blank">2018 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/souvenir/2018.pdf" target="_blank">2018</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/souvenir/2017.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/souvenir/2017.pdf" target="_blank">2017 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/souvenir/2017.pdf" target="_blank">2017</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/souvenir/2016.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/souvenir/2016.pdf" target="_blank">2016 (Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/souvenir/2016.pdf" target="_blank">2016</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <h4 class="text-primary">RESEARCH EXPRESSION<//h4>
                <div class="row">
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/researchexp/2021.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/researchexp/2021.pdf" target="_blank">2021 <br />(Volume- IV)<br />(Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/researchexp/2021.pdf" target="_blank">2021 <br />(Volume- IV)</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/researchexp/2019.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/researchexp/2019.pdf" target="_blank">2019 <br />(Volume- III)<br />(Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/researchexp/2019.pdf" target="_blank">2019 <br />(Volume- III)</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/researchexp/2017.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/researchexp/2017.pdf" target="_blank">2017 <br />(Volume- II)<br />(Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/researchexp/2017.pdf" target="_blank">2017 <br />(Volume- II)</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="staff" style="width: 100%">
                            <div class="staff__media">
                                <img class="img-responsive" src="CollegeSamachar/researchexp/2016.jpg" height="348" width="270" alt="foto" />
                                <div class="staff__hover"><a href="CollegeSamachar/researchexp/2016.pdf" target="_blank">2016 <br />(Volume- I)<br />(Click Here)</a></div>
                            </div>
                            <div class="staff__inner" style="padding: 10px 25px 0;">
                                <h3 class="staff__title"><a href="CollegeSamachar/researchexp/2016.pdf" target="_blank">2016 <br />(Volume- I)</a></h3>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-xs-12">
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
                <div class="col-xs-8">
                    <h2 class="ui-title-block">Events <strong>at College</strong></h2>
                    <div class="wrap-subtitle">
                        <div class="ui-subtitle-block ui-subtitle-block_w-line">Explore What's Happening at our College</div>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="btn btn-success pull-right"><a href="photo_gallery.aspx" style="color:#FFFFFF;"> More Events</a></div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">                    
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

