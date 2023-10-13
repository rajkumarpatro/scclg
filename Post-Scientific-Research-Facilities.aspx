<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Post-Scientific-Research-Facilities.aspx.cs" Inherits="update_news" Title="Post Scientific Research Facilities" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Post Scientific Research Facilities<asp:ToolkitScriptManager ID="ToolkitScriptManager1" 
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
										<li class="active">Post Scientific Research Facilities</li>
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
                    <h2 class="ui-title-block">Post <strong>Scientific Research Facilities</strong></h2>
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
            Instrument Name : </td>
        <td align="left" height="45">
            <asp:TextBox ID="txt_name" runat="server" BorderStyle="Dashed" BorderWidth="1" 
                Width="220px"></asp:TextBox>
            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>
        </td>
        <td rowspan="3" align="right" valign="top">
        
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td align="left" class="site_text">
            Short Description :</td>
        <td align="left">
            <asp:TextBox ID="txt_Description" runat="server" BorderStyle="Dashed" BorderWidth="1" 
                Width="500px" Height="50px" TextMode="MultiLine"></asp:TextBox>
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
            &nbsp;<asp:Label ID="lbl_pic" runat="server" Text="0"></asp:Label>
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
            
            Existing Instruments<asp:GridView ID="news_Grid" runat="server" 
                AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
                Width="100%" OnSelectedIndexChanged="news_Grid_SelectedIndexChanged" 
                OnRowDeleting="news_Grid_RowDeleting" style="left: 1px; top: -4px" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            &nbsp;</td>
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

