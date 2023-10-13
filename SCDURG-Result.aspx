<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="SCDURG-Result.aspx.cs" Inherits="CLogin" Title="Login Here !" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- Save for Web Slices (login-kad1r.com.png) -->

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Result Login</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				

    
      <section class="about rtd">
		<div class="container">
			<div class="row">
			    <div class="col-xs-4">&nbsp;</div>
			    <div class="col-xs-4">
            <h2 class="ui-title-block">Result <strong>Login</strong></h2>
            <hr>                 
                <div class="row">
                <div class="form-group col-md-12">
                  <label for="form_username_email">Username/Email</label>
                  <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txt_Username" ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZ0987654321abcdefghijklmnopqrstuvwxyz"></ajaxtoolkit:FilteredTextBoxExtender>
                  <asp:TextBox ID="txt_Username" runat="server" class="form-control" placeholder="User Name" ></asp:TextBox>
                </div>
                                        <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                        </ajaxtoolkit:ToolkitScriptManager>
                </div>
                <div class="row">
                <div class="form-group col-md-12">
                  <label for="form_password">Password</label>
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" class="form-control" placeholder="Password" ></asp:TextBox></div>
                            <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txt_Password" ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZ0987654321abcdefghijklmnopqrstuvwxyz"></ajaxtoolkit:FilteredTextBoxExtender>
                </div>
                <div class="row">
              <div class="form-group col-md-12">
                 <asp:Button runat="server" Text="Login"  class="post-btn btn btn-primary btn-effect" ID="btn_login" OnClick="btn_login_Click"></asp:Button>
              </div>
                </div>
                </div>
                <div class="col-xs-4">&nbsp;</div>
                </div>
              </div>
    </section>
</asp:Content>

