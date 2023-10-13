<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Research.aspx.cs" Inherits="introduction" Title="Chaitanya College, Pamgarh | Best College College in Pamgarh | Bilaspur" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Research- <asp:Label ID="lbl_title" runat="server"></asp:Label></h1></div>
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
										<li class="active">Research</li>
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
                    <h2 class="ui-title-block">Research- <strong><asp:Label ID="lbl_title1" runat="server"></asp:Label></strong></h2>
                 </div>
             </div>
         </div>
      </div>
    </section>
    
    <section class="rtd">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12"> 
               
                <div class="row">
                    <div class="col-md-12">
                    <span id="desc_content" runat="server"></span>
                    </div>
                </div>
            </div>
         </div>  
         </div>      
        </div>             
    </section>
    
 </div>


 </asp:Content>

