<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="post_faculties.aspx.cs" Inherits="update_news" Title="Post Faculties Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- end section-breadcrumb -->
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <section class="section bgw">
        <div class="container">
            <div class="section-title-2 text-left">
                <h6>Faculties & Staffs</h6>
                <div class="row">
                    <div class="col-md-3">
                        <label class="text-danger">Staff Name :</label>
                        <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>

                        <asp:TextBox ID="txt_name" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="text-danger">Qualification :</label>
                        <asp:TextBox ID="txt_qualification" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="text-danger">Designation :</label>
                        <%--<asp:DropDownList ID="ddl_page" runat="server" AutoPostBack="True" EnableViewState="true" AutoGenerateColumns="False" class="form-control" BorderColor="#0000CC" ForeColor="#663300">    --%>
                        <asp:TextBox ID="txt_designation" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>

                    </div>
                    <div class="col-md-3">
                        <label class="text-danger">Mobile No. :</label>
                        <asp:TextBox ID="txt_mobileno" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label class="text-danger">Staff Type :</label>
                        <asp:DropDownList ID="ddl_type" runat="server" EnableViewState="true" AutoGenerateColumns="False" class="form-control" BorderColor="#0000CC" ForeColor="#663300">
                            <asp:ListItem>Teaching Staff</asp:ListItem>
                            <asp:ListItem>Non Teaching Staff</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label class="text-danger">Department :</label>
                        <asp:DropDownList ID="ddl_department" runat="server" AutoPostBack="True" EnableViewState="true" AutoGenerateColumns="False" class="form-control" BorderColor="#0000CC" ForeColor="#663300">
                        </asp:DropDownList>
                    </div>
                   <div class="col-md-2">
                        <label class="text-danger">Password  :</label>
                        <asp:TextBox ID="txt_password" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>

                    </div>
                    <div class="col-md-2">
                        <label class="text-danger">Faculty Status :</label>
                        <asp:DropDownList ID="ddl_user_status" runat="server" EnableViewState="true" AutoGenerateColumns="False" class="form-control" BorderColor="#0000CC" ForeColor="#663300">
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>Retired</asp:ListItem>
                            <asp:ListItem>Ex</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <label class="text-danger">Faculty Photo :</label>
                        <asp:Label ID="lblFilePath" runat="server"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True"
                            OnCheckedChanged="chk_new_CheckedChanged" Text="Upload New File"
                            Visible="False" />
                        &nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="row">
                            <div class="col-md-12">
                                <label class="text-danger">Faculty Profile :</label><br />
                                <cc1:Editor ID="txt_description" runat="server" class="form-input md-static text-capitalize" Style="width: 100%;" Height="400px" />
                            </div>

                        </div>
                <hr />
                
                <div class="row">
                    <div class="col-md-3">
                        <label class="text-danger">Achievement :<asp:Label ID="lbl_aid" runat="server" Visible="False"></asp:Label></label>
                        <asp:TextBox ID="txtAchievement" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>

                    </div>
                    <div class="col-md-2">
                        <label class="text-danger">Attachment :</label>
                        <asp:FileUpload ID="fileAttachment" runat="server" />
                        <asp:Label ID="imglbl" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:ImageButton ID="imgAchievementSave" runat="server" Width="100"
                            ImageUrl="~/images/img_add.jpg" OnClick="imgAchievementSave_Click" />
                    </div>
                </div>
                <div class="row">
                    
                </div>
                <div class="row">
                    <div class="col-md-12">
                        Existing Faculties Achievements<br />

                        <asp:GridView ID="gv_biodata" CssClass="table table-hover" Width="100%" runat="server" DataKeyNames="AchievementID,attachment" AutoGenerateColumns="False">
                            <Columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="achievements" HeaderText="Profile Caption" />
                                            <asp:TemplateField HeaderText="View File" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <a href="<%# Eval("attachment") %>" target="_blank">View File</a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtn_delete" ToolTip="Delete" runat="server" ImageUrl="~/Images/delete.png" OnClientClick="return confirm('Do you want to delete this Details? ');" OnClick="imgbtn_biodata_delete_Click" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                        </asp:GridView>
                            

                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-xs-12">
                        <asp:Button runat="server" ID="btn_Save" OnClick="btn_Save_Click" class="post-btn btn btn-primary btn-effect" Text="Submit"></asp:Button> &nbsp;
                        <asp:Button runat="server" ID="btn_setorder" OnClick="btn_setorder_Click" class="post-btn btn btn-info btn-effect" Text="Set Order"></asp:Button> &nbsp;
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddl_department_search" runat="server"
                            class="form-control" BorderColor="#0000CC" ForeColor="#663300" AutoPostBack="True"
                            OnSelectedIndexChanged="ddl_department_search_SelectedIndexChanged1">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False"
                        ForeColor="#CC3300"></asp:Label>
                </div>
                <div class="row">
                    &nbsp;
                </div>
                <div class="row">
                    <div class="col-md-12">
                        Existing Faculties
                                    <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        ForeColor="Black" GridLines="Vertical"
                                        Width="100%" DataKeyNames="faculty_id,filepath" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True">
                                        <FooterStyle BackColor="#CCCC99" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="faculty_id" HeaderText="faculty_id" Visible="false" />
                                            <asp:BoundField DataField="faculty_name" HeaderText="Name" />
                                            <asp:BoundField DataField="faculty_qualification" HeaderText="Qualification" />
                                            <asp:BoundField DataField="faculty_designation" HeaderText="Designation" />
                                            <asp:BoundField DataField="faculty_mobile" HeaderText="Mobile" />
                                            <asp:BoundField DataField="faculty_type" HeaderText="Type" />
                                            <asp:BoundField DataField="faculty_department" HeaderText="Department" />
                                            <asp:BoundField DataField="faculty_password" HeaderText="PWD" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" />
                                            <asp:TemplateField HeaderText="Photo" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>

                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("filepath") %>' Height="90px" Width="80px" />
                                                </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Order" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txt_order" runat="server" Text='<%# Eval("faculty_order") %>' Width="50px"></asp:TextBox>
                                                </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtn_edit" ToolTip="Edit" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" Style="height: 16px" />
                                                    &nbsp;
                                                    <asp:ImageButton ID="imgbtn_delete" ToolTip="Delete" runat="server" ImageUrl="~/Images/delete.png" OnClientClick="return confirm('Do you want to delete this Details? ');" OnClick="imgbtn_delete_Click" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle BackColor="#F7F7DE" Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                    </div>
                </div>

            </div>
        </div>
    </section>



</asp:Content>

