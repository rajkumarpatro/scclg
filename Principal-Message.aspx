<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Principal-Message.aspx.cs" Inherits="introduction" Title="Principals Message | Govt.V.Y.T.PG. Autonomous College, Durg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Principal's Message</h1></div>
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
										<li class="active">Principal's Message</li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->
    
     
    
     <section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
                   
                <div class="row">   
                 <div class="col-md-4" >  
                        <asp:Image ID="img_caption" runat="server" Width="100%" Height="200" class='img-responsive'></asp:Image>
                    </div>
                    <div class="col-md-8" >
                          <span id="span_content" runat="server"></span> 
                  </div>
                   
                </div>
            <br /> 
              
            </div> 
                  
          </div>        
        </div>
      </div>
    </section>
</div>


</asp:Content>

