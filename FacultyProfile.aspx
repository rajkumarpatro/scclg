<%@ Page Title="Faculties Profile" Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="FacultyProfile.aspx.cs" Inherits="FacultyProfile" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%
        if (Request.QueryString["fid"] != null)
        {
            object fid = Request.QueryString["fid"];
            string str_query = "select * from tbl_faculty where faculty_id=" + Request.QueryString["fid"];
            DataTable dt_facultyprofile = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query);

            if (dt_facultyprofile.Rows.Count > 0)
            {
                DataTable dt_attachment = SqlHelper.ExecuteDataTable(Connection.My_Connection(),CommandType.Text,"select top 1 AchievementDetail,AchievementYear,Attachment from tbl_faculties_achievements where FacultyID = " + fid+" order by AchievementID desc");
    %>
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page">Profile of <%= dt_facultyprofile.Rows[0]["faculty_name"].ToString() %> </h1>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->




    <section class="">
        <div class="container">
            <div class="section-content">
                <div class="row">
                    <div class="col-md-12">
                        
                        <h2 class="text-uppercase font-weight-600 mt-0 font-28 line-bottom">
                            <asp:Label ID="Label1" runat="server"></asp:Label></h2>
                        <div class="row">
                            <div class="col-md-2">
                                <img src="<%= dt_facultyprofile.Rows[0]["filepath"].ToString() %>" width="180" height="210" />
                                
                            </div>
                            <div class="col-md-10">
                                <div class="row" style="font-size: 16px;">
                                    <div class="col-md-12" style="padding-bottom: 10px;">
                                        <span><b>Name : </b></span>
                                        <%= dt_facultyprofile.Rows[0]["faculty_name"].ToString() %>
                                    </div>
                                    <div class="col-md-12" style="padding-bottom: 10px;">
                                        <span><b>Qualification : </b></span>
                                        <%= dt_facultyprofile.Rows[0]["faculty_qualification"].ToString() %>
                                    </div>
                                    <div class="col-md-12" style="padding-bottom: 10px;">
                                        <span><b>Designation : </b></span>
                                        <%= dt_facultyprofile.Rows[0]["faculty_designation"].ToString() %>
                                    </div>
                                    <div class="col-md-12" style="padding-bottom: 10px;">
                                        <span><b>Department : </b></span>
                                        <%= dt_facultyprofile.Rows[0]["faculty_department"].ToString() %>
                                    </div>
                                    <%
                                        if(dt_attachment.Rows.Count>0)
                                        {
                                            %>
                                                <div class="col-md-12" style="padding-bottom: 10px;">
                                                    <span><b>To Download Profile: </b></span>
                                                    <a href="<%= dt_attachment.Rows[0]["Attachment"].ToString() %>" target="_blank"><i class="fa fa-file-pdf-o"></i> Click Here</a>
                                                </div>
                                            <%
                                        }
                                    %>
                                    

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%--<%= Server.HtmlDecode(dt_facultyprofile.Rows[0]["faculty_profile"].ToString()) %>--%>
                            <object data="<%= dt_attachment.Rows[0]["Attachment"].ToString() %>" type="application/pdf" width="100%" height="600">
                                <p><a href="<%= dt_attachment.Rows[0]["Attachment"].ToString() %>">Click here to View</a></p>
                            </object>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </section>
    <%
            }
        }


    %>

    <script src="js/custom.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.video.min.js"></script>



</asp:Content>

