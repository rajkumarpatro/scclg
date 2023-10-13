<%@ Page Title="Photo Gallery- Govt. V.Y.T. PG AUTONOMOUS COLLEGE,DURG" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="photo_gallery123.aspx.cs" Inherits="Photogallery" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <%
                        string page = "";
                        if (Request.QueryString["Page"] == null)
                        {
                            page = "Photo Gallery";
                        }
                        else
                        {
                            page=Request.QueryString["Page"].ToString();
                        }
                        
                        string pagehead = page;

                        if (page != "Photo Gallery")
                        {
                            pagehead = "Departmental Events- " + page;
                        }
                    %>
                    <h1 class="ui-title-page"><%= pagehead %></h1>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->

    <div class="main-content">

        <section>
            <div class="container">
                <div class="section-content">
                    <div class="row">
                        <div class="section-fullwidth">

                            <div class="element-size-100">
                                <div class="cs-holder lightbox  col-md-12">
                                    <div class="row">&nbsp;</div>
                                    <div class="cs-gallery default-gallery">
                                        <%      
                                            SqlParameter[] sp = new SqlParameter[1];

                                            sp[0] = new SqlParameter("@PAGE_NAME",SqlDbType.VarChar,50);
                                            sp[0].Value = page;

                                            DataTable dt_gallery = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.StoredProcedure, "SP_PAST_EVENTS",sp);

                                            int i = 0;
                                            if (dt_gallery.Rows.Count > 0)
                                            {
                                                foreach (DataRow dr in dt_gallery.Rows)
                                                {

                                                    string photopath = dr["event_pic"].ToString();

                                                    string path = Server.MapPath(photopath);
                                                    FileInfo file = new FileInfo(path);
                                                    if (!file.Exists)//check file exsit or not
                                                    {
                                                        object filepath = SqlHelper.ExecuteScalar(Connection.My_Connection(), CommandType.Text, "SELECT TOP 1 filepath FROM TBL_PAST_PHOTOS WHERE EVENT_ID=" + dr["event_id"].ToString() + "");

                                                        if (filepath != null)
                                                        {
                                                            string internalpath=Server.MapPath(filepath.ToString());
                                                            FileInfo internalfile = new FileInfo(internalpath);
                                                            if (!internalfile.Exists)//check file exsit or not
                                                            {
                                                                photopath = "images/home.jpg";
                                                            }
                                                            else
                                                            {
                                                                photopath = filepath.ToString();
                                                            }
                                                        }
                                                        else
                                                        {
                                                            photopath = "images/home.jpg";
                                                        }
                                                    }

                                                    if (i % 4 == 0)
                                                    {
                                        %>
                                        <div class="row">
                                            <% 
                                                }
                                            %>
                                            <article class="col-md-3">
                                                <figure>
                                                    <a href='events_details.aspx?eid=<%= dr["event_id"] %>' target="_blank">
                                                        <img class="img-responsive" src='<%= ResolveUrl(""+photopath) %>' alt="Govt Science College Durg" style="height: 200px; width: 298px;" />
                                                    
                                                            <h6><%= dr["event_name"]%> </h6>
                                                        </a>
                                                        <h6>                                                           
                                                                Date : <%= dr["event_date"]%>
                                                            <br>
                                                            <span style="line-height: 1.8em;"><a href="events_details.aspx?eid=232" style="color: #000;" target="_blank">Click here for details</a></span>

                                                        </h6>
                                                </figure>
                                            </article>

                                            <%
                                                if (i % 4 == 3)
                                                {
                                            %>
                                        </div>
                                        <% 
                                                    }
                                                    i++;
                                                }
                                            }
                                        %>
                                    </div>

                                </div>

                            </div>
                            <div class="element-size-100">
                                <div class="cs-spreater" style="margin-top: px; margin-bottom: px; height: 1px;">
                                    <div class="top-border">
                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </section>
    </div>
    <!-- End  Photo Gallery Section -->



</asp:Content>

