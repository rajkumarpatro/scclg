<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="AutonoumousNotice.aspx.cs" Inherits="AutonoumousNotice" Title="Autonomous Cell Notifications" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h3>Autonomous Cell Notifications<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                    </h3>
                </div>
                <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->


				
    
     <br />

<section class="section bgw">
    <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="md-input-wrapper">
                        <label>Date<span class="text-danger">*</span></label>
                        <asp:TextBox CssClass="form-control" BorderColor="#0066CC" ID="txtDisplayDate" runat="server" ValidationGroup="g1"></asp:TextBox>

                        <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender"
                            runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txtDisplayDate">
                        </asp:FilteredTextBoxExtender>

                        <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server"
                            Enabled="True" TargetControlID="txtDisplayDate" Format="dd-MM-yyyy">
                        </asp:CalendarExtender>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="md-input-wrapper">
                        <label>Title<span class="text-danger">*</span></label>
                        <asp:TextBox CssClass="form-control" BorderColor="#0066CC" ID="txt_News_Title" runat="server" ValidationGroup="g1"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="md-input-wrapper">
                        <asp:RadioButton ID="rbFile" runat="server" Text="File" GroupName="link" AutoPostBack="True" OnCheckedChanged="rbFile_CheckedChanged" CssClass="radio-inline"/>
                        <asp:RadioButton ID="rbURL" GroupName="link" runat="server" Text="URL" AutoPostBack="True" OnCheckedChanged="rbLink_CheckedChanged" CssClass="radio-inline" />
                        <asp:RadioButton ID="rbNot" GroupName="link" runat="server" Text="Not Applicable" AutoPostBack="True"  OnCheckedChanged="rbNot_CheckedChanged" CssClass="radio-inline" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="md-input-wrapper">
                        <asp:Label ID="lblFilePath" runat="server" Font-Bold="True" Visible="False">File :</asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                        &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" oncheckedchanged="chk_new_CheckedChanged" Text="Upload New File" Visible="False" />
                        &nbsp;<asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>

                        <asp:Label ID="lblUrl" runat="server" Font-Bold="True" Visible="False">Url :</asp:Label>
                        <asp:TextBox ID="txtURL" runat="server" BorderStyle="Dashed" BorderWidth="1" Width="500px" Visible="False"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <asp:Button ID="btn_submit" ValidationGroup="g1" runat="server" Text="Submit" class="btn btn-success" OnClick="btn_submit_Click" /> &nbsp; 
                    <a href="ResultPanel.aspx" class="btn btn-warning">Back</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">&nbsp;
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CellPadding="3" ForeColor="Black" GridLines="Vertical" 
        Width="100%" DataKeyNames="news_Id,news_filepath,news_LinkType" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" EnableModelValidation="True">
        <FooterStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="S.No.">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="news_Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="news_Title" HeaderText="Title" SortExpression="Title" />
            <asp:TemplateField HeaderText="File">
                <ItemTemplate>
                    <a href="<%# Eval("news_filepath") %>">Download</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="news_Link" HeaderText="Link" />
            <asp:BoundField DataField="news_LinkType" HeaderText="Link_type" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtn_edit" runat="server" 
                        ImageUrl="~/Images/edit.png" OnClick="imgbtn_edit_Click" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtn_delete" runat="server" 
                        ImageUrl="~/Images/delete.png"  
                        OnClientClick="return confirm('Do you want to delete this Details? ');" OnClick="imgbtn_delete_Click" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    
                </div>
            </div>

    </div>
</section>


</asp:Content>

