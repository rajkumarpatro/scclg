<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="science_post_flash.aspx.cs" Inherits="science_post_flash" Title="Flash Photos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section>
        <div class="container">
            <h4>Home Page- Flash Photos</h4>
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" ForeColor="#333333" Visible="false"></asp:Label>
                    <span class="text-danger" style="font-weight: 600; color: #0026ff;">Title&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                    <asp:TextBox ID="txt_name" runat="server" class="form-control md-static"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <span class="text-danger" style="font-weight: 600; color: #0026ff;">Upload Image&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                    <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="None" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" OnCheckedChanged="chk_new_CheckedChanged" Text="Upload New File" Visible="False" />&nbsp;
            <asp:Image ID="img_logo" runat="server" Class="img-responsive" Style="height: 120px; width: 200px;" />
                    &nbsp;&nbsp; 
            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                </div>
                <div class="col-md-2">
                    <span class="text-danger" style="font-weight: 600; color: #0026ff;">Order No :&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                    <asp:DropDownList ID="ddl_order" runat="server" class="form-control md-static"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <br />
                    <asp:Button runat="server" Text="Submit" class="btn btn-success" ID="btn_login" OnClick="btn_submit_Click"></asp:Button>&nbsp;&nbsp;
                 <asp:Button ID="btn_setorder" runat="server" class="btn btn-primary" Text="Set Order" OnClick="btn_setorder_Click"></asp:Button>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False"
                    ForeColor="#CC3300"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-12">
                    Existing Post
                <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    Width="100%" Style="left: 1px; top: -4px" DataKeyNames="event_id,filepath,Order" EnableModelValidation="True">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="event_id" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="filepath" HeaderText="Title" Visible="false" />
                        <asp:BoundField DataField="event_caption" HeaderText="Title" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("filepath") %>' Style="max-height: 70px;" Class="img-fluid" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SHOW">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnk_show" Text='<%# Eval("SHOW_FLASH") %>' OnClick="lnk_show_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ORDER" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:TextBox ID="txt_order" runat="server" Text='<%# Eval("Order") %>' Width="50" Height="20"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtn_edit" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" Style="height: 16px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtn_delete" runat="server"
                                    ImageUrl="~/Images/delete.png"
                                    OnClientClick="return confirm('Do you want to delete Flash Details? ');" OnClick="imgbtn_delete_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                    <HeaderStyle Font-Size="10pt" HorizontalAlign="Left" />
                </asp:GridView>
                </div>
            </div>


        </div>
    </section>

</asp:Content>

