<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_assignment.aspx.cs" Inherits="post_assignment" Title="Post Assignments" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">ASSIGNMENTS & QUESTION PAPERS
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
        <td align="left">
            Select :<asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>
        </td>
        <td align="left">
            <asp:DropDownList ID="ddl_type" runat="server" Width="150" AutoPostBack="True" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged">
                <asp:ListItem Value="Question Paper">Question Paper</asp:ListItem>
                <asp:ListItem Value="Assignments">Assignments</asp:ListItem>
            </asp:DropDownList> &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_admissionclasstype" runat="server" Width="100" OnSelectedIndexChanged="ddl_admissionclasstype_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="UG">UG</asp:ListItem>
                <asp:ListItem Value="PG">PG</asp:ListItem>
            </asp:DropDownList> &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_admissionclass" runat="server" Width="200">
            </asp:DropDownList>
             &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_part" runat="server" Width="100">
            </asp:DropDownList> &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_session" runat="server" Width="100">
                <asp:ListItem Value="2021-22">2021-22</asp:ListItem>
                <asp:ListItem Value="2020-21">2020-21</asp:ListItem>
                <asp:ListItem Value="2019-20">2019-20</asp:ListItem>
            </asp:DropDownList> &nbsp; &nbsp; 
            <asp:DropDownList ID="ddl_show" runat="server" Width="100">
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </asp:DropDownList> &nbsp; &nbsp; 
            
            <asp:TextBox ID="txt_date" runat="server" Width="120" autocomplete="off"></asp:TextBox> &nbsp; &nbsp; 
            
            <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender" 
                runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txt_date">
            </asp:FilteredTextBoxExtender>
            
            <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="txt_date" Format="dd-MM-yyyy">
            </asp:CalendarExtender>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
            
        </td>
    </tr>


    
    
    
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
        <td align="left" 
            class="style2">
            
            </td>
        <td style="text-align: left" colspan="2">
            <asp:Button ID="btn_Save" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btn_Save_Click" />&nbsp; &nbsp;
            <asp:Button ID="btn_search" CssClass="btn btn-danger" runat="server" Text="Search" OnClick="btn_search_Click" />&nbsp; &nbsp;
            <asp:Button ID="btn_reset" CssClass="btn btn-warning" runat="server" Text="Reset" OnClick="btn_reset_Click" />&nbsp; &nbsp;
            
            Select Date <asp:TextBox ID="txt_search" runat="server" Width="120" autocomplete="off"></asp:TextBox> &nbsp; &nbsp; 
            
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txt_search">
            </asp:FilteredTextBoxExtender>
            
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txt_search" Format="dd-MM-yyyy">
            </asp:CalendarExtender>
            <asp:Button ID="btn_search_by_date" runat="server" CssClass="btn btn-danger" Text="Search" OnClick="btn_search_by_date_Click" />
            <asp:Button ID="btn_yesall" runat="server" CssClass="btn btn-info" Text="Set Yes All" OnClick="btn_yesall_Click"/>
            <asp:Button ID="btn_noall" runat="server" CssClass="btn btn-info" Text="Set No All" OnClick="btn_noall_Click" />
            <asp:Button ID="btn_deleteall" runat="server" CssClass="btn btn-danger" Text="Delete All" OnClick="btn_deleteall_Click" />
        </td>
    </tr>
    <tr>
        <td style="line-height:3em;" 
            colspan="3" align="left">
            
            Existing Documents<asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" 
                 CellPadding="3"  ForeColor="Black" GridLines="Vertical" 
                Width="100%" style="left: 1px; top: -4px" BackColor="White" DataKeyNames="AId,APath" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" EnableModelValidation="True" EmptyDataText="No Record Found" >
                <FooterStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="SN">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="AId" HeaderText="AId" Visible="false" />
                    <asp:BoundField DataField="AType" HeaderText="Type" />
                    <asp:BoundField DataField="CourseType" HeaderText="CourseType" />
                    <asp:BoundField DataField="Part" HeaderText="Part" />
                    <asp:BoundField DataField="ATitle" HeaderText="ATitle" />
                    <asp:BoundField DataField="ADate" HeaderText="Date" />
                    <asp:TemplateField HeaderText="Show">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lnk_enabledisable" Text='<%# Eval("AShow") %>' OnClick="lnk_enabledisable_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Download">
                        <ItemTemplate>
                            <a href='<%# Eval("APath") %>'>Download</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_delete" runat="server" 
                                ImageUrl="~/images/delete.png" Height="16px" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="imgbtn_delete_Click"  />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
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

