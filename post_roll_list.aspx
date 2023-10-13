<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_roll_list.aspx.cs" Inherits="post_roll_list" Title="Roll List" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Roll List
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
										<li class="active">Assignments</li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->
    
     
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
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>


    
    
    
    <tr>
        <td align="left">Title</td>
        <td align="left">
            <asp:TextBox ID="txt_Title" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="500px"></asp:TextBox>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left">
            
            File </td>
        <td align="left">
            
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" oncheckedchanged="chk_new_CheckedChanged" Text="Upload New File" Visible="False" />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" 
            class="style2">
            
            &nbsp;</td>
        <td style="text-align: left" class="style2">
            <asp:ImageButton ID="btn_Save" runat="server" ImageUrl="~/Images/tour_save_button.png" OnClick="btn_Save_Click" />
            &nbsp; &nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="#CC3300"></asp:Label>
            
        </td>
    </tr>
    <tr>
        <td align="left" class="style2">
            
          </td>
        <td align="left" style="line-height:3em;">Existing Roll List<asp:GridView ID="gv_record" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" 
            style="left: 1px; top: -4px" Width="100%" DataKeyNames="AId,CourseId,APath" EnableModelValidation="True">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                
                <asp:TemplateField HeaderText="S No">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="AId" HeaderText="AId" Visible="False" />
                <asp:BoundField DataField="CourseId" HeaderText="CourseId" Visible="False" />
                <asp:BoundField DataField="APath" HeaderText="APath" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="CourseType" HeaderText="CourseType" />
                <asp:BoundField DataField="CourseName" HeaderText="Course"></asp:BoundField>
                <asp:BoundField DataField="Part" HeaderText="Part" />
                <asp:BoundField DataField="ATitle" HeaderText="ATitle" />
                <asp:TemplateField HeaderText="S No">
                    <ItemTemplate>
                        <a href="<%# Eval("APath") %>" target="_blank">Downloads</a>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_edit" runat="server" formnovalidate ImageUrl="~/Images/edit.png" style="height: 16px" OnClick="imgbtn_edit_Click" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton3" runat="server" formnovalidate ImageUrl="~/Images/delete.png" style="height: 16px" OnClick="imgbtn_delete_Click" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
            </Columns>

            <RowStyle BackColor="#F7F6F3" Font-Size="9pt" ForeColor="#333333" HorizontalAlign="Left" VerticalAlign="Top" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="10pt" ForeColor="White" HorizontalAlign="Left" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            &nbsp; </td>
    </tr>
    
</table>
                </div>
           </div>
 </section>

    </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

