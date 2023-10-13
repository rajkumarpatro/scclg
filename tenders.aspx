<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="tenders.aspx.cs" Inherits="update_news" Title="Update News" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Notice & Tenders<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager></h1></div>
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
										<li class="active">Notice & Tenders</li>
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
                    <h2 class="ui-title-block">Notice <strong>& Tenders</strong></h2>
                    <h4><asp:Label runat="server" ID="lbl_user" ForeColor="Maroon"></asp:Label></h4>
                 </div>
             </div>
         </div>
      </div>
    </section>
     <section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center"> 
                     <table width="100%" id="gradient-style">
    
    <tr>
        <td align="left">
            Tender ID</td>
        <td align="left">
            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" height="40">
            Start Date: </td>
        <td align="left">
            <asp:TextBox ID="txt_date_from" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="220px"></asp:TextBox>
            
            <asp:FilteredTextBoxExtender ID="txt_date_from_FilteredTextBoxExtender" 
                runat="server" Enabled="True" ValidChars="0123456789/" 
                TargetControlID="txt_date_from">
            </asp:FilteredTextBoxExtender>
            
            <asp:CalendarExtender ID="txt_date_from_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="txt_date_from" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
            
        </td>
    </tr>
    <tr>
        <td align="left" height="40">
            Last Date:</td>
        <td align="left">
            <asp:TextBox ID="txt_date_to" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="220px"></asp:TextBox>
                
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                runat="server" Enabled="True" ValidChars="0123456789/" TargetControlID="txt_date_to">
            </asp:FilteredTextBoxExtender>
            
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txt_date_to" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td align="left">
            Description :</td>
        <td align="left">
            <asp:TextBox ID="txt_Description" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="500px" Height="80px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left">           
            Link :</td>
        <td align="left">
              <asp:RadioButton ID="rbFile" runat="server" Text="File " AutoPostBack="True" Font-Bold="True" Font-Size="9pt" GroupName="link" OnCheckedChanged="rbFile_CheckedChanged" />
              &nbsp; &nbsp; &nbsp; &nbsp; 
              <asp:RadioButton ID="rbURL" runat="server" Text="URL" AutoPostBack="True" Font-Bold="True" OnCheckedChanged="rbLink_CheckedChanged" Font-Size="9pt" GroupName="link" />
              &nbsp; &nbsp; &nbsp; &nbsp; 
              <asp:RadioButton ID="rbNot" runat="server" Text="Not Applicable" 
                  AutoPostBack="True" Font-Bold="True" OnCheckedChanged="rbNot_CheckedChanged" 
                  Font-Size="9pt" GroupName="link" />
        </td>
    </tr>
    <tr>
        <td align="left">
            
            <asp:Label ID="lblFilePath" runat="server" Visible="False">File :</asp:Label>
        </td>
        <td align="left">
            <asp:FileUpload ID="FileUpload1" runat="server"
                Visible="False" />
            &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" 
                oncheckedchanged="chk_new_CheckedChanged" Text="Upload New File" 
                Visible="False" />
&nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left">
            
            <asp:Label ID="lblUrl" runat="server" Font-Bold="True" Visible="False">Url :</asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtURL" runat="server" BorderStyle="Dashed" BorderWidth="1" Width="500px" 
                Visible="False">http://</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left" 
            class="style2">
            
            </td>
        <td style="text-align: left" class="style2">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" />
        &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td align="left" 
            colspan="2" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="line-height:3em;" 
            colspan="2" align="left">
            
            Existing Tenders<asp:GridView ID="news_Grid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                AutoGenerateDeleteButton="True" AutoGenerateSelectButton="True" CellPadding="4"
                DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
                Width="100%" OnSelectedIndexChanged="news_Grid_SelectedIndexChanged" 
                OnRowDeleting="news_Grid_RowDeleting" style="left: 1px; top: -4px" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                        SortExpression="StartDate" />
                    <asp:BoundField DataField="LastDate" HeaderText="LastDate" 
                        SortExpression="LastDate" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="File_path" HeaderText="File_path" 
                        SortExpression="File_path" />
                    <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" />
                    <asp:BoundField DataField="Link_type" HeaderText="Link_type" 
                        SortExpression="Link_type" />
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
                
                SelectCommand="SELECT [news_Id] as [ID], [news_Date_From] as [StartDate], [news_Date_To] as [LastDate], [news_Description] as [Description], [news_filepath] as [File_path], [news_Link] as [Link], [news_LinkType] as [Link_type] FROM [tbl_tenders] ORDER BY [news_Id] DESC">
            </asp:AccessDataSource>
          </td>
    </tr>
    <tr>
        <td align="left" 
            colspan="2" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                </div>
             </div>
  </section>
  
</asp:Content>

