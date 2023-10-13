<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="Research-Report.aspx.cs" Inherits="Minor_Project" Title="Minor_Project" %>

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

<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Research- <asp:Label ID="lbl_title" runat="server"></asp:Label></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
				
  
    
    <section class="rtd">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              
                <div class="row">
                    <div class="col-md-12"><br />
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
                                  <asp:TemplateField HeaderText="Project Type">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "PROJECTTYPE")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Name">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "NAME")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Designation">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "DESIGNATION")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Department">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "DEPARTMENT")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Title">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "TITLE")%></ItemTemplate>
                                     <ItemStyle Width="25%" />
                                 </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Duration">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "DURATION")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Amount">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "AMOUNT")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Download">
                                      <ItemTemplate>
                                          <a href ='<%#""+DataBinder.Eval(Container.DataItem,"FILEPATH") %>' target="_blank" style="color:Black;">
                                         Click Here</a>
                                      </ItemTemplate>
                                      <ItemStyle Width="10%" />
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
    
<%--<table width="100%" border="0" cellspacing="0" cellpadding="0">
          
          
          <tr>
            <td align="center" valign="top">
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="shadow-table">
              <tr>
                <td valign="top" class="common_black_calibri" style="padding:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="100%" height="30" align="left"><h1><asp:Label ID="lbl_title" runat="server"></asp:Label></h1></td>
                  </tr>
                  <tr>
                    <td height="3" bgcolor="#1f4c6f"></td>
                  </tr>
                  <tr>
                    <td align="left" style="padding-left:10px; padding-right:10px; color:#000;" class="common_black_calibri">
                        
                        &nbsp;</td>
                  </tr>
                  <tr>
                    <td align="left" style="padding-left:10px; padding-right:10px; color:#000;" class="common_black_calibri">
                        
                        <asp:GridView ID="grid_record" runat="server" BackColor="White" 
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" 
                    Width="100%" Visible="False">
                    <EmptyDataTemplate>No records Found</EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="Description" HeaderText="Description" />--%>
      <%-- %>                  <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Description")%>
                            </ItemTemplate>
                            <ItemStyle Width="75%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "D_date")%>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Download">
                            <ItemTemplate>
                                <a href ='<%#""+DataBinder.Eval(Container.DataItem,"filepath") %>' target="_blank" style="color:Black;">
                                Click Here</a>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                        
                    </td>
                  </tr>
                  <tr>
                    <td><asp:Label ID="lbl_msg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="3" bgcolor="#1f4c6f"></td>
                  </tr>
                </table></td>
              </tr>
              
              
            </table></td>
          </tr>
          
        </table>--%>
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
