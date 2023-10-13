<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="introduction" Title="Results | Govt.V.Y.T.PG. Autonomous College, Durg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
 <div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Results</h1></div>
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
										<li class="active">Results</li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->
    
     
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-3">
                Select 
            </div> 
            <div class="col-md-9">
                 <asp:DropDownList ID="ddl_topic" runat="server" BorderStyle="Dashed" Width="300px" BorderWidth="1px" BorderColor="Black">
                    
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
            <div class="col-md-3">
                Enter Your Roll No. 
            </div> 
            <div class="col-md-9">
                             <asp:TextBox ID="txt_enroll" runat="server" BorderStyle="Dashed" 
                Width="300px" BorderWidth="1px" BorderColor="Black" MaxLength="20"></asp:TextBox>
            <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" ValidChars="0987654321" TargetControlID="txt_enroll" runat="server"></ajaxtoolkit:FilteredTextBoxExtender>
            </div> 
            <div class="row">
            <div class="col-md-12"><asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
            </div> 
            </div> 
          </div>  
            <div class="row">
            <div class="col-md-3">&nbsp;
            </div> 
            <div class="col-md-9">
                <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click"/>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:ImageButton ID="img_reset" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="img_reset_Click" />
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
            <asp:Literal ID="ltEmbed" runat="server" />
            <asp:GridView ID="gv_topic" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="3" Font-Names="Calibri" Font-Size="14px" ForeColor="Black" 
                GridLines="Vertical" Width="100%"  
                    EmptyDataText="No Result Found, Try With Another Roll Number">
                <Columns>
                    <asp:BoundField DataField="ResultRollNumber" HeaderText="Roll Number"/>
                    <asp:TemplateField HeaderText="Download">
                     <ItemTemplate>
                        <a href ='<%#""+DataBinder.Eval(Container.DataItem,"ResultPath") %>' style="color:Black;">
                        Click Here</a>
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

