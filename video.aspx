<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="video.aspx.cs" Inherits="introduction" Title="Videos | Govt.V.Y.T.PG. Autonomous College, Durg" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="main-content">

                <div class="wrap-title-page">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <%
                                    string str_query = "SELECT [D_id],CONVERT(VARCHAR(10),D_date,105) AS D_date,[Description],[URL],[D_page] FROM [dbo].[TBL_VIDEO] where D_id="+Request.QueryString["vid"]+" order by D_id desc";
                                    DataTable dt_details = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text,str_query);
                                %>

                                <h1 class="ui-title-page"><%= dt_details.Rows[0]["Description"] %></h1>
                            </div>
                        </div>
                    </div>
                    <!-- end container-->
                </div>
                <!-- end wrap-title-page -->


                <div class="container">
                    <div class="section-content">
                        <div class="row">
                            <div class="col-md-3">
                                &nbsp;
                            </div>
                            <div class="col-md-9">
                                &nbsp;
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <iframe src="https://drive.google.com/file/d/<%= dt_details.Rows[0]["URL"] %>/preview" width="640" height="480" allow="autoplay"></iframe>
                                
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-3">
                                &nbsp;
                            </div>
                            <div class="col-md-9">
                                &nbsp;
                <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </ajaxtoolkit:ToolkitScriptManager>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                &nbsp;
                            </div>
                            <div class="col-md-9">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

