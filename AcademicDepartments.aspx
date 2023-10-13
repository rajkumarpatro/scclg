<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="AcademicDepartments.aspx.cs" Inherits="AcademicDepartments" Title="Academic Departments | Govt.V.Y.T.PG. Autonomous College, Durg" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
                            <%
                                string str_academic = Request.QueryString["pname"].ToString();
                            %>
							<div class="col-xs-12"><h1 class="ui-title-page"><%= str_academic %></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


    
     <section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
                <%
                    
                    

                    if (str_academic=="Science")
                    {
            %>
                <div class="row">
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Chemistry">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #f00; color: #fff; padding: 3px;">
                              <i class="icon fa fa-flask" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Chemistry</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Physics">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #ba2a32; color: #fff; padding: 3px;">
                              <i class="icon fa fa-hourglass-half" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Physics</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Mathematics">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #E79800; color: #fff; padding: 3px;">
                              <i class="icon fa fa-balance-scale" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Mathematics</h2>
                          </div>
                      </a>
                  </div>
                   <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Microbiology">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #ba2a32; color: #fff; padding: 3px;">
                              <i class="icon fa fa-tint" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Microbiology</h2>
                          </div>
                      </a>
                  </div>
              </div><br />
              <div class="row">
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Biotechnology">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color:aqua; color: #fff; padding: 3px;">
                              <i class="icon fa fa-tint" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Biotechnology</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Geology">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #f00; color: #fff; padding: 3px;">
                              <i class="icon fa fa-globe" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Geology</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Zoology">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #3b99d7; color: #fff; padding: 3px;">
                              <i class="icon fa fa-leaf" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Zoology</h2>
                          </div>
                      </a>
                  </div>
                   <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Computer%20Science">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #ccc; color: #fff; padding: 3px;">
                              <i class="icon fa fa-desktop" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Computer Science</h2>
                          </div>
                      </a>
                  </div>
              </div><br />
                <div class="row">
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Botany">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color:#c3ea20; color: #fff; padding: 3px;">
                              <i class="icon fa fa-glass" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Botany</h2>
                          </div>
                      </a>
                  </div>
              </div><br />
            <%
                    }
                    else if (str_academic=="Arts")
                    {
            %>
                <div class="row">
                  
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Economics">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #ffd800; color: #fff; padding: 3px;">
                              <i class="icon fa fa-money" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Economics</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Political%20Science">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #0252ac; color: #fff; padding: 3px;">
                              <i class="icon fa fa-balance-scale" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Political Science</h2>
                          </div>
                      </a>
                  </div>
                   <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Sociology">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #185e1d; color: #fff; padding: 3px;">
                              <i class="icon fa fa-users" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Sociology</h2>
                          </div>
                      </a>
                  </div>
                    <div class="col-md-3">
                      <a href="scpage.aspx?PageName=History">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color:#43B14B; color: #fff; padding: 3px;">
                              <i class="icon fa fa-history" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">History</h2>
                          </div>
                      </a>
                  </div>
              </div><br />
              <div class="row">
                  
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Hindi">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #e51818; color: #fff; padding: 3px;">
                              <i class="icon fa fa-money" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Hindi</h2>
                          </div>
                      </a>
                  </div>
                  <div class="col-md-3">
                      <a href="scpage.aspx?PageName=English">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #e91bf2; color: #fff; padding: 3px;">
                              <i class="icon fa fa-language" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">English</h2>
                          </div>
                      </a>
                  </div>
                   <div class="col-md-3">
                      <a href="scpage.aspx?PageName=Home%20Science">
                          <div class="title-w-icon" style="margin-bottom: 0px; background-color: #cc2691; color: #fff; padding: 3px;">
                              <i class="icon fa fa-cutlery" style="color: #fff;"></i>
                              <h2 class="ui-title-inner" style="color: #fff;">Home Science</h2>
                          </div>
                      </a>
                  </div>
              </div><br />
            <%
                    }
				%>
                
            <br /> 
              
            </div> 
                  
          </div>        
        </div>
      </div>
    </section>
</div>

</asp:Content>

