<%@ Page Title="Science Club - Photo Gallery- Govt. V.Y.T. PG AUTONOMOUS COLLEGE,DURG" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Science_club.aspx.cs" Inherits="Science_club" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<!-- Add mousewheel plugin (this is optional) -->
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<div class="wrap-title-page" style="padding-top:20px;">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Science Club Photo Gallery</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				



<div class="main-content" style="padding-top:20px;">

    <section style="padding-top:20px;">
      <div class="container">
         <div class="section-content">
                    <div class="row">
                        <div class="section-fullwidth">
                            
                            <div class="element-size-100">
                                <div class="cs-holder lightbox  col-md-12">
			                     <div class="cs-gallery default-gallery">
                                    <%                              
                                        DataTable adp3 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"SELECT        dbo.TBL_PAST_EVENT_DEPARTMENT.EVENT_ID, dbo.tbl_past_event.department_show, dbo.tbl_past_event.event_page, dbo.tbl_past_event.event_name,CONVERT(VARCHAR(10),dbo.tbl_past_event.event_date,105) AS event_date, 
                         dbo.tbl_past_event.event_venue, dbo.tbl_past_event.event_pic, dbo.tbl_past_event.event_description, dbo.tbl_past_event.event_order, dbo.TBL_PAST_EVENT_DEPARTMENT.DEPARTMENT_ID, 
                         dbo.TBL_COLLEGE_PAGE.PAGE_ID, dbo.TBL_COLLEGE_PAGE.PAGE_NAME
FROM            dbo.TBL_PAST_EVENT_DEPARTMENT INNER JOIN
                         dbo.tbl_past_event ON dbo.TBL_PAST_EVENT_DEPARTMENT.EVENT_ID = dbo.tbl_past_event.event_id INNER JOIN
                         dbo.TBL_COLLEGE_PAGE ON dbo.TBL_PAST_EVENT_DEPARTMENT.DEPARTMENT_ID = dbo.TBL_COLLEGE_PAGE.PAGE_ID where department_show='No' and dbo.TBL_COLLEGE_PAGE.PAGE_ID='31' order by dbo.tbl_past_event.event_date desc");

      int i =0;
      if (adp3.Rows.Count > 0)
                {
                    foreach (DataRow dr in adp3.Rows)
                    {                            
                            
                                      if (i % 4 == 0)
                        {
                            %>
                            <div class="row">
                            <% 
                        }
                             %>    
                                        <article class="col-md-3" >
                                        <figure>
                                            <a href='events_details.aspx?eid=<%= dr["event_id"] %>' target="_blank">
                                             <img class="img-responsive" src='<%= ResolveUrl(""+dr["event_pic"]) %>'  alt="Photo- Govt. V.Y.T. PG AUTONOMOUS COLLEGE,DURG" style="height:298px;width:298px;"/>
                                        </a>
                                       
                                            <br />
                                            <span>
                                                 <a href='events_details.aspx?eid=<%= dr["event_id"] %>' target="_blank"><h4><%= dr["event_name"]%> </h4></a>
                                                 <h4>
                                                     <br/>
                                                     <span style="color:#333; font-size:14px; line-height:1.8em;">Venue : <%= dr["event_venue"]%><br>Date : <%= dr["event_date"]%></span>
                                                     <br><span style="line-height:1.8em;"><a href="events_details.aspx?eid=232" style="color:#000;" target="_blank">Click here for details</a></span>

                                                 </h4>

                                         </span>
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
                                <div class="cs-spreater" style=" margin-top:px; margin-bottom:px;height:1px;">
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

