<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="ExamQuestionPaper.aspx.cs" Inherits="ExamQuestionPaper" Title="Exam Question Paper" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

	<script type="text/javascript" src="source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="main-content">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page">
                        <asp:Label ID="lbl_title" runat="server"></asp:Label>
                    </h1>
                </div>
                <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxtoolkit:ToolkitScriptManager>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->
    
    <section class="rtd">
      <div class="container">
        <div class="section-content" style="min-height:600px;">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
          <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-danger">Click on Exam Date</h4>
                        <%
                            string cls = Request.QueryString["cls"].ToString();
                            SqlParameter[] sp=new SqlParameter[1];
                            sp[0]=new SqlParameter("@COURSETYPE",SqlDbType.VarChar,10);
                            sp[0].Value=Server.HtmlEncode(cls);
                            
                            string str_query = @"SELECT COUNT(AID) PAPERS,CONVERT(VARCHAR(10),ADATE,105) AS ADATE FROM TBL_ASSIGNMENT 
                                                WHERE ATYPE='Question Paper' AND COURSETYPE=@COURSETYPE GROUP BY CONVERT(VARCHAR(10),ADATE,105)";

                            DataTable dt_dates = SqlHelper.ExecuteDataTable(Connection.My_Connection(), CommandType.Text, str_query, sp);
                            foreach(DataRow dr in dt_dates.Rows)
                            {
                        %>
                                <a class="btn btn-danger" href="ExamQuestionPaper.aspx?cls=<%=cls %>&dt=<%= dr["ADATE"] %>"><%= dr["ADATE"] %></a> &nbsp; 
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <%
                            if (Request.QueryString["dt"] != null)
                            {
                        %>
                                <h3 class="text-success">Exam Question Paper for Date: <%= Request.QueryString["dt"].ToString() %></h3>
                        <%
                            }
                        %>
                         <asp:GridView ID="grid_record" runat="server" BackColor="White"  CssClass="footable" 
                             BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                             ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="100%" Visible="False">
                             
                             <EmptyDataTemplate>No records Found</EmptyDataTemplate>
                             <FooterStyle BackColor="#CCCCCC" />
                             <Columns>
                                 <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate> <%# Container.DataItemIndex+1 %> </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                 </asp:TemplateField>
                                 
                        <%--<asp:BoundField DataField="Description" HeaderText="Description" />--%>
                                 <asp:TemplateField HeaderText="Description">
                                     <ItemTemplate>
                                         <a href ='<%#""+DataBinder.Eval(Container.DataItem,"APath") %>' target="_blank" style="color:Black;">
                                             <%# DataBinder.Eval(Container.DataItem, "ATitle")%><br />Click Here</a>
                                     </ItemTemplate>
                                     <ItemStyle Width="95%" />
                                 </asp:TemplateField>
                                 
                            </Columns>
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                         </asp:GridView>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lbl_msg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
          </div>  
         </div>      
        </div>             
     </section>
   
   
</div>
    </ContentTemplate>
        </asp:UpdatePanel> 

      
    <script type="text/javascript">
        $(function () {
            $('[id*=grid_record]').footable();
        });
    </script>
   <script src="js/custom.js"></script>
  <script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.carousel.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.kenburn.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.migration.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="js/revolution-slider/js/extensions/revolution.extension.video.min.js"></script>  
</asp:Content>
