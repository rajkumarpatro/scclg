<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CPanel.aspx.cs" Inherits="CPanel" Title="Control Panel " %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page">Control Panel</h1>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->

    <section>
        <div class="container">
            <div class="section-content">
                <div class="row">
                    <div class="col-md-12">
                        
                        <h4>
                            <asp:Label runat="server" ID="lbl_user" ForeColor="Maroon">tewr</asp:Label></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="container">
            <div class="section-content">
                
                <div class="row">
                    <div class="col-md-12">                        
                        <%--<a href="user_management.aspx" class="btn btn-primary">Change Password</a>&nbsp;
                        <a href="Post-Latest-News.aspx" class="btn btn-primary">Latest News</a>&nbsp;
                        <a href="post_video.aspx" class="btn btn-primary">Videos</a>--%>
                    </div>
                </div>
                <br/>
                
                <div class="row" style="display:none;">
                    <div class="col-md-3">
                        <asp:ImageButton ID="img_media" runat="server" Height="100px" ImageUrl="~/images/icon_magazine.png" onclick="img_media_Click" />
                    </div>
                    <div class="col-md-3">
                        <asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="~/images/img_quick.png" onclick="ImageButton12_Click1" />
                    </div>
                    <div class="col-md-3">
                        <asp:ImageButton ID="img_instruments" runat="server" Height="100px" ImageUrl="~/images/icon_instruments.png" onclick="img_instruments_Click" />
                    </div>
                    <div class="col-md-3">
                        <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/images/img_ss.png" onclick="ImageButton11_Click1" />
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    
</asp:Content>

