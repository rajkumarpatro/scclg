<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Post-Department-Events.aspx.cs" Inherits="update_news" ValidateRequest="false" Title="Latest Post" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Department Events</h1></div>
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
										<li class="active">Department Events</li>
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
                    <h2 class="ui-title-block">Department <strong>Events</strong><asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager></h2>
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
        <td align="left">
            Select Department</td>
        <td align="left" style="padding:5px;">
           <asp:DropDownList ID="ddl_department" runat="server" 
                BorderStyle="Dashed" BorderWidth="1"
                Width="350px" BorderColor="Black" AutoPostBack="True" 
                onselectedindexchanged="ddl_department_SelectedIndexChanged">
            </asp:DropDownList></td>
        <td align="right" style="padding:5px;">
            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True"></asp:Label>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td align="left">
            Event Name</td>
        <td align="left" colspan="2" style="padding:5px;">
            <asp:TextBox ID="txt_Title" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="400px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left">
            Event Start Date</td>
        <td align="left" colspan="2" style="padding:5px;">
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                TargetControlID="txt_date" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
            <asp:TextBox ID="txt_date" runat="server" 
                Width="400px" BorderStyle="Dashed" BorderWidth="1"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                TargetControlID="txt_date" ValidChars="0987654321/-">
            </asp:FilteredTextBoxExtender>
        </td>
    </tr>
    <tr>
        <td align="left">
            Venue</td>
        <td 
            align="left" colspan="2" style="padding:5px;">
            <asp:TextBox ID="txt_venue" runat="server" 
                Width="400px" BorderStyle="Dashed" BorderWidth="1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left">
            Description :</td>
        <td colspan="2" style="padding:5px;">
            <cc1:Editor ID="txt_description" runat="server" Height="400px" />
        </td>
    </tr>
    <tr>
        <td align="left">
            
            Upload Photos (If any)</td>
        <td align="left" valign="top" colspan="2" style="padding:5px;">
            
                    
                
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                Font-Bold="True" ForeColor="Black">Upload Photo</asp:LinkButton>
        
                                            </td>
    </tr>
    <tr>
        <td align="left">
            
            Upload Front Pic</td>
        <td align="left" valign="top" colspan="2" style="padding:5px;">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;&nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" 
                oncheckedchanged="chk_new_CheckedChanged" Text="New Photo" Visible="False" />
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            
            Order No.</td>
        <td align="left" valign="top" colspan="2" style="padding:5px;">
            <asp:DropDownList ID="ddl_order" runat="server" Width="150px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="left">&nbsp;</td>
        <td align="center" colspan="2" style="padding:5px;">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                style="height: 30px" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp; &nbsp;
            <asp:ImageButton ID="img_del" runat="server" 
                OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                ImageUrl="~/Images/delete-button01.png" onclick="img_del_Click" 
                Width="100px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="img_back" runat="server" ImageUrl="~/images/icon_back.jpg" 
                onclick="img_back_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" align="left"><h4>Existing Post</h4>
            </td>   
    </tr>

    <tr>
        <td style="line-height:3em;" colspan="3" align="left">
            
            <asp:GridView ID="news_Grid" runat="server" AutoGenerateSelectButton="True" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                Width="100%" OnSelectedIndexChanged="news_Grid_SelectedIndexChanged" 
                style="left: 1px; top: -4px" >
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
        <td colspan="3" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                    </div>
                </div>
    </section>


    

</asp:Content>

