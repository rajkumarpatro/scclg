<%@ Page Title="Contact Us - Chemistry World" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

<%-- Add content controls here --%>
<asp:Content ContentPlaceHolderID ="head" runat="server">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
    <link href="css/animate.css" rel="stylesheet" type="text/css">
<link href="css/css-plugin-collections.css" rel="stylesheet"/>
<!-- CSS | menuzord megamenu skins -->
<link id="menuzord-menu-skins" href="css/menuzord-skins/menuzord-rounded-boxed.css" rel="stylesheet"/>
<!-- CSS | Main style file -->
<link href="css/style-main.css" rel="stylesheet" type="text/css">
<!-- CSS | Preloader Styles -->
<%--<link href="css/preloader.css" rel="stylesheet" type="text/css">--%>
<!-- CSS | Custom Margin Padding Collection -->
<link href="css/custom-bootstrap-margin-padding.css" rel="stylesheet" type="text/css">
<!-- CSS | Responsive media queries -->
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
<!-- <link href="css/style.css" rel="stylesheet" type="text/css"> -->

<!-- Revolution Slider 5.x CSS settings -->
<link  href="js/revolution-slider/css/settings.css" rel="stylesheet" type="text/css"/>
<link  href="js/revolution-slider/css/layers.css" rel="stylesheet" type="text/css"/>
<link  href="js/revolution-slider/css/navigation.css" rel="stylesheet" type="text/css"/>

<!-- CSS | Theme Color -->
<link href="css/colors/theme-skin-color-set-1.css" rel="stylesheet" type="text/css">
<link href="css/custom.css" rel="stylesheet" type="text/css" />

<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="js/jquery-plugin-collection.js"></script>

</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="main-content">
    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/cw/assets/bg5.jpg" style="background-image: url(&quot;images/cw/assets/bg5.jpg&quot;); background-position: 50% 85px;">
      <div class="container pt-70 pb-20">
        <!-- Section Content -->
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h2 class="title text-white">Contact Us</h2>
              <ol class="breadcrumb text-left text-black mt-10">
                <li><a href="#">Home</a></li>
                <li><a href="#">Contact Us</a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
     </section>   
  <section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h6 class="letter-space-4 text-gray-darkgray text-uppercase mt-0 mb-0">Contact Us</h6>
              <h2 class="text-uppercase font-weight-600 mt-0 font-28 line-bottom">Contact Us</h2>

                <div class="section-title-2 text-center">
                    <h2>CONTACT DETAILS</h2>
                    <p class="lead">For enquiries, please use form below</p>
                    <hr>
                </div><!-- end section-title -->                
                <div class="row">
                    <div class="col-md-5">
                        <div class="widget">
                            <p>For any kind of help and enquiries, please contact us and fill the form below.</p>
                            <hr>
                            <ul class="contact-details">
                                <li><i class="fa fa-link"></i> <a href="http://chemistryworldedu.com">chemistryworldedu.com</a></li>
                                <li><i class="fa fa-envelope-o"></i> <a href="mailto:contact@chemistryworldedu.com ">contact@chemistryworldedu.com</a></li>
                                <li><i class="fa fa-phone"></i> 94792-78258,</li>
                                <li><i class="fa fa-fax"></i>  90090-22994</li>
                                <li><i class="fa fa-home"></i>226, Zonal Market, Sector-10, Bhilai (C.G.).</li>
                            </ul>
                            <hr>
                            <div class="social-icons">
                                <ul class="list-inline">
                                <li class="facebook"><a data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                </ul>
                            </div><!-- end social icons -->
                        </div><!-- end widget -->
                    </div>   
                    <div class="col-md-7">
                        <div class="contact_form">
                            <div id="message"></div>
                                <div class="col-md-12">
                                <input type="text" name="name" id="name" class="form-control" placeholder="Name" runat="server" required>                         
                                <input type="text" name="phone" id="phone" class="form-control" placeholder="Phone" runat="server" required>                                   
                                <textarea class="form-control" name="comments" id="comments" rows="6" placeholder="Message Below" runat="server" required></textarea>
                                <asp:Button runat="server" id="submit" class="btn btn-primary" Text="Send" OnClick="submit_Click" />
                                </div>
                        </div>
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
              </div>
            </div>
          </div>
        </section>
    </div>

 

</asp:Content>
