<%@ Page Title="" Language="C#" MasterPageFile="~/Department_Admin.master" AutoEventWireup="true" CodeFile="Dept_User_master.aspx.cs" Inherits="Dept_User_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Department User Master</h1></div>
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
										<li class="active">Department User Master<asp:Label runat="server" ID="lbl_user" ForeColor="Maroon" Visible="False"></asp:Label></li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->

    
      <section class="about rtd">
		<div class="container">
			<div class="row">
                  <div class="col-xs-4">&nbsp;</div>
			    <div class="col-xs-4">
            <h4>Department <strong>User Password Update</strong></h4><br />
            <hr/>                 
                <div class="row">
                <div class="form-group col-md-12">
                  <label for="form_username_email">Mobile No</label><asp:Label runat="server" ID="lbl_Id" ForeColor="Maroon" Visible="false"></asp:Label>
                    <asp:Label runat="server" ID="lbl_det_id" ForeColor="Maroon" Visible="false"></asp:Label>
                  <asp:TextBox ID="txt_mobile" runat="server" class="form-control" placeholder="Enter Mobile Number" ></asp:TextBox>
                </div>
                </div>
                <div class="row">
                <div class="form-group col-md-12">
                  <label for="form_password">Password</label>
                <asp:TextBox ID="txt_Password" runat="server" class="form-control" placeholder="Enter Password" ></asp:TextBox>
                           
                </div>
                <div class="row">
              <div class="form-group col-md-12">
                 <asp:Button runat="server" Text="Submit"  class="post-btn btn btn-primary btn-effect" ID="btn_login" OnClick="btn_login_Click"></asp:Button>
                 <asp:Button runat="server" Text="Main Menu"  class="post-btn btn btn-primary btn-effect" ID="Button1" OnClick="btn_main_Click"></asp:Button>
                  <asp:Label runat="server" ID="lblInfo" ForeColor="Maroon"></asp:Label>
              </div>
                </div>
                </div>
                <div class="col-xs-4">&nbsp;</div>

                


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
                                                        <asp:BoundField DataField="MOBILE_NO" HeaderText="Mobile No"/>
                                                        <asp:BoundField DataField="DEPARTMENT_PASSWORD" HeaderText="Password"/>
                                                        <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" style="height: 16px" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton3" runat="server" 
                                                                ImageUrl="~/Images/delete.png"  
                                                                OnClientClick="return confirm('Do you want to delete Menu? ');" OnClick="imgbtn_delete_Click" />
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
</asp:Content>

