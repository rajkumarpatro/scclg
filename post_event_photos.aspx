<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_event_photos.aspx.cs" Inherits="update_news" Title="Latest Post" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Home Page- Flash Photos</h1></div>
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
										<li class="active">Home Page- Flash Photos</li>
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
                    <h2 class="ui-title-block">Home Page- <strong>Flash Photos</strong></h2>
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
        <td style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
             align="left" class="style13">
            ID</td>
        <td style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
             align="left">
            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" ForeColor="#333333"></asp:Label>
        </td>
        <td style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
             align="right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
            align="left" class="style13">
            Caption :</td>
        <td align="left" 
            style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
            colspan="2" >
            <asp:TextBox ID="txt_name" runat="server" BorderStyle="Dashed" 
                Width="300px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
            &nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label></td>
    </tr>
    <tr>
        <td style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
            align="left" valign="top" class="style13">
            
            Upload Image</td>
        <td style="font-family: arial, Helvetica, sans-serif; font-size: small; color:Black;" 
            align="left" valign="top" colspan="2">
            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="None" />
            &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            class="style14">
            
            </td>
        <td style="text-align: left" class="style2" colspan="2">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp; &nbsp;
            <asp:ImageButton ID="img_del" runat="server" 
                OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                ImageUrl="~/Images/delete-button01.png" onclick="img_del_Click" 
                Width="100px" />
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text" 
            colspan="3" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="line-height:3em;" 
            colspan="3" align="left">
            
            Existing Post<asp:GridView ID="news_Grid" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" AutoGenerateSelectButton="True" CellPadding="4"
                DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
                Width="100%" OnSelectedIndexChanged="news_Grid_SelectedIndexChanged" 
                OnRowDeleting="news_Grid_RowDeleting" style="left: 1px; top: -4px" 
                DataKeyNames="ID" PageSize="100" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" 
                        SortExpression="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Caption" HeaderText="Caption" 
                        SortExpression="Caption" />
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
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/cDatabase.mdb" 
                
                
                
                
                
                
                SelectCommand="SELECT [event_id] as [ID], [event_caption] as [Caption], [filepath] FROM [tbl_home_events] ORDER BY [event_id] DESC">
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


</asp:Content>

