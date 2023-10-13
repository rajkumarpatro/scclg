<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="science_Post_Latest_Update.aspx.cs" Inherits="science_Post_Latest_Update" Title="Important Notice" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
   
	<!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5">
      <div class="container pt-78 pb-30">
        <!-- Section Content -->
        <div class="section-content">

             <section id="wellcome" class="padding">
	          <div class="container">
		        <div class="row" align="left">
			         <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
            </div>
        </div>
        </section>

        </div>
      </div>
    </section>

    <section>
      <div class="container">
        <div class="row">
            <h4>Important Notice and Latest News</h4>
                            
                            <div class="element-size-100">
                                
                                    <div class="col-md-12">  
                                        <div class="row">
                                            <div class="col-md-3">
                                                 <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" visible="false"></asp:Label>
                            
                                                <label>Date :</label>
                                                <asp:TextBox ID="txtDisplayDate" runat="server" class="form-control md-static text-capitalize"></asp:TextBox>
            
                                                        <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender" 
                                                            runat="server" Enabled="True" ValidChars="0123456789-/" TargetControlID="txtDisplayDate">
                                                        </asp:FilteredTextBoxExtender>
            
                                                        <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server" 
                                                            Enabled="True" TargetControlID="txtDisplayDate" Format="dd-MM-yyyy">
                                                        </asp:CalendarExtender>

                                            </div>
                                            <div class="col-md-6">
                                                <label>Title :</label>
                                                <asp:TextBox ID="txt_News_Title" runat="server" class="form-control md-static text-capitalize"></asp:TextBox>
                                                

                                            </div>
                                            <div class="col-md-3">
                                                <label>Select :</label>
                                                <asp:DropDownList ID="ddl_show" runat="server" class="form-control md-static text-capitalize" AutoPostBack="True" OnSelectedIndexChanged="ddl_show_SelectedIndexChanged">
                                                    <asp:ListItem>LATEST NEWS AND UPDATES</asp:ListItem>
                                                    
                                                </asp:DropDownList>
                                            </div>
                                            
                                            
                                            
                                        </div>
                                    
                                     </div>
                                <div class="row">

                                    <div class="col-md-4">
                                        <asp:RadioButton ID="rbFile" CssClass="radio-inline" runat="server" Text="File " AutoPostBack="True" Font-Bold="True" Font-Size="9pt" GroupName="link" OnCheckedChanged="rbFile_CheckedChanged" BorderColor="Red" />
                                        <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" BorderColor="#FF3300" />&nbsp;
                                            <asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" OnCheckedChanged="chk_new_CheckedChanged" Text="Upload New File" Visible="False" />&nbsp;
                                            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                                        <asp:Label ID="lbl_path" runat="server" Text="0" Visible="False"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RadioButton ID="rbURL" CssClass="radio-inline" runat="server" Text="URL" AutoPostBack="True" Font-Bold="True" OnCheckedChanged="rbLink_CheckedChanged" Font-Size="9pt" GroupName="link" BorderColor="#FF3300" />
                                        <asp:Label ID="lblUrl" runat="server" class="form-control md-static" Font-Bold="True" Visible="False">Url :</asp:Label>
                                        <asp:TextBox ID="txtURL" runat="server" class="form-control md-static text-capitalize" Visible="False"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RadioButton ID="rbNot" CssClass="radio-inline" runat="server" Text="Not Applicable" AutoPostBack="True" Font-Bold="True" OnCheckedChanged="rbNot_CheckedChanged" Font-Size="9pt" GroupName="link" BorderColor="#FF3300" />
                                    </div>
                                </div>
                                <div class="row">
                                             &nbsp;   
                                </div>
                                
                                <div class="row" id="department" runat="server">
                                    <div class="col-md-4">
                                        <label></label>
                                        <asp:GridView runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" ID="gv_department" AutoGenerateColumns="False" Width="300px" DataKeyNames="PAGE_ID">
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk_department" class="checkbox-inline" runat="server" Text="" Style="padding-bottom: 20px;"></asp:CheckBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="PAGE_NAME" HeaderText="Department"></asp:BoundField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        </asp:GridView>
                                    </div>
                                    <div class="col-md-3">
                                        <br />
                                        <asp:Button runat="server" Text="Submit"  class="btn btn-success" ID="btn_save" OnClick="btn_Save_Click"></asp:Button>&nbsp;&nbsp;
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="#CC3300"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">  
                                            <div class="row">
                                                &nbsp;
                                            </div>
                                </div>
                                <div class="row">  
                                            <div class="col-md-12">     
                                                <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                                                    Width="100%" Style="left: 1px; top: -4px" DataKeyNames="NEWS_ID,NEWS_FILEPATH,NEWS_SECTION" EnableModelValidation="True">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="NEWS_ID" HeaderText="ID" Visible="false" />
                                                        <asp:BoundField DataField="NEWS_FILEPATH" HeaderText="NEWS_FILEPATH" Visible="false" />
                                                        <asp:BoundField DataField="NEWS_DATE" HeaderText="Date" />
                                                        <asp:BoundField DataField="NEWS_TITLE" HeaderText="Title" />
                                                        <asp:BoundField DataField="NEWS_LINK" HeaderText="Link" />
                                                        <asp:TemplateField HeaderText="File" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <a href="<%# Eval("NEWS_FILEPATH") %>">Download</a>
                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="NEWS_LINKTYPE" HeaderText="Type" />
                                                        <asp:BoundField DataField="NEWS_SECTION" HeaderText="Section" />
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
                                                                    OnClientClick="return confirm('Do you want to delete Latest News Details? ');" OnClick="imgbtn_delete_Click" />
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
                            </div>
                        </div>
                    </section>
                               
                               


    

</asp:Content>

