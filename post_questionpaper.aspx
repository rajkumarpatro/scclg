<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="post_questionpaper.aspx.cs" Inherits="post_questionpaper" Title="Post Question Paper" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Question Paper
							<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				<!-- end section-breadcrumb -->
    
     
  <section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center"> 
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                        </ProgressTemplate>
                    </asp:UpdateProgress>

                     <table width="100%" cellpadding="0" cellspacing="0" border="0">
    
    


    
    
    
    <tr>
        <td align="left">File
        </td>
        <td align="left" colspan="2">
            <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" 
                    onuploadcomplete="AjaxFileUpload1_UploadComplete" />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" 
            class="style2">
            
            &nbsp;</td>
        <td style="text-align: left" class="style2" colspan="2">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
                         <tr>
        <td align="left">
            Select :<asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>
        </td>
        <td align="left">

            <asp:DropDownList ID="ddl_admissionclasstype" runat="server" Width="100" OnSelectedIndexChanged="ddl_admissionclasstype_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="UG">UG</asp:ListItem>
                <asp:ListItem Value="PG">PG</asp:ListItem>
            </asp:DropDownList> &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_admissionclass" runat="server" Width="200">
            </asp:DropDownList>
             &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_part" runat="server" Width="100">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
            </asp:DropDownList> &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_year" runat="server" Width="200">
            </asp:DropDownList> &nbsp; &nbsp;<asp:Button ID="btn_search" runat="server" BackColor="Black" BorderStyle="None" Font-Bold="True" Font-Names="Calibri" Font-Size="14px" ForeColor="White" OnClick="btn_search_Click" Text="Get Data" />
&nbsp; 
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td align="left" 
            class="style2">
            
            </td>
        <td style="text-align: left" colspan="2">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" OnClick="btn_Save_Click" />
            &nbsp; &nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp; &nbsp;&nbsp;&nbsp;
            
        </td>
    </tr>
    <tr>
        <td style="line-height:3em;" 
            colspan="3" align="left">
            
            Existing Assignments<asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" 
                 CellPadding="4"  ForeColor="#333333" GridLines="None" 
                Width="100%" style="left: 1px; top: -4px" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="AId" HeaderText="AId" />
                    <asp:BoundField DataField="CourseId" HeaderText="CourseId" />
                    <asp:BoundField DataField="CourseType" HeaderText="CourseType" />
                    <asp:BoundField DataField="Part" HeaderText="Part" />
                    <asp:BoundField DataField="ATitle" HeaderText="ATitle" />
                    <asp:BoundField DataField="APath" HeaderText="File" />
                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_enquiry" runat="server" 
                                ImageUrl="~/images/delete.png" Height="16px" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="imgbtn_enquiry_Click"  />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            &nbsp;
          </td>
    </tr>
    
</table>
                </div>
           </div>
 </section>

    </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

