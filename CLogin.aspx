<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CLogin.aspx.cs" Inherits="CLogin" Title="Login Here !" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Save for Web Slices (login-kad1r.com.png) -->


    <section class="about rtd">
        <div class="container">
            <div class="row">
                <div class="col-xs-4">&nbsp;</div>
                <div class="col-xs-4">
                    <h2 class="ui-title-block">Admin <strong>Login</strong></h2>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:TextBox ID="txt_Username" runat="server" class="form-control" placeholder="User Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:Button runat="server" Text="Login" class="post-btn btn btn-primary btn-effect" ID="btn_login" OnClick="btn_login_Click"></asp:Button>
                            &nbsp;&nbsp;
                  <asp:Button runat="server" Text="Department Login" class="post-btn btn btn-primary btn-effect" ID="btn_web_login" OnClick="btn_web_login_Click"></asp:Button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-4">&nbsp;</div>
            </div>
        </div>
    </section>
</asp:Content>

