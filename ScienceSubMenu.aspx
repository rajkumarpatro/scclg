<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ScienceSubMenu.aspx.cs" Inherits="ScienceSubMenu" Title="Sub Menu" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <!-- Section: inner-header -->
            <section class="inner-header divider parallax layer-overlay overlay-dark-5">
                <div class="container pt-78 pb-30">
                    <!-- Section Content -->
                    <div class="section-content">

                        <section id="wellcome" class="padding">
                            <div class="container">
                                <div class="row" align="left">
                                    
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
            </section>

            <section>
                <div class="container">
                    <h4>Sub Menu</h4>
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                        <ProgressTemplate>
                                            <img src="images/loading.gif" style="left: 50%; top: 50%; position: absolute;" alt="Loading..." />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                    <div class="row">
                        
                        <div class="element-size-100">

                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>

                                        <label>Page Head :</label>
                                        <asp:DropDownList ID="ddl_category" runat="server" ValidationGroup="g1" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please Select Page" ControlToValidate="ddl_category" ValidationGroup="g1" InitialValue="0" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-4">
                                        <label>Sub Menu :</label>
                                        <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>
                                        <asp:FilteredTextBoxExtender TargetControlID="txt_name" ValidChars="-!@#$%^&*(1234567890 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" ID="FilteredTextBoxExtender1" runat="server"></asp:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-2">

                                        <label>Description/Link *</label>
                                        <asp:DropDownList ID="ddl_link_description" runat="server" ValidationGroup="g1" class="form-control md-static " AutoPostBack="True" OnSelectedIndexChanged="ddl_link_description_SelectedIndexChanged">
                                            <asp:ListItem Value="Description">Description</asp:ListItem>
                                            <asp:ListItem Value="Link">Link</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <div id="dv_url" runat="server">
                                            <label>URL</label>
                                            <asp:TextBox ID="txtURL" runat="server" class="form-control md-static " placeholder="Please Link"></asp:TextBox>
                                        </div>

                                    </div>


                                </div>
                                <div class="row">
                                    
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <label>Show :</label>
                                        <asp:DropDownList ID="ddl_show" runat="server" class="form-control">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <label>More Sub Menu? :</label>
                                        <asp:DropDownList ID="ddl_submenu" runat="server" class="form-control">

                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>Yes</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <label>Is Department? :</label>
                                        <asp:DropDownList ID="ddl_isdepartment" runat="server" class="form-control">

                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>Yes</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <label>Password :</label>
                                        <asp:TextBox ID="txt_password" runat="server" class="form-control"></asp:TextBox>
                                        <asp:FilteredTextBoxExtender TargetControlID="txt_password" ValidChars="-!@#$%^&*(1234567890 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" ID="FilteredTextBoxExtender2" runat="server"></asp:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col-md-2"><br />
                                        <asp:Button ID="btn_Save" runat="server" class="btn btn-success" OnClick="btn_Save_Click" Text="Submit"></asp:Button>
                                    </div>
                                    <div class="col-md-2"><br />
                                        <asp:Button ID="btn_setorder" runat="server" class="btn btn-info" Text="Set Order" OnClick="btn_setorder_Click"></asp:Button>&nbsp;
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="#CC3300"></asp:Label>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6>Sub Menu </h6>
                                        <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CellPadding="3" Width="100%" Style="left: 1px; top: -4px" DataKeyNames="PAGE_ID,PAGE_HEAD_ID" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical">
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="PAGE_ID" HeaderText="ID" Visible="false" />
                                                <asp:BoundField DataField="PAGE_HEAD_ID" HeaderText="ID" Visible="false" />
                                                <asp:BoundField DataField="PAGE_HEAD_NAME" HeaderText="PAGE HEAD" />
                                                <asp:BoundField DataField="PAGE_NAME" HeaderText="MENU" />
                                                <asp:TemplateField HeaderText="SHOW">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnk_show" Text='<%# Eval("SHOW") %>' OnClick="lnk_show_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SUB_MENU">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnk_submenu" Text='<%# Eval("SUB_MENU") %>' OnClick="lnk_submenu_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="DEPARTMENT">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnk_department" Text='<%# Eval("IS_DEPARTMENT") %>' OnClick="lnk_department_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ORDER" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_order" runat="server" Text='<%# Eval("REORDER") %>' Width="50" Height="20"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="IS_LINK" HeaderText="IS_LINK" />
                                                <asp:BoundField DataField="LINK_URL" HeaderText="URL" />
                                                <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" />
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" Style="height: 16px" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton3" runat="server"
                                                            ImageUrl="~/Images/delete.png"
                                                            OnClientClick="return confirm('Do you want to delete Sub Menu? ');" OnClick="imgbtn_delete_Click" />
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
                        </div>

                    </div>
                </div>
            </section>

        </ContentTemplate>
    </asp:UpdatePanel>




</asp:Content>

