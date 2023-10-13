<%@ Page Title="Online Video Lectures" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="onlinevideo_lect.aspx.cs" Inherits="onlinevideo_lect" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Start main-content -->
 
   <%
       string page = Request.QueryString["page"].ToString();
       string colsize = "col-md-9";
   %>

   	<div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page"><%= page %></h1>
                                <%
                                    if (page == "Cultural Activities")
                                    {
                                        colsize = "col-md-12";
                                        %>
                                            <h1 class="ui-title-page">Celebration for Azadi ka Amrit Mahotsav</h1>
                                        <%
                                    }
                                %>
							</div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->

    <br />
     <section class="">
      <div class="container">
        <div class="section-content">
                <div class="row">
                    <%
                        if(page!="Cultural Activities")
                        {
                            %>
                    <div class="col-sm-12 col-md-3">
            <div class="sidebar sidebar-left mt-sm-30">
              
              <%
                  DataTable VIDEO = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT VIDEO_PAGE_ID,VIDEO_PAGE_NAME FROM TBL_VIDEOPAGE  ");
	                
                    if (VIDEO.Rows.Count > 0)
	                {
                        %>
                       <h3 class="widget-title line-bottom">Departments</h3>  
                       <%
                        foreach (DataRow dr in VIDEO.Rows)
		                {
	                %> 
                 
              <div class="widget" style="margin-bottom:0px;">
               
                <div class="categories">
                  <ul class="list list-border angle-double-right" style="margin-top:0px;">
                    <li><a href="onlinevideo_lect.aspx?page=<%= dr["VIDEO_PAGE_NAME"]%>" style="font-size: 17px;font-weight: 600;"><%= dr["VIDEO_PAGE_NAME"]%></a></li>
                    
                  </ul>
                </div>
              </div>
              <%
					}
					}
						 %>
              
            </div>
          </div>
                            <%
                        }
                    %>
          
          <div class="<%= colsize %>" blog-pull-right">
             <div class="row">
              <%
                    string str_where="";
	                if(Request.QueryString["page"]!=null)
                    {
                        str_where=" and D_page='"+Request.QueryString["page"]+"'";
                    }

                    DataTable VIDEODISPLAY = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT  D_id,D_date,Description,URL,D_page from tbl_video where D_page<>'Cultural Video'" + str_where + " ");                                        
                    if (VIDEODISPLAY.Rows.Count > 0)
	                {
                        foreach (DataRow dr in VIDEODISPLAY.Rows)
		                {
	                %> 
                <div class="col-sm-6 col-md-4">
                  <div class="service-block bg-white">
                    <div class="thumb">
                        <iframe width='274' height='207' src=" <%= dr["URL"]%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="entry-main">
                    
                    <div class="entry-content">
                      <p class="text-danger">
                          <%= dr["Description"] %>
                      </p>
                    </div>
                  </div>
                  </div>
                </div>
                    <%
					}
					}
						 %>
             </div>
          </div>
          
        </div>
        
      </div>
          </div>
    </section>
  </div>
  
    
</asp:Content>

