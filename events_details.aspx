﻿<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="events_details.aspx.cs" Inherits="_Pasteventsdetails" Title="Photo Gallery" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


 <!-- Add jQuery library -->
<%--	<script type="text/javascript" src="source/jquery-1.10.1.min.js"></script>
--%>
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
		$(document).ready(function() {
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
					title : {
						type : 'outside'
					},
					overlay : {
						speedOut : 0
					}
				}
			});

			// Disable opening and closing animations, change title type
			$(".fancybox-effects-b").fancybox({
				openEffect  : 'none',
				closeEffect	: 'none',

				helpers : {
					title : {
						type : 'over'
					}
				}
			});

			// Set custom style, close if clicked, change title type and overlay color
			$(".fancybox-effects-c").fancybox({
				wrapCSS    : 'fancybox-custom',
				closeClick : true,

				openEffect : 'none',

				helpers : {
					title : {
						type : 'inside'
					},
					overlay : {
						css : {
							'background' : 'rgba(238,238,238,0.85)'
						}
					}
				}
			});

			// Remove padding, set opening and closing animations, close if clicked and disable overlay
			$(".fancybox-effects-d").fancybox({
				padding: 0,

				openEffect : 'elastic',
				openSpeed  : 150,

				closeEffect : 'elastic',
				closeSpeed  : 150,

				closeClick : true,

				helpers : {
					overlay : null
				}
			});

			/*
			 *  Button helper. Disable animations, hide close button, change title type and content
			 */

			$('.fancybox-buttons').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',

				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,

				helpers : {
					title : {
						type : 'inside'
					},
					buttons	: {}
				},

				afterLoad : function() {
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
				}
			});


			/*
			 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
			 */

			$('.fancybox-thumbs').fancybox({
				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,
				arrows    : false,
				nextClick : true,

				helpers : {
					thumbs : {
						width  : 50,
						height : 50
					}
				}
			});

			/*
			 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			*/
			$('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

			
			$("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 1
				});
			});

			$("#fancybox-manual-c").click(function() {
				$.fancybox.open([
					{
						
					}
				], {
					helpers : {
						thumbs : {
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

	<%
        string st_id = Request.QueryString["eid"];

        DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select event_id,event_name,CONVERT(VARCHAR(10),event_date,105) AS event_date,event_description from tbl_past_event where event_id=" + st_id + "");
	%>

	<div class="wrap-title-page">
		<div class="container">
			<div class="row">
				<div class="col-xs-12"><h1 class="ui-title-page"><%= dt_details.Rows[0]["event_name"].ToString() %></h1></div>
			</div>
		</div><!-- end container-->
	</div><!-- end wrap-title-page -->


<div class="main-content">
    
    <section >
      <div class="container">
         <div class="section-content">

              <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">&nbsp;</div>
              </div>
              
              <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                    <%= Server.HtmlDecode(dt_details.Rows[0]["event_description"].ToString()) %>
                 </div>
              </div>
              <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12">
                     <h3><asp:Label ID="lbl_photo" runat="server" Text="Events Photo" Visible="False"></asp:Label></h3>
                  </div>
              </div>
              <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12">
                        <%
                            DataTable dt_photos = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select filepath from tbl_past_photos where event_id=" + st_id + " order by Photo_id");

                            foreach (DataRow dr in dt_photos.Rows)
                            {
								%>
									<div class="col-lg-3 col-md-3 col-sm-3"><figure><a class="fancybox" href="<%= dr["filepath"] %>" data-fancybox-group='gallery' title="Govt Science College Durg"><img src="<%= dr["filepath"] %>" border='3' class='img-responsive' style="margin:5px;"/></a></figure></div>
								<%
							}

						%>
                  </div>
              </div>
           </div>
       </div>             
    </section>   
</div>

<%--
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">
      <h2><asp:Label ID="lbl_head" runat="server" Text="Photo Gallery: "></asp:Label><asp:Label ID="lbl_event" runat="server"></asp:Label></h2>  
    </div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">&nbsp;</div>
</div>

<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-4">
        <figure><asp:Image ID="img_caption" runat="server"></asp:Image></figure>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-8">
        <span runat="server" id="desc_content"></span>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">&nbsp;</div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12"><h2>Story Details</h2></div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12"><span id="span_story_details" runat="server"></span></div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12"><h2><asp:Label ID="lbl_photo" runat="server" Text="Events Photo" Visible="False"></asp:Label></h2></div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12"><span id="desc_content1" runat="server"></span></div>
</div>--%>
</asp:Content>

