<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="Syllabus.aspx.cs" Inherits="introduction" Title="Results | Govt.V.Y.T.PG. Autonomous College, Durg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
 <div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Download Syllabus</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
    
     
      <div class="container">
        <div class="section-content">
             
          <div class="row">
            <div class="col-md-3">
                Select Programme
            </div> 
            <div class="col-md-9">
                 <asp:DropDownList ID="ddl_programme" runat="server" BorderStyle="Dashed" 
                     Width="300px" BorderWidth="1px" BorderColor="Black" 
                     AutoPostBack="True" onselectedindexchanged="ddl_programme_SelectedIndexChanged">
                    <asp:ListItem>Select Page</asp:ListItem>
                    <asp:ListItem>B.Sc.</asp:ListItem>
                    <asp:ListItem>B.A.</asp:ListItem>
                    <asp:ListItem>B.Com.</asp:ListItem>
                    <asp:ListItem>B.Lib.</asp:ListItem>
                    <asp:ListItem>M.Sc.</asp:ListItem>
                    <asp:ListItem>M.A.</asp:ListItem>
                    <asp:ListItem>M.Com.</asp:ListItem>
                    <asp:ListItem>M.Lib.</asp:ListItem>
                     <asp:ListItem>M.S.W.</asp:ListItem>
                    <asp:ListItem>Doctoral</asp:ListItem>
                    <asp:ListItem>Professional</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                </asp:DropDownList>
            </div> 
            <div class="row">
            <div class="col-md-12"><asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
            </div> 
            </div> 
          </div>  
            <div class="row">
            <div class="col-md-3">
                Select Session
            </div> 
            <div class="col-md-9">
                 <asp:DropDownList ID="ddl_session" runat="server" BorderStyle="Dashed" 
                     Width="300px" BorderWidth="1px" BorderColor="Black" AutoPostBack="True" 
                     onselectedindexchanged="ddl_session_SelectedIndexChanged">
                    
                </asp:DropDownList>
            </div> 
            <div class="row">
            <div class="col-md-12">
            &nbsp;
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
            
            </div> 
            
          </div>   
          </div>
          <div class="row">
            <div class="col-md-3">&nbsp;
            </div> 
            <div class="col-md-9">&nbsp;
            </div> 
          </div>  
          <div class="row">
            <div class="col-md-12">
            <asp:GridView ID="gv_topic" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="3" Font-Names="Calibri" Font-Size="14px" ForeColor="Black" 
                GridLines="Vertical" Width="100%"  
                    EmptyDataText="No Record Found" OnSelectedIndexChanged="gv_topic_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                     <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                     </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="file_details" HeaderText="Description" />
                    <asp:TemplateField HeaderText="Download">
                     <ItemTemplate>
                        <a href ='<%#""+DataBinder.Eval(Container.DataItem,"file_path") %>' target="_blank" style="color:Black;">Click Here</a>
                     </ItemTemplate>
                </asp:TemplateField>
                    
                                    
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            </div> 
          </div>  
          <div class="row">
            <div class="col-md-3">&nbsp;
            </div> 
            <div class="col-md-9">&nbsp;
                <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </ajaxtoolkit:ToolkitScriptManager>
            </div> 
          </div>  
          <div class="row">
            <div class="col-md-3">&nbsp;
            </div> 
            <div class="col-md-9">&nbsp;
            </div> 
          </div>  
          </div>      
        </div>
 </div>
</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>

