<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Notifictaions.aspx.cs" Inherits="Notifictaions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%
        System.Data.OleDb.OleDbConnection con = new System.Data.OleDb.OleDbConnection(ConfigurationManager.AppSettings["connect"]);    
     %>

<div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Notifications</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				<div class="section-breadcrumb">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div class="wrap-breadcrumb clearfix">
									<ol class="breadcrumb">
										<li><a href="javascript:void(0);"><i class="icon stroke icon-House"></i></a></li>
										<li class="active">Notifications</li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->
    
     <%
        string latestnewssql = "select * from tbl_News  order by news_Id desc";
      
        string []months= {"JAN","FEB","MAR","APR","MAY","JUNE","JULY","AUG","SEP","OCT","NOV","DEC"};
        System.Data.OleDb.OleDbCommand cmd = new System.Data.OleDb.OleDbCommand(latestnewssql, con);
        System.Data.OleDb.OleDbDataAdapter adp = new System.Data.OleDb.OleDbDataAdapter(cmd);
        System.Data.DataSet dsUpdates = new System.Data.DataSet();
        adp.Fill(dsUpdates, "tbl_News");
                     
                        %>

     <section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
                <div class="row">

                         <div class="col-md-10">
                <section class="section-area wow bounceInRight" data-wow-duration="2s">
                  <div class="title-w-icon"> <i class="icon stroke icon-Agenda"></i>
                    <h2 class="ui-title-inner">Notifications</h2>
                  </div>
                                           <div >
                    <%
                               
                    if(dsUpdates.Tables["tbl_News"].Rows.Count>0)
                    {
                        foreach(System.Data.DataRow dr in dsUpdates.Tables["tbl_News"].Rows)
                        {
                            DateTime newsDate = DateTime.ParseExact("" + dr["news_Date"], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                         %>
                  <article class="post post_mod-e clearfix">
                    <div class="box-date"><span class="number"><%= newsDate.Day %></span><%= months[newsDate.Month-1] %></div>
                    <div class="entry-main">
                      <h3 class="entry-title entry-title_mod-a"><a href="javascript:void(0);"><%= dr["news_Title"] %></a></h3>
                      <div class="entry-content">
                        <p><%
                            if (dr["news_LinkType"].ToString().Equals("URL") || dr["news_LinkType"].ToString().Equals("File"))
                            {
                                if (dr["news_LinkType"].ToString().Equals("URL"))
                                {
                                    %>
                                    <a href='<%= dr["news_Link"] %>' target="_blank" style="text-decoration:underline;" >  <%= dr["news_Description"]%> </a>
                                    <%
                                }
                                else
                                {
                                %>
                                    <a href='<%= dr["news_filepath"] %>' target="_blank" style="text-decoration:underline;">  <%= dr["news_Description"]%> </a>
                                    <%
                                }
                           }
                           else
                           {
                                %>
                                <%= dr["news_Description"]%>                                              
                                <%
                           }                           
                           %></p>
                      </div>
                    </div>
                  </article>
                    <%
                        
                    }
                    
                    }
                         %>
                  <!-- end post -->                                 
              </div>
                </section>
                <!-- end section-area --> 
              </div>
                </div>
            </div>
        </div>
            </div>
          </div>

         </section>
         </div>
    
</asp:Content>

