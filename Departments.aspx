<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="_Pasteventsdetails" Title="Upcoming Events" %>

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

    <style>
        .rtd .container-fluid {
            padding-left:0px;
        }

    </style>
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
        .dept_ach {
            margin:20px;
        }
    </style>
    <style>
      blink {
        animation: blinker 0.9s linear infinite;
        color: #f00;
       }
      @keyframes blinker {  
        50% { opacity: 0; }
       }
       .blink-one {
         animation: blinker-one 1s linear infinite;
       }
       @keyframes blinker-one {  
         0% { opacity: 0; }
       }
       .blink-two {
         animation: blinker-two 1.4s linear infinite;
       }
       @keyframes blinker-two {  
         100% { opacity: 0; }
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="wrap-title-page">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page"><asp:Label ID="lbl_Department_of" runat="server">Department of </asp:Label><asp:Label ID="lbl_title" runat="server"></asp:Label></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
    
    
    <section class="rtd">
      <div class="container-fluid">
    
          <div class="row">
              <div class="col-md-3">
                  <aside class="sidebar sidebar_mod-a">
                      <section class="widget widget-default widget_categories">
				        <h3 class="widget-title ui-title-inner decor decor_mod-a"><asp:Label ID="lblCategoryName" runat="server"></asp:Label></h3>
                        <% if(Request.QueryString["dp"].ToString()=="Political Science")
                             {
                        %>
                          <h5 class="font-10 text-black m-0" style="text-align:left">
                              <a href="Student_section.aspx?title=Political Science" >
                                <strong style="color:black;font-weight:700">
                                    <blink ><img src="images/new1.gif" />&nbsp; Course Material</blink>
                                </strong>
                              </a> 
                          </h5>
                          <%} %>
						    <div class="block_content">
								<ul class="list-categories list-unstyled">
									<asp:PlaceHolder ID="placeCategory" runat="server"></asp:PlaceHolder>
                                        <asp:PlaceHolder ID="facultyph" runat="server"></asp:PlaceHolder>
                              <asp:PlaceHolder ID="achievementph" runat="server"></asp:PlaceHolder>
                              <asp:PlaceHolder ID="eventph" runat="server"></asp:PlaceHolder>
										</ul>
									</div><!-- end block_content -->
                          
								</section>                      
                  </aside>
              </div>
              <div class="col-md-9">
                  <h2 class="ui-title-block"><asp:Label ID="lbldepname" runat="server"></asp:Label> <strong><asp:Label ID="lbl_Department_of1" runat="server">Department</asp:Label></strong></h2>
                        <h2 class="text-uppercase font-weight-600 mt-0 font-28 line-bottom"><asp:Label ID="lbl_event" runat="server"></asp:Label></h2>                    
                          <div class="container-fluid">
                              <div class="row">
                                <div class="col-md-12">                                  
                                    <asp:PlaceHolder ID ="desc_content" runat="server"></asp:PlaceHolder>
                                </div>
                            </div>
                              </div>
                          <div class="container-fluid">
                            <div class="row">
                            <br />
                                <div class="col-md-12">
                                    <center><h1 class='text-uppercase font-weight-600 mt-0 font-28 line-bottom dept_ach'><asp:PlaceHolder ID="lbl_faculty" runat="server"></asp:PlaceHolder></h1></center>
                                </div>
                                <br />    
                            </div>   
                              </div>
                          <div class="container-fluid">
                             
                  <div class="row">
                  <div align="center" style="width:100%;overflow-x:auto;">
                                      <asp:GridView ID="gv_faculty" runat="server" AutoGenerateColumns="False"  CellPadding="4" 
                            Width="100%" BackColor="White" BorderColor="#CC9966" BorderStyle="None"  BorderWidth="1px" OnRowCommand="gv_faculty_RowCommand" >
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:TemplateField HeaderText="S No">
                           <ItemTemplate> <%# Container.DataItemIndex + 1 %>  </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Faculty Photo">
                            <ItemTemplate>
                        <asp:Image ID="img_pic" runat="server" ImageUrl='<%# Eval("filepath") %>' Width="90" Height="110" BorderWidth="1" BorderColor="Black" BorderStyle="Solid" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="faculty_name" HeaderText="Faculty Name" />
                        <asp:BoundField DataField="faculty_qualification" HeaderText="Qualification" />
                        <asp:BoundField DataField="faculty_department" HeaderText="Department" />
                        <asp:BoundField DataField="faculty_designation" HeaderText="Designation" />
                        <asp:BoundField DataField="faculty_mobile" HeaderText="Mobile No" />
                <asp:TemplateField HeaderText="Profile" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnViewProfile" runat="server" Text="View Profile" OnClick="btnViewProfile_Click" CommandName="Profile" CommandArgument='<%# Eval("faculty_id") %>'  />
                    </ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
                                     </div>   
                      </div>
                             </div>
                  
                          <div class="container-fluid">
                   
                      <div class="row">
                            <br />
                                <div class="col-md-12">
                                    <center><h1 class='text-uppercase font-weight-600 mt-0 font-28 line-bottom dept_ach'><asp:PlaceHolder ID="ach_holder" runat="server"></asp:PlaceHolder></h1></center>
                                </div>
                                <br />    
                            </div>     
                              </div>
                          <div class="container-fluid">
                    
                 <div class="row">                      
                 <div class="col-lg-12 col-md-12 col-sm-12"><span id="desc_content2" runat="server"></span></div>
              </div>               
                </div>
                          <div class="container-fluid">
                        <div class="row">
                            <br />
                                <div class="col-md-12">
                                    <center><h1 class='text-uppercase font-weight-600 mt-0 font-28 line-bottom dept_ach'><asp:PlaceHolder ID="event_holder" runat="server" Visible="false"></asp:PlaceHolder></h1></center>
                                </div>
                                <br />    
                            </div>       
                              </div>
                          <div class="container-fluid">
                 <div class="row">                      
                    <div class="col-lg-12 col-md-12 col-sm-12"><span id="desc_content1" runat="server"></span></div>
                    </div>               
                              </div>                
            </div>

             </div>
          </div>  
    </section>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />   
       <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=gv_faculty]').footable();
        });
    </script>
</asp:Content>

