<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="downloads" Title="Downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="main-content">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Reports- <asp:Label ID="lbl_title" runat="server"></asp:Label></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->




    
   <section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
             
                <div class="row">
                    <div class="col-md-12" style="line-height:3em; font-family:Calibri; font-size:16px;"><br />
                         <asp:GridView ID="grid_record" runat="server" BackColor="White" 
                             BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                             ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="100%" Visible="False">
                            <EmptyDataTemplate>No records Found</EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate><%# Container.DataItemIndex+1 %></ItemTemplate>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                
                             <%--<asp:BoundField DataField="Description" HeaderText="Description" />--%>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Description")%>
                                    </ItemTemplate>
                                    <ItemStyle Width="75%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                     <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "D_date")%>
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
                    </div>
                </div>
                <div class="row">
                   <div class="col-md-12">
                     <asp:Label ID="lbl_msg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                   </div><br />    
                </div>
             </div>
          </div>  
         </div>      
        </div>             
    </section>
   
   
</div>

 
    
</asp:Content>
