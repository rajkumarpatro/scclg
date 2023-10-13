<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="QuestionPaper.aspx.cs" Inherits="QuestionPaper" Title="Question Paper" %>

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
							<div class="col-xs-12"><h1 class="ui-title-page">Question Paper<asp:ScriptManager runat="server"></asp:ScriptManager></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
				
  
    
    <section class="rtd">
      <div class="container">
        <div class="section-content" style="min-height:600px;">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
          <div class="row">
            <div class="col-md-12"><br />
                <br />
               <div class="row">
                   <div class="col-lg-12">
                       <asp:DropDownList ID="ddl_admissionclasstype" runat="server" Width="100" height="40" OnSelectedIndexChanged="ddl_admissionclasstype_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="UG">UG</asp:ListItem>
                        <asp:ListItem Value="PG">PG</asp:ListItem>
                    </asp:DropDownList> &nbsp; &nbsp; 
                    <asp:DropDownList ID="ddl_admissionclass" runat="server" Width="200" height="40">
                    </asp:DropDownList>
                     &nbsp; &nbsp; 
                    <asp:DropDownList ID="ddl_part" runat="server" Width="100" height="40">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:DropDownList>
                        &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_year" runat="server" Width="200" height="40">
            </asp:DropDownList> &nbsp; &nbsp; 

                       <asp:Button runat="server" Text="Search Question Paper" class="btn btn-success" id="btn_search" OnClick="btn_search_Click"></asp:Button>
                   </div>
               </div>
                <div class="row">
                    <div class="col-md-12">
                         <asp:GridView ID="grid_record" runat="server" BackColor="White"  CssClass="footable" 
                             BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                             ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="100%" Visible="False" EmptyDataText="No Record Found">
                             
                             <EmptyDataTemplate>No records Found</EmptyDataTemplate>
                             <FooterStyle BackColor="#CCCCCC" />
                             <Columns>
                                 <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate> <%# Container.DataItemIndex+1 %> </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                 </asp:TemplateField>
                                 
                        <%--<asp:BoundField DataField="Description" HeaderText="Description" />--%>
                                 <asp:TemplateField HeaderText="Description">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ATitle")%></ItemTemplate>
                                     <ItemStyle Width="65%" />
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Year">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "AYear")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                 
                                 <asp:TemplateField HeaderText="Download">
                                      <ItemTemplate>
                                          <a href ='<%#""+DataBinder.Eval(Container.DataItem,"APath") %>' target="_blank" style="color:Black;">
                                         Click Here</a>
                                      </ItemTemplate>
                                      <ItemStyle Width="25%" />
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
