<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_vision.aspx.cs" Inherits="update_news" ValidateRequest="false" Title="Latest Post" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Post Vision & Mission
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
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
										<li class="active">Post Vision & Mission</li>
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
                    <h2 class="ui-title-block">Post <strong>Vision & Mission</strong></h2>
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
        <td  align="left" width="130">
            &nbsp;</td>
        <td  align="left">
            
        </td>
        <td  align="right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td height="43" align="left" valign="top">
            Description :</td>
        <td colspan="2">
            <cc1:Editor ID="txt_description" runat="server" Height="400px" />
        </td>
    </tr>
    <tr>
        <td height="43" align="left">
            
            Upload Pic</td>
        <td align="left" colspan="2">
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
        <td height="43" align="left">&nbsp;</td>
        <td align="left" colspan="2">
            <asp:Image ID="img_intro" runat="server" Height="180px" Width="300px" />
        </td>
    </tr>
    <tr>
        <td height="43" align="left">&nbsp;</td>
        <td align="left" colspan="2">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                style="height: 30px" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" align="center"><asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
</table>
               </div>
           </div>
 </section>

</asp:Content>

