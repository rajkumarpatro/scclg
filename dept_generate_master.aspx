<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="dept_generate_master.aspx.cs" Inherits="dept_generate_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Department User & Password</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxtoolkit:ToolkitScriptManager>  
      <section class="about rtd">
		<div class="container">
			<div class="row">
                <div class="col-md-12">
                    <a class="btn btn-primary" href="CPanel.aspx">Back</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                                                <asp:GridView ID="dept_grid" runat="server" AutoGenerateColumns="False" CellPadding="3" 
                                                    Width="100%" 
                                                     style="left: 1px; top: -4px" DataKeyNames="PAGE_ID,MOBILE_NO,DEPARTMENT_PASSWORD" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" >
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="PAGE_ID" HeaderText="ID" visible="false" />
                                                        <asp:BoundField DataField="PAGE_NAME" HeaderText="Department"  />
                                                        <asp:TemplateField HeaderText="Mobile">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_mobile" runat="server" Text='<%# Eval("MOBILE_NO") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Password">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_password" runat="server" Text='<%# Eval("DEPARTMENT_PASSWORD") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" style="height: 16px" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                        
                                                    </Columns>
                                                    <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                                                </asp:GridView>
                                            </div>
            </div>
        </div>
    </section>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

