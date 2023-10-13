<%@ Page Title="Post Data" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="post_science_data - Copy.aspx.cs" Inherits="post_science_data" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5">
        <div class="container pt-78 pb-30">
            <!-- Section Content -->
            <div class="section-content">
                <section id="wellcome" class="padding">
                    <div class="container">
                        <div class="row">
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">

                <div class="element-size-100">

                    <div class="col-md-12">


                        <label>
                            <asp:Label ID="lbl_Id" runat="server" Visible="false"></asp:Label>
                        </label>
                        <div class="row">
                            <div class="col-md-2">

                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Page Head&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                <asp:DropDownList ID="ddl_pagehead" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize" AutoPostBack="True" OnSelectedIndexChanged="ddl_pagehead_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="Please Select Page" ControlToValidate="ddl_pagehead" ValidationGroup="g1" InitialValue="0" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-md-2">

                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Sub Menu&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                <asp:DropDownList ID="ddl_submenu" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize" AutoPostBack="True" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please Select Page" ControlToValidate="ddl_submenu" ValidationGroup="g1" InitialValue="0" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>

                            </div>

                            <div class="col-md-2">

                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Select Topic&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                <asp:DropDownList ID="ddl_topic" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize" AutoPostBack="True" OnSelectedIndexChanged="ddl_topic_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Please Select Topic" ControlToValidate="ddl_topic" ValidationGroup="g1" InitialValue="0" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-2">

                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Select Date</span>
                                <asp:TextBox ID="txtDisplayDate" autocomplete="off" runat="server" class="form-control md-static text-capitalize"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender" runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txtDisplayDate">
                                </asp:FilteredTextBoxExtender>
                                <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDisplayDate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                            </div>
                            <div class="col-md-2">
                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Enter Title</span>
                                <asp:TextBox ID="txt_title" runat="server" class="form-control md-static text-capitalize" placeholder="Please Enter Title " ValidationGroup="g1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Please Enter Title" ControlToValidate="txt_title" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-2">
                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Show Title&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                <asp:DropDownList ID="ddl_show" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize">
                                    <asp:ListItem Value="No">No</asp:ListItem>
                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Description Type&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                <asp:DropDownList ID="ddl_subtopic_type" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize">
                                    <asp:ListItem Value="PARAGRAPH" Text="PARAGRAPH"></asp:ListItem>
                                    <asp:ListItem Value="ACCORDION" Text="ACCORDION"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <span class="text-danger" style="font-weight: 600; color: #0026ff;">Order&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                <asp:DropDownList ID="ddl_subtopic_order" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize"></asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div runat="server" id="dv_topic" visible="false" style="background-color:#fefad1; padding:10px;">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lbl_topic_id" runat="server" Visible="false"></asp:Label>
                                    <span class="text-danger" style="font-weight: 600; color: #0026ff;">Enter Topic&nbsp;<span style="color: red; font-weight: 600;">*
                                        <asp:Label ID="lbl_topic_error" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                                                         </span></span>
                                    <asp:TextBox ID="txt_newtopic" runat="server" class="form-control md-static text-capitalize"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ValidationGroup="g2" runat="server" ErrorMessage="Please Enter Topic" ControlToValidate="txt_newtopic"  InitialValue="0" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-2">
                                    <span class="text-danger" style="font-weight: 600; color: #0026ff;">Is Link?&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                    <asp:DropDownList ID="ddl_link" AutoPostBack="true" OnSelectedIndexChanged="ddl_link_SelectedIndexChanged" runat="server" ValidationGroup="g1" class="form-control md-static text-capitalize">
                                        <asp:ListItem Value="No">No</asp:ListItem>
                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <div id="dv_url" runat="server" visible="false">
                                        <span class="text-danger" style="font-weight: 600; color: #0026ff;">Enter Link&nbsp;<span style="color: red; font-weight: 600;">*</span></span>
                                        <asp:TextBox ID="txt_link" runat="server" class="form-control md-static text-capitalize"  placeholder="Please Enter Link"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <span class="text-danger" style="font-weight: 600; color: #0026ff;">Order</span>
                                    <asp:DropDownList ID="ddl_topic_order" runat="server" class="form-control md-static text-capitalize">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <asp:Button ID="btn_add_topic" ValidationGroup="g2" runat="server" Text="Add" class="btn btn-success" OnClick="btn_add_topic_Click" />
                                    &nbsp; 
                                    <asp:Button ID="btn_set_topic_order" runat="server" Text="Set Order" class="btn btn-warning" OnClick="btn_set_topic_order_Click" />
                                    &nbsp; 
                                    <asp:Button ID="btn_ok_topic" runat="server" Text="Ok" class="btn btn-primary" OnClick="btn_ok_topic_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView runat="server" ID="gv_topic" Width="100%" AutoGenerateColumns="False" BackColor="White" 
                                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="TOPIC_ID, TOPIC_ORDER" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.N.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="TOPIC_ID" HeaderText="TOPIC_ID" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="TOPIC_NAME" HeaderText="TOPIC"></asp:BoundField>
                                            <asp:TemplateField HeaderText="IS_LINK">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnk_show" Text='<%# Eval("IS_LINK") %>' OnClick="lnk_islink_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            <asp:BoundField DataField="LINK_URL" HeaderText="LINK"></asp:BoundField>
                                            <asp:TemplateField HeaderText="ORDER" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txt_topic_order" runat="server" Text='<%# Eval("TOPIC_ORDER") %>' Width="50" Height="30"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EDIT" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtn_topicedit" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_topicedit_Click" Style="height: 16px" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="DEL" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtn_topicdelete" runat="server"
                                                        ImageUrl="~/Images/delete.png"
                                                        OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="imgbtn_topicdelete_Click" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" />
                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#F7F7DE" />
                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                </div>



                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-12">

                                <cc1:Editor ID="txt_description" runat="server" class="form-input md-static text-capitalize" Style="width: 100%;" Height="400px" />

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:RadioButton ID="rbFile" runat="server" Text="File" AutoPostBack="True" CssClass="radio-inline" Font-Bold="True" Font-Size="9pt" GroupName="link" OnCheckedChanged="rbFile_CheckedChanged" />
                                <asp:RadioButton ID="rbNot" runat="server" Text="Not Applicable" AutoPostBack="True" CssClass="radio-inline" Font-Bold="True" OnCheckedChanged="rbNot_CheckedChanged" Font-Size="9pt" GroupName="link" Checked="true" />
                            </div>
                            <div class="col-md-3">
                                <span class="text-danger">
                                    <asp:Label ID="lblFilePath" runat="server" Font-Bold="True" Visible="False">File :</asp:Label></span>
                                <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                                &nbsp;
                                                                         <asp:CheckBox ID="chk_new" class="checkbox-inline" runat="server" AutoPostBack="True" OnCheckedChanged="chk_new_CheckedChanged" Text="Upload New File" Visible="False" />
                                &nbsp;
                                                                        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                                <asp:Image ID="img_intro" runat="server" Height="180px" Width="300px" Visible="false" />

                            </div>
                            <div class="col-md-6">
                                <h5>For Uploading Multiple Photos</h5>
                                <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete1" />
                                <asp:GridView runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" ID="gv_photos" AutoGenerateColumns="False" Width="100%" DataKeyNames="PHOTO_ID,PHOTO_PATH">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="Photos" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <img src="<%# Eval("PHOTO_PATH") %>" class="img-responsive" width="100" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="img_deletephoto" runat="server" ToolTip="Delete"
                                                    ImageUrl="~/Images/delete.png"
                                                    OnClientClick="return confirm('Do you want to delete this photo?');" OnClick="img_deletephoto_Click" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                            </div>
                        </div>


                        <div class="row">
                            <asp:Button ID="btn_Save" ValidationGroup="g1" runat="server" Text="Submit" class="btn btn-success" OnClick="btn_Save_Click" />
                                    &nbsp; &nbsp;
                                                                <asp:Button ID="btn_Recet" runat="server" Text="Reset" class="btn btn-danger" OnClick="btn_Recet_Click"></asp:Button>
                                    &nbsp; &nbsp;
                                                               <asp:Button ID="btn_set_subtopicorder" runat="server" Text="Set Order" class="btn btn-warning" OnClick="btn_set_subtopicorder_Click"></asp:Button>
                                    &nbsp; &nbsp;
                            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            
                        </div>
                        <div class="row">
                            &nbsp;
                            
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <br />

                                <div class="row" runat="server" id="dv_filetable" visible="false">
                                    <h6>For Uploading Multiple Files in Table Format</h6>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <asp:FileUpload ID="Multifile" ValidationGroup="file" AllowMultiple="true" runat="server" BorderColor="#FF3300" />
                                                </div>
                                                <div class="col-md-3">

                                                    <asp:Button ID="addmultipalefile" ValidationGroup="file" runat="server" Text="Upload Multipal File" class="btn btn-success" OnClick="btn_addmultipalefile_Click" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="addmultipalefile" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="updatepanel1">
                                        <ProgressTemplate>
                                            <div class="overlay">
                                                <div style="z-index: 1000; margin-left: 350px; margin-top: 200px; opacity: 1; -moz-opacity: 1;">
                                                    <img alt="" src="images/loading.gif" />
                                                </div>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    
                                    <h6>For Uploading Files One By One in Table Format</h6>
                                    <div class="row">
                                        <div class="col-md-2">

                                        <span class="text-danger" style="font-weight: 600; color: #0026ff;">Select Date</span>
                                        <asp:TextBox ID="txt_file_date" autocomplete="off" runat="server" class="form-control md-static text-capitalize"></asp:TextBox>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txt_file_date">
                                        </asp:FilteredTextBoxExtender>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_file_date" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                    </div>
                                        <div class="col-md-3">
                                            <asp:Label ID="lbl_file_id" runat="server" Visible="false"></asp:Label>
                                            <span class="text-danger" style="font-weight: 600; color: #0026ff;">Enter Title</span>
                                            <asp:TextBox ID="txt_filedescription" runat="server" class="form-control md-static text-capitalize" placeholder="Please Enter Description " ValidationGroup="g2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="Please Enter Description" ControlToValidate="txt_filedescription" ValidationGroup="g2" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="text-danger" style="font-weight: 600; color: #0026ff;">
                                                <br />
                                            </span>
                                            <asp:FileUpload ID="File_FileUpload" runat="server" Visible="False" BorderColor="#FF3300" />
                                            &nbsp;
                                                    <asp:CheckBox ID="chk_multipal_file" runat="server" AutoPostBack="True" OnCheckedChanged="chk_multipal_file_Checked_Changed" Text="Upload New File" Visible="False" />
                                            &nbsp;
                                                    <asp:Label ID="lbl_file" runat="server" Text="0"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="text-danger" style="font-weight: 600; color: #0026ff;">Set Order</span>
                                            <asp:DropDownList ID="ddl_file_order" runat="server" class="form-control" ValidationGroup="g3" Width="150px"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <br />
                                            <asp:Button ID="btn_addfile" ValidationGroup="g2" runat="server" Text="Add" class="btn btn-success" OnClick="btn_addfile_Click" />
                                            &nbsp;
                                            <asp:Button ID="btn_setorder" ValidationGroup="g3" runat="server" Text="Set Order" class="btn btn-primary" OnClick="btn_setorder_Click" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        &nbsp;
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:GridView runat="server" Width="100%" ID="gv_filetable" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="SUB_TOPIC_ID,FILE_ID,FILE_PATH,FILE_ORDER,FILE_DATE">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No.">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="FILE_DATE" HeaderText="Date"></asp:BoundField>
                                                    <asp:BoundField DataField="FILE_DESCRIPTION" HeaderText="Title"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="File" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <a href='<%# Eval("FILE_PATH") %>' target="_blank">Click Here</a>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ORDER" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txt_order" runat="server" Text='<%# Eval("FILE_ORDER") %>' Width="50" Height="20"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="img_fileedit" runat="server" ToolTip="Edit" ImageUrl="images/edit.png" OnClick="img_fileedit_Click" Style="height: 16px" />

                                                            <asp:ImageButton ID="img_filedelete" runat="server" ToolTip="Delete"
                                                                ImageUrl="~/Images/delete.png"
                                                                OnClientClick="return confirm('Do you want to delete this file? ');" OnClick="img_filedelete_Click" />

                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCC99" />
                                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                <RowStyle BackColor="#F7F7DE" />
                                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="row">
                                        &nbsp;
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">&nbsp;</div>
                        <div class="row">
                            <div class="col-md-12" style="font-size:12px;">
                                <asp:GridView ID="about_Grid" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="TOPIC_ID,PAGE_ID,SUB_TOPIC_ID" CssClass="table table-hover table-responsive text-capitalize" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TOPIC_ID" HeaderText="TOPIC_ID" Visible="False" />
                                        <asp:BoundField DataField="PAGE_ID" HeaderText="PAGE_ID" Visible="False" />
                                        <asp:BoundField DataField="SUB_TOPIC_NAME" HeaderText="Title" />
                                        <asp:TemplateField HeaderText="SHOW">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lnk_show" Text='<%# Eval("SHOW_TOPIC_NAME") %>' OnClick="lnk_show_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TOPIC_DATE" HeaderText="Date " />
                                        <asp:BoundField DataField="TOPIC_FILEPATH" HeaderText="FilePth" />
                                        <asp:BoundField DataField="TOPIC_LINK_TYPE" HeaderText="Link Type" />
                                        <asp:TemplateField HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lnk_subtopictype" Text='<%# Eval("SUB_TOPIC_TYPE") %>' OnClick="lnk_subtopictype_click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Order" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txt_subtopic_order" runat="server" Text='<%# Eval("SUB_TOPIC_ORDER") %>' Width="50" Height="30"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtn_edit" runat="server" ToolTip="Edit" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" Style="height: 16px" />

                                                <asp:ImageButton ID="imgbtn_delete" runat="server" ToolTip="Delete"
                                                    ImageUrl="~/Images/delete.png"
                                                    OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="imgbtn_delete_Click1" />

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

