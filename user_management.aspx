<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="user_management.aspx.cs" Inherits="user_management" Title="User Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Change Password</h1></div>
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
										<li class="active">Change Password</li>
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
                    <h2 class="ui-title-block">Change <strong>Password</strong></h2>
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
            Enter Old Password</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txtOldPassword" runat="server" BorderStyle="Dashed" 
                Width="350px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left">
            Enter New Password</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txtNewPassword" runat="server" BorderStyle="Dashed" 
                Width="350px" BorderWidth="1px" TextMode="Password" BorderColor="Black"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left">
            Retype New Password</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txtRetypePasssword" runat="server" BorderStyle="Dashed" 
                Width="350px" BorderWidth="1px" TextMode="Password" BorderColor="Black"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style2">
            &nbsp;</td>
        <td align="left">
        <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" OnClientClick="return confirm('Are you sure you want to change password?');" />
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style2">
            &nbsp;</td>
        <td style="font-family: arial, Helvetica, sans-serif; color:Black; font-size: small;">
            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
    </div>
                </div>
    </section>


    

</asp:Content>

