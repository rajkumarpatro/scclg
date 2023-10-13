﻿<%@ Page Title="Govt. V.Y.T. PG AUTONOMOUS COLLEGE,DURG" Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="scpage.aspx.cs" Inherits="scpage" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .thumbnail {
            padding: 4px;
            line-height: 1.42857143;
            background-color: #daf1fc;
            border: 2px solid #00a1f5;
            border-radius: 4px;
            transition: all 0.2s ease-in-out;
        }

            .thumbnail:hover {
                background-color: #6fd0ff;
            }

        .filestyle {
            background-color: #cfe5fd;
            border-color: #054284;
            border-style: solid;
            border-width: 2px;
            padding: 5px;
            border-radius: 5px;
            margin: 5px;
        }

            .filestyle:hover {
                background-color: #ffcca6;
                border-color: #fc7511;
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%
        //string page_name = RouteData.Values["PageName"].ToString();
        string page_name = Request.QueryString["PageName"].ToString();
        string actual_url = page_name;
        string topic_name = "";
        DataTable dt_Teaching_Staff = null;
        string str_teaching_staff = "";
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

    <div class="container-fluid">
        <div class="row">

            <%

                string fid = "Teaching Staff";

                SqlParameter[] sp_faculty = new SqlParameter[2];
                sp_faculty[0] = new SqlParameter("@faculty_type", SqlDbType.VarChar, 50);
                sp_faculty[0].Value = Server.HtmlEncode(fid);

                sp_faculty[1] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                sp_faculty[1].Value = Request.QueryString["PageName"];

                str_teaching_staff = @"SELECT TBL_Faculty.faculty_id, TBL_Faculty.faculty_name, TBL_Faculty.faculty_qualification, TBL_Faculty.faculty_designation, 
                        TBL_Faculty.faculty_mobile, TBL_Faculty.faculty_type, TBL_Faculty.faculty_order, TBL_Faculty.filepath, 
                        TBL_SCD_PAGE.PAGE_NAME FROM TBL_Faculty INNER JOIN TBL_SCD_PAGE ON TBL_Faculty.[faculty_department] = TBL_SCD_PAGE.PAGE_NAME WHERE 
                        faculty_type=@faculty_type and TBL_SCD_PAGE.PAGE_NAME=@PAGE_NAME and Status!='Ex' ORDER BY faculty_order, TBL_Faculty.faculty_id";

                dt_Teaching_Staff = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_teaching_staff, sp_faculty);



                int topic_count = 0;
                SqlParameter[] sp_topic = new SqlParameter[1];
                sp_topic[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                sp_topic[0].Value = Server.HtmlEncode(page_name);

                string str_query = @"SELECT TBL_SCD_PAGE.PAGE_ID, TBL_SCD_PAGE.PAGE_NAME, TBL_SCD_PAGE_TOPIC.TOPIC_ID, TBL_SCD_PAGE_TOPIC.TOPIC_NAME,IS_DEPARTMENT,TBL_SCD_PAGE_TOPIC.IS_LINK, TBL_SCD_PAGE_TOPIC.LINK_URL 
            FROM TBL_SCD_PAGE INNER JOIN TBL_SCD_PAGE_TOPIC ON TBL_SCD_PAGE.PAGE_ID = TBL_SCD_PAGE_TOPIC.PAGE_ID where PAGE_NAME=@PAGE_NAME order by TOPIC_ORDER,TOPIC_ID";

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
                                        if (topic_count == 1 && dt_Teaching_Staff.Rows.Count > 0)
                                        {
                            %>
                            <li class="list-information__item"><a href="scpage.aspx?PageName=<%= page_name %>&topicid=-1" style="color: #FFFFFF"><span class="catTitle">Faculty Profile</span><span class="catCounter"></span></a></li>
                            <%
                                }
                                if (dr["IS_LINK"].ToString() != "Yes")
                                {
                            %>
                            <li class="list-information__item"><a href="scpage.aspx?PageName=<%= actual_url %>&topicid=<%= dr["TOPIC_ID"] %>" style="color: #FFFFFF"><span class="catTitle"><%= dr["TOPIC_NAME"] %></span><span class="catCounter"></span></a></li>

                            <%
                                }
                                else
                                {
                            %>
                            <li class="list-information__item"><a href="<%= dr["LINK_URL"] %>" style="color: #FFFFFF"><span class="catTitle"><%= dr["TOPIC_NAME"] %></span><span class="catCounter"></span></a></li>

                            <%
                                        }
                                        topic_count++;

                                    }
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
                <div class="row">
                    <%
                        string st_id = page_name;
                        string str_where = "";

                        string topicid = "";
                        if (Request.QueryString["topicid"] != null)
                        {
                            topicid = Request.QueryString["topicid"].ToString();
                        }
                        if (Request.QueryString["topicid"] != null && topicid != "-1")
                        {
                            topicid = Request.QueryString["topicid"].ToString();
                            str_where = " and TOPIC_ID=" + topicid;
                        }

                        string str_pagedetails_query = @"SELECT TOP 1 TBL_SCD_PAGE.PAGE_ID, TBL_SCD_PAGE.PAGE_NAME, TBL_SCD_PAGE_TOPIC.TOPIC_ID, TBL_SCD_PAGE_TOPIC.TOPIC_NAME
                                                FROM TBL_SCD_PAGE INNER JOIN TBL_SCD_PAGE_TOPIC ON TBL_SCD_PAGE.PAGE_ID = TBL_SCD_PAGE_TOPIC.PAGE_ID where TBL_SCD_PAGE.PAGE_NAME=@PAGE_NAME 
                                                " + str_where + " ORDER BY TBL_SCD_PAGE_TOPIC.TOPIC_ORDER, TBL_SCD_PAGE_TOPIC.TOPIC_ID";

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
                                <%
                                    if (topicid == "-1")
                                    {
                                        topic_name = "Faculties";
                                    }
                                %>
                                <h2 style="color: #8e167d; font-weight: 700;"><%=  topic_name %></h2>
                                <hr class="widget widget-default widget_categories" style="padding: 0px;" />
                            </div>
                        </div>
                        <%


                            if (topicid == "-1")
                            {

                                if (dt_Teaching_Staff.Rows.Count > 0)
                                {
                        %>
                        <div class="row">
                            <div class="col-md-12 main-content">
                                <!-- End row -->
                                <!-- End row -->
                                <div class="row portfolio-all portfolio-0">

                                    <%
                                        foreach (DataRow dr_faculty in dt_Teaching_Staff.Rows)
                                        {
                                    %>
                                    <div class="col-sm-6 col-md-6">
                                        <a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank">
                                            <div class="thumbnail custom-fig">
                                                <div class="row">
                                                    <div class="col-md-4">

                                                        <img src="<%= ResolveUrl(""+dr_faculty["filepath"]) %>" style="width: 120px; height: 120px;" alt="<%= dr_faculty["faculty_name"] %>" />
                                        </a>
                                    </div>
                                    <div class="col-md-8" style="line-height: 1.6em;">
                                        <h5><%= dr_faculty["faculty_name"] %></h5>
                                        <span style="text-align: Left; color: red; font-weight: bold;" class="font-weight-600">Qualification:- &nbsp;<%= dr_faculty["faculty_qualification"] %> </span>
                                        <br />
                                        <span style="text-align: Left; color: #000000; font-weight: bold;">Designation:- &nbsp;<%= dr_faculty["faculty_designation"] %> </span>
                                        <br />
                                        <%
                                            if (dr_faculty["faculty_mobile"].ToString().Length == 10)
                                            {
                                        %>
                                        <span style="text-align: Left; color: #000000; font-weight: bold;">Mobile:- &nbsp;<%= dr_faculty["faculty_mobile"] %> </span>
                                        <br />
                                        <%
                                            }
                                        %>
                                        <a href='FacultyProfile.aspx?fid=<%= dr_faculty["faculty_id"] %>' target="_blank">Click to read profile</a>

                                    </div>
                                </div>
                            </div>
                            </a>
                        </div>
                        <%

                            }

                        %>
                    </div>
                </div>
            </div>
            <%
                    }


                }
                else
                {
                    string[] subtopictype = new string[2] { "PARAGRAPH", "ACCORDION" };

                    for (int k = 0; k < subtopictype.Length; k++)
                    {

                        string str_subtopic_query = @"SELECT TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ID, TBL_SCD_PAGE_DETAIL.TOPIC_ID, TBL_SCD_PAGE_DETAIL.SUB_TOPIC_NAME, CONVERT(VARCHAR(10),TBL_SCD_PAGE_DETAIL.TOPIC_DATE,105) AS TOPIC_DATE, 
                        TBL_SCD_PAGE_DETAIL.TOPIC_DESCRIPTION, TBL_SCD_PAGE_DETAIL.TOPIC_FILEPATH, TBL_SCD_PAGE_DETAIL.TOPIC_LINK_TYPE, 
                        TBL_SCD_PAGE_TOPIC.TOPIC_NAME,TBL_SCD_PAGE_DETAIL.SHOW_TOPIC_NAME FROM TBL_SCD_PAGE_DETAIL INNER JOIN
                        TBL_SCD_PAGE_TOPIC ON TBL_SCD_PAGE_DETAIL.TOPIC_ID = TBL_SCD_PAGE_TOPIC.TOPIC_ID WHERE TBL_SCD_PAGE_TOPIC.TOPIC_ID=@TOPIC_ID AND SUB_TOPIC_TYPE=@SUB_TOPIC_TYPE ORDER BY TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ORDER, TBL_SCD_PAGE_DETAIL.TOPIC_DATE desc,TBL_SCD_PAGE_DETAIL.SUB_TOPIC_ID desc";

                        SqlParameter[] sp_sub = new SqlParameter[2];
                        sp_sub[0] = new SqlParameter("@TOPIC_ID", SqlDbType.Int);
                        sp_sub[0].Value = Convert.ToInt32(dt_pagedetails.Rows[0]["TOPIC_ID"].ToString());

                        sp_sub[1] = new SqlParameter("@SUB_TOPIC_TYPE", SqlDbType.NVarChar, 50);
                        sp_sub[1].Value = Server.HtmlEncode(subtopictype[k].ToString());

                        DataTable dt_sub = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_subtopic_query, sp_sub);

                        if (subtopictype[k].ToString() == "ACCORDION")
                        {
            %>
            <div class="panel-group accordion accordion" id="accordion-1">
                <%
                    }
                    else
                    {
                %>
                <div>
                    <%
                        }

                        int firstitem = 0;
                        string collapsed = "";
                        string collapsein = "collapse in";

                        foreach (DataRow dr_sub in dt_sub.Rows)
                        {
                            if (subtopictype[k].ToString() == "ACCORDION")
                            {
                                if (firstitem == 0)
                                {
                                    collapsed = "";
                                    collapsein = "collapse in";
                                }
                                else
                                {
                                    collapsed = "collapsed";
                                    collapsein = "collapse";
                                }
                    %>
                    <div class="panel">
                        <div class="panel-heading">
                            <a class="btn-collapse <%= collapsed %>" data-toggle="collapse" data-parent="#accordion-<%=dr_sub["SUB_TOPIC_ID"].ToString() %>" href="#collapse-<%=dr_sub["SUB_TOPIC_ID"].ToString() %>"><i class="icon"></i>
                                <h3 class="panel-title" style="color: #054284;"><%= dr_sub["SUB_TOPIC_NAME"] %></h3>
                            </a>
                        </div>
                        <%
                            }
                            else
                            {
                                //string str_subtopicname = "";
                                if (dr_sub["SHOW_TOPIC_NAME"].ToString() == "Yes")
                                {
                        %>
                        <h4 class="text-info" style="font-weight: bold;"><%= dr_sub["SUB_TOPIC_NAME"] %></h4>
                        <%
                                }
                            }

                            if (subtopictype[k].ToString() == "ACCORDION")
                            {
                        %>
                        <div id="collapse-<%=dr_sub["SUB_TOPIC_ID"].ToString() %>" class="panel-collapse <%= collapsein %>">
                            <div class="panel-body">

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
                                        string sub_description = dr_sub["TOPIC_DESCRIPTION"].ToString();
                                        if (sub_description == "")
                                        {
                                %>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <figcaption>
                                            <img src="<%= dr_sub["TOPIC_FILEPATH"] %>" class="img-responsive" alt="<%= dr_sub["TOPIC_NAME"] %>" />
                                        </figcaption>
                                    </div>
                                </div>
                                <%
                                    }
                                    else
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
                                <%            
                                    }
                                %>

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

                                    DataTable dt_file = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT FILE_ID,SUB_TOPIC_ID,CONVERT(VARCHAR(10),FILE_DATE,105) AS FILE_DATE,FILE_DESCRIPTION,FILE_PATH,FILE_ORDER FROM TBL_SCD_PAGE_FILES WHERE SUB_TOPIC_ID=@SUB_TOPIC_ID order by FILE_ORDER", sp_files);

                                    if (dt_file.Rows.Count > 0)
                                    {
                                        int sno = 1;
                                        if (topicid == "722")
                                        {
                                %>
                                <table class="table table-hover">
                                    <thead style="background-color: #03409b; color: #FFFFFF;">
                                        <tr>
                                            <th width="30">S.No.</th>

                                            <th>Title</th>
                                            <th>Date</th>
                                            <th>Download</th>

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
                                            <td><%=dr_file["FILE_DATE"] %></td>
                                            <td><a href='<%= dr_file["FILE_PATH"] %>' target="_blank" style="color: #08387f; font-weight: 700;">Click here</a></td>
                                        </tr>
                                        <% 
                                                sno++;
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <%
                                    }
                                    else
                                    {
                                        int newrow = 0;
                                        foreach (DataRow dr_file in dt_file.Rows)
                                        {
                                            if ((newrow % 2) == 0)
                                            {
                                %>
                                <div class="row">
                                    <%
                                        }
                                    %>
                                    <div class="col-md-6">
                                        <div class="filestyle">

                                            <a href='<%= dr_file["FILE_PATH"] %>' target="_blank">
                                                <div class="row">
                                                    <div class="col-md-2 col-xs-2">
                                                        <%--<i class="fa fa-file-pdf-o" style="font-size: 54px;"></i>--%>
                                                        <img src="images/pdflogo.png" class="img-responsive" />
                                                    </div>
                                                    <div class="col-md-10 col-xs-10" style="color: #054284; font-size: 16px;">
                                                        <%= dr_file["FILE_DESCRIPTION"] %>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>


                                    <% 

                                        if ((newrow % 2) == 1 || (newrow + 1 == dt_file.Rows.Count))
                                        {
                                    %>
                                </div>
                                <%
                                                }

                                                newrow++;
                                            }
                                        }

                                    }

                                    SqlParameter[] sp_topic_photo = new SqlParameter[1];
                                    sp_topic_photo[0] = new SqlParameter("@SUB_TOPIC_ID", SqlDbType.Int);
                                    sp_topic_photo[0].Value = Convert.ToInt32(dr_sub["SUB_TOPIC_ID"].ToString());

                                    DataTable dt_photo = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select PHOTO_ID,PHOTO_PATH from TBL_SCD_PAGE_PHOTOS where SUB_TOPIC_ID=@SUB_TOPIC_ID", sp_topic_photo);

                                    if (dt_photo.Rows.Count > 0)
                                    {
                                        for (int i = 0; i < dt_photo.Rows.Count; i++)
                                        {
                                            if (i % 3 == 0)
                                            {
                                %>
                                <div class="row">
                                    <%
                                        }
                                    %>
                                    <div class="col-lg-4" align="center">
                                        <figure>

                                            <a class="fancybox img-responsive" href='<%= dt_photo.Rows[i]["PHOTO_PATH"].ToString() %>' data-fancybox-group="gallery" title="<%= dr_sub["TOPIC_NAME"].ToString() %>">
                                                <img src='<%= dt_photo.Rows[i]["PHOTO_PATH"].ToString() %>' style="margin: 15px; max-height: 200px; max-width: 300px;" class="img-responsive" style="margin: 15px;" alt="<%= dr_sub["TOPIC_NAME"].ToString() %>" />
                                            </a>

                                        </figure>
                                    </div>
                                    <% 
                                        if ((i % 3) == 2 || (i + 1 == dt_photo.Rows.Count))
                                        {
                                    %>
                                </div>
                                <%
                                            }

                                        }
                                    }

                                    if (subtopictype[k].ToString() == "ACCORDION")
                                    {
                                %>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                            firstitem++;
                        }



                    %>
                </div>
                <%

                    }



                %>

                <%



                    //End of Topic
                    if (topic_name.ToString().ToUpper().Trim() == "DEPARTMENTAL VIDEO")
                    {
                        SqlParameter[] sp_video_online = new SqlParameter[1];
                        sp_video_online[0] = new SqlParameter("@PAGE_NAME", SqlDbType.VarChar, 50);
                        sp_video_online[0].Value = Request.QueryString["PageName"];

                        DataTable dt_video = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT TBL_STUDENTVIDEO.D_id, TBL_STUDENTVIDEO.department_show,CONVERT(VARCHAR(10),TBL_STUDENTVIDEO.D_date,105) AS D_date , TBL_STUDENTVIDEO.Description, TBL_STUDENTVIDEO.URL, TBL_SCD_PAGE.PAGE_NAME
        FROM (TBL_STUDENTVIDEO INNER JOIN TBL_PAST_VIDEO_DEPARTMENT ON TBL_STUDENTVIDEO.D_id = TBL_PAST_VIDEO_DEPARTMENT.D_id) INNER JOIN TBL_SCD_PAGE ON TBL_PAST_VIDEO_DEPARTMENT.DEPARTMENT_ID = TBL_SCD_PAGE.PAGE_ID WHERE TBL_SCD_PAGE.PAGE_NAME='" + Request.QueryString["PageName"].ToString() + "' ORDER BY tbl_past_event.event_date DESC", sp_video_online);



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
                    }


                %>
            </div>
        </div>
    </div>
    </div>
    </div>


</asp:Content>

