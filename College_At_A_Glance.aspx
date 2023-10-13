<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="College_At_A_Glance.aspx.cs" Inherits="College_At_A_Glance" Title="Introduction | Govt.V.Y.T.PG. Autonomous College, Durg" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page"><asp:Label id="lbl_title" runat="server"></asp:Label></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


    
     <section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
                <%
                    
                    string st_id = Request.QueryString["pname"];
                    DataTable dt_data = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT * FROM [TBL_INTRODUCTION]");
                    DataTable adp1 = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, "SELECT * FROM [TBL_INTRODUCTION] where PAGE_NAME='" + st_id.ToString().Trim() + "'");

                    if (adp1.Rows[0]["PAGE_IMAGE"].ToString() == "newsData/noimage.png")
                    {
            %>
                <div class="row">
                    <div class="col-md-12">
                        <%= Server.HtmlDecode(adp1.Rows[0]["PAGE_DESCRIPTION"].ToString())%>
                    </div>
                </div>
            <%
                    }
                    else
                    {
            %>
                <div class="row">
                    <div class="col-md-4">
                        <img src="<%= adp1.Rows[0]["PAGE_IMAGE"].ToString()%>" class="img-responsive" alt="Govt Science College Durg" />
                    </div>
                    <div class="col-md-8">
                        <%= Server.HtmlDecode(adp1.Rows[0]["PAGE_DESCRIPTION"].ToString())%>
                    </div>
                </div>
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

