<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Facilities.aspx.cs" Inherits="_Pasteventsdetails" Title="Upcoming Events" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
	<style>
	 
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%
                //string INTRODUCTION_NAME = RouteData.Values["PageName"].ToString();
                string FACILITIES_NAME = Request.QueryString["pname"].ToString();
                string actual_url = FACILITIES_NAME;
                
                //INTRODUCTION_NAME = INTRODUCTION_NAME.Replace("-", " ");
            %>
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Facilities - <%= FACILITIES_NAME %></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				<div class="section-breadcrumb">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div class="wrap-breadcrumb clearfix">
									<ol class="breadcrumb">
										<li><a href="index.aspx"><i class="icon stroke icon-House"></i></a></li>
										<li class="active">Facilities</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
    <section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                 <div class="col-md-12">
                    <h2 class="ui-title-block">Facilities- <strong><%= FACILITIES_NAME %></strong></h2>
                 </div>
             </div>
         </div>
      </div>
    </section>
    
	<section class="rtd">
        <div class="container">
		    <div class="row">
			    <div class="col-md-12">
                    <span id="desc_content" runat="server"></span>
                </div>
			</div>
			<div class="row">
                <br />
                    <div class="col-md-12">
                        <h3><asp:Label ID="lbl_photo" CssClass="img-responsive" runat="server"></asp:Label></h3>
                    </div><br />    
            </div>
           
           </div>
		</div>
	</section>  
    <section class="rtd">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
               
              <style>
              .v_img
			  {
				  border:2px solid #00F;
				  height:130px;
				  width:250px;
		      }
              </style>     
               
                
                <div id="content">
	
 <%
                       SqlConnection conn2 = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
                           SqlParameter[] sp_page = new SqlParameter[1];
                           sp_page[0] = new SqlParameter("@facility_page", SqlDbType.NVarChar, 150);
                           sp_page[0].Value = Request.QueryString["pname"];

                           DataTable dtLogin = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "select * from tbl_facility where facility_page=@facility_page", sp_page);
                           
                           SqlParameter[] sp_photo = new SqlParameter[1];
                           sp_photo[0] = new SqlParameter("@facility_id", SqlDbType.NVarChar, 150);
                           sp_photo[0].Value = Convert.ToInt32(dtLogin.Rows[0]["facility_id"].ToString());

                           DataTable dspage = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, @"select * from tbl_facility_photos where facility_id=@facility_id order by Photo_id", sp_photo);
                                    
							   if(dspage.Rows.Count>0)
                               {
                                   for (int i = 0; i < dspage.Rows.Count; i++)
                                    {
                                       
                                       
								%>
		<a rel="example_group" href="<%= dspage.Rows[i]["filepath"].ToString()%>" title="Facilities- Durg Science College" >
        <img class="last v_img " alt="Facilities- Durg Science College" src="<%= dspage.Rows[i]["filepath"].ToString()%>"/></a>
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
</asp:Content>

