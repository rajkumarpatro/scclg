<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_reports.aspx.cs" Inherits="update_news" Title="Post Reports" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Post Reports<asp:ToolkitScriptManager ID="ToolkitScriptManager1" 
                runat="server">
            </asp:ToolkitScriptManager></h1></div>
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
										<li class="active">Post Reports</li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->
    
     <section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                 <div class="col-md-12">
                    <h2 class="ui-title-block">Post <strong>Reports</strong></h2>
                    <h4><asp:Label runat="server" ID="lbl_user" ForeColor="Maroon"></asp:Label></h4>
                 </div>
             </div>
         </div>
      </div>
    </section>
    <section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center"> 
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
    
    <tr>
        <td align="left" class="site_text">
            Id : </td>
        <td align="left">
            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True"></asp:Label>
        </td>
        <td align="right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text">
            Date : </td>
        <td align="left">
            <asp:TextBox ID="txtDisplayDate" runat="server" BorderStyle="Dashed" BorderWidth="1" 
                Width="220px"></asp:TextBox>
            
            <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender" 
                runat="server" Enabled="True" ValidChars="0123456789/" TargetControlID="txtDisplayDate">
            </asp:FilteredTextBoxExtender>
            
            <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="txtDisplayDate" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
            
        </td>
        <td align="left" rowspan="3">
        
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="site_text">
            Description :</td>
        <td align="left">
            <asp:TextBox ID="txt_Description" runat="server" BorderStyle="Dashed" BorderWidth="1" 
                Width="500px" Height="50px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text">
            
            Page :
        </td>
        <td align="left" width="55%">
            <asp:DropDownList ID="ddl_page" runat="server" Width="200px">
                <asp:ListItem>SSR Reports</asp:ListItem>
                <asp:ListItem>AQAR Reports</asp:ListItem>
                <asp:ListItem>NAAC Certificate</asp:ListItem>
				<asp:ListItem>Peer Team Report</asp:ListItem>
				<asp:ListItem>IQAC – Minutes of Meeting</asp:ListItem>
                <asp:ListItem>NIRF Reports</asp:ListItem>
                <asp:ListItem>Other Reports</asp:ListItem>
            </asp:DropDownList>
                                    </td>
    </tr>
    <tr>
        <td align="left" class="site_text">
            
            <asp:Label ID="lblFilePath" runat="server">File :</asp:Label>
        </td>
        <td align="left" colspan="2">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" 
                oncheckedchanged="chk_new_CheckedChanged" Text="Upload New File" 
                Visible="False" />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style2">
            
            &nbsp;</td>
        <td style="text-align: left" class="style2" colspan="2">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style2">
            
            </td>
        <td style="text-align: left" class="style2" colspan="2">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" />
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp; &nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="img_del" runat="server" 
                OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                ImageUrl="~/Images/delete-button01.png" onclick="img_del_Click" 
                Width="100px" />
            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td style="line-height:3em;" 
            colspan="3" align="left">
            
            Existing Reports<asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" 
                AutoGenerateSelectButton="True" CellPadding="4"
                DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
                Width="100%" OnSelectedIndexChanged="news_Grid_SelectedIndexChanged" 
                OnRowDeleting="news_Grid_RowDeleting" style="left: 1px; top: -4px" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="D_id" HeaderText="D_id" SortExpression="D_id" />
                    <asp:BoundField DataField="D_date" HeaderText="D_date" 
                        SortExpression="D_date" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                    <asp:BoundField DataField="Page" HeaderText="Page" 
                        SortExpression="Page" />
                    <asp:BoundField DataField="filepath" HeaderText="filepath" 
                        SortExpression="filepath" />
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            &nbsp;<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/cDatabase.mdb" 
                
                
                SelectCommand="SELECT [D_id], [D_date], [Description],D_page as [Page], [filepath] FROM [tbl_reports] order by D_page, D_id desc">
            </asp:AccessDataSource>
          </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            colspan="3" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                 </div>
             </div>
  </section>

<script  type="text/javascript" src="js/custom.js"></script>
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

