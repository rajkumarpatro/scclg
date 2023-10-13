<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_facilities.aspx.cs" Inherits="update_news" ValidateRequest="false" Title="Post Facilities" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Post Facilities<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager></h1></div>
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
										<li class="active">Post Facilities</li>
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
                    <h2 class="ui-title-block">Post <strong>Facilities</strong></h2>
                    <h4><asp:Label runat="server" ID="lbl_user" ForeColor="Maroon"></asp:Label></h4>
                 </div>
             </div>
         </div>
      </div>
    </section>
<section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">    
                     <table width="100%">
    
    <tr>
        <td height="43" align="left" width="150">
            Facility Page</td>
        <td align="left"><asp:Label runat="server" ID="lbl_facility">Page Not Selected</asp:Label>
            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="False"></asp:Label>
        </td>
        <td align="right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td height="43" align="left">
            Entry Date</td>
        <td align="left" colspan="2">
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                TargetControlID="txt_date" Format="dd-MM-yyyy">
            </asp:CalendarExtender>
            <asp:TextBox ID="txt_date" runat="server" 
                Width="400px" BorderStyle="Dashed" BorderWidth="1"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                TargetControlID="txt_date" ValidChars="0987654321/-">
            </asp:FilteredTextBoxExtender>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Description :</td>
        <td colspan="2">
            <cc1:Editor ID="txt_description" runat="server" Height="400px" />
        </td>
    </tr>
    <tr>
        <td height="43" align="left">Upload Photos (If any)</td>
        <td align="left" colspan="2"><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                Font-Bold="True" ForeColor="Black">Upload Photo</asp:LinkButton></td>
    </tr>
    <tr>
        <td align="left">
            
            </td>
        <td height="43" colspan="2" align="left">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                style="height: 30px" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/back.jpg" 
                onclick="ImageButton3_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" align="left" style="line-height:3em;">
            
            Existing Post<asp:GridView ID="news_Grid" runat="server" 
                AutoGenerateColumns="False" AutoGenerateSelectButton="True" CellPadding="4"
                ForeColor="#333333" GridLines="None" 
                Width="100%" OnSelectedIndexChanged="news_Grid_SelectedIndexChanged" style="left: 1px; top: -4px" 
                DataKeyNames="ID" >
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="PageName" HeaderText="PageName" 
                        SortExpression="PageName" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
           
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


</asp:Content>

