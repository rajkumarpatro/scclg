<%@ Page Title="Archive" Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="Archive.aspx.cs" Inherits="introduction" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<!-- Start Banner -->
<div class="main-content">

<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h3 style="color:#fff;">
    <asp:Label ID="lbl_title" runat="server"></asp:Label></h3></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
				
  
    
    <section class="rtd">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              
                <div class="row">
                    <div class="col-md-12"><br /><br />
                        
                            
                            

						   <div >
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
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "news_Title")%></ItemTemplate>
                                     <ItemStyle Width="75%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Date">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "news_date")%></ItemTemplate>
                                     <ItemStyle Width="10%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Download">
                                      <ItemTemplate>
                                          <a href ='<%#""+DataBinder.Eval(Container.DataItem,"news_filepath") %>' target="_blank" style="color:Black;">
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
                    
                  <!-- end post -->                                 
              </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </section>
    </div>
    
	
</asp:Content>