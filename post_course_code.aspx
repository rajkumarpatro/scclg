<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="post_course_code.aspx.cs" Inherits="post_course_code" Title="Departmental Course Coude with Credits" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>



            <section>
                <div class="container">
                    <h4>Department Course Code with Credits</h4>
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

                    <div class="row">

                        <div class="element-size-100">

                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <label>Session :</label>
                                        <asp:DropDownList ID="ddl_session" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-2">
                                        <label>Page Head :</label>
                                        <asp:DropDownList ID="ddl_department" runat="server" ValidationGroup="g1" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_department_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please Select Page" ControlToValidate="ddl_department" ValidationGroup="g1" InitialValue="0" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-2">
                                        <br />
                                        <asp:Button ID="btn_generate_record" runat="server" class="btn btn-primary" Visible="false" Text="Generate Record" OnClick="btn_generate_record_Click"></asp:Button>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                            <ProgressTemplate>
                                                <img src="images/loading.gif" style="left: 50%; top: 50%; position: absolute;" alt="Loading..." />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </div>
                                <div class="row">
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="#CC3300"></asp:Label>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-6" style="padding: 5px; background-color: #e5f2ff;">
                                        <h5 class="text-danger"><strong>Discipline Specific Course</strong></h5>
                                        <asp:Button ID="btn_save_dsc" runat="server" ValidationGroup="dsc" class="btn-success" Text="Save DSC Record" OnClick="btn_save_dsc_Click"></asp:Button>
                                        <asp:GridView ID="gv_dsc" runat="server" AutoGenerateColumns="False" ShowFooter="true" CellPadding="3" Width="100%" Style="left: 1px; top: -4px" DataKeyNames="COURSE_ID,COURSE_TYPE,COURSE_CODE,COURSE_NAME,COURSE_CREDIT" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical">
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sn">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Code" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_dsc_code" runat="server" Text='<%# Eval("COURSE_CODE") %>' Width="100%" Height="20" ValidationGroup="dsc"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dsc_code" ID="dsc_code" ValidationGroup="dsc" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_dsc_code_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dsc_code_add" ID="dsc_code_add" ValidationGroup="dsc_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_dsc_couse" runat="server" Text='<%# Eval("COURSE_NAME") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dsc_couse" ID="dsc_course" ValidationGroup="dsc" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_dsc_couse_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dsc_couse_add" ID="dsc_course_add" ValidationGroup="dsc_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_dsc_credit" runat="server" Text='<%# Eval("COURSE_CREDIT") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_dsc_credit" ValidChars="0123456789." ID="dsc_creditfilter" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dsc_credit" ID="dsc_credit" ValidationGroup="dsc" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_dsc_credit_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_dsc_credit_add" ValidChars="0123456789." ID="dsc_creditfilter_add" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dsc_couse_add" ID="dsc_credit_add" ValidationGroup="dsc_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Del" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btn_delete_dsc" runat="server"
                                                            ImageUrl="~/Images/delete.png"
                                                            OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="btn_delete_dsc_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:ImageButton ID="btn_add_dsc" runat="server" ToolTip="Add" ValidationGroup="dsc_add"
                                                            ImageUrl="~/Images/plus.png" Height="16" OnClick="btn_add_dsc_Click" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                                        </asp:GridView>
                                    </div>
                                    <div class="col-md-6" style="padding: 5px; background-color: #ffe5e5;">
                                        <h5 class="text-danger"><strong>Discipline Specific Electives</strong></h5>
                                        <asp:Button ID="btn_save_dse" runat="server" ValidationGroup="dse" class="btn-success" Text="Save DSE Record" OnClick="btn_save_dse_Click"></asp:Button>
                                        <asp:GridView ID="gv_dse" runat="server" AutoGenerateColumns="False" ShowFooter="true" CellPadding="3" Width="100%" Style="left: 1px; top: -4px" DataKeyNames="COURSE_ID,COURSE_TYPE,COURSE_CODE,COURSE_NAME,COURSE_CREDIT" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical">
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sn">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Code" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_dse_code" runat="server" Text='<%# Eval("COURSE_CODE") %>' Width="100%" Height="20" ValidationGroup="dse"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dse_code" ID="dse_code" ValidationGroup="dse" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_dse_code_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dse_code_add" ID="dse_code_add" ValidationGroup="dse_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_dse_couse" runat="server" Text='<%# Eval("COURSE_NAME") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dse_couse" ID="dse_course" ValidationGroup="dse" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_dse_couse_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dse_couse_add" ID="dse_course_add" ValidationGroup="dse_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_dse_credit" runat="server" Text='<%# Eval("COURSE_CREDIT") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_dse_credit" ValidChars="0123456789." ID="dse_creditfilter" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dse_credit" ID="dse_credit" ValidationGroup="dse" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_dse_credit_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_dse_credit_add" ValidChars="0123456789." ID="dse_creditfilter_add" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_dse_couse_add" ID="dse_credit_add" ValidationGroup="dse_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Del" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btn_delete_dse" runat="server"
                                                            ImageUrl="~/Images/delete.png"
                                                            OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="btn_delete_dse_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:ImageButton ID="btn_add_dse" runat="server" ToolTip="Add" ValidationGroup="dse_add"
                                                            ImageUrl="~/Images/plus.png" Height="16" OnClick="btn_add_dse_Click" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                                        </asp:GridView>
                                    </div>
                                    <div class="col-md-6" style="padding: 5px; background-color: #d5faca;">
                                        <h5 class="text-danger"><strong>Generic Elective Course</strong></h5>
                                        <asp:Button ID="btn_save_gec" runat="server" ValidationGroup="gec" class="btn-success" Text="Save GEC Record" OnClick="btn_save_gec_Click"></asp:Button>
                                        <asp:GridView ID="gv_gec" runat="server" AutoGenerateColumns="False" ShowFooter="true" CellPadding="3" Width="100%" Style="left: 1px; top: -4px" DataKeyNames="COURSE_ID,COURSE_TYPE,COURSE_CODE,COURSE_NAME,COURSE_CREDIT" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical">
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sn">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Code" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_gec_code" runat="server" Text='<%# Eval("COURSE_CODE") %>' Width="100%" Height="20" ValidationGroup="gec"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_gec_code" ID="gec_code" ValidationGroup="gec" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_gec_code_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_gec_code_add" ID="gec_code_add" ValidationGroup="gec_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_gec_couse" runat="server" Text='<%# Eval("COURSE_NAME") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_gec_couse" ID="gec_course" ValidationGroup="gec" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_gec_couse_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_gec_couse_add" ID="gec_course_add" ValidationGroup="gec_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_gec_credit" runat="server" Text='<%# Eval("COURSE_CREDIT") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_gec_credit" ValidChars="0123456789." ID="gec_creditfilter" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_gec_credit" ID="gec_credit" ValidationGroup="gec" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_gec_credit_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_gec_credit_add" ValidChars="0123456789." ID="gec_creditfilter_add" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_gec_couse_add" ID="gec_credit_add" ValidationGroup="gec_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Del" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btn_delete_gec" runat="server"
                                                            ImageUrl="~/Images/delete.png"
                                                            OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="btn_delete_gec_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:ImageButton ID="btn_add_gec" runat="server" ToolTip="Add" ValidationGroup="gec_add"
                                                            ImageUrl="~/Images/plus.png" Height="16" OnClick="btn_add_gec_Click" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                                        </asp:GridView>
                                    </div>
                                    <div class="col-md-6" style="padding: 5px; background-color: #fcf6d0;">
                                        <h5 class="text-danger"><strong>Skill Enhancement Course</strong></h5>
                                        <asp:Button ID="btn_save_sec" runat="server" ValidationGroup="sec" class="btn-success" Text="Save SEC Record" OnClick="btn_save_sec_Click"></asp:Button>
                                        <asp:GridView ID="gv_sec" runat="server" AutoGenerateColumns="False" ShowFooter="true" CellPadding="3" Width="100%" Style="left: 1px; top: -4px" DataKeyNames="COURSE_ID,COURSE_TYPE,COURSE_CODE,COURSE_NAME,COURSE_CREDIT" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical">
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sn">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Code" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_sec_code" runat="server" Text='<%# Eval("COURSE_CODE") %>' Width="100%" Height="20" ValidationGroup="sec"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_sec_code" ID="sec_code" ValidationGroup="sec" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_sec_code_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_sec_code_add" ID="sec_code_add" ValidationGroup="sec_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Course" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_sec_couse" runat="server" Text='<%# Eval("COURSE_NAME") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_sec_couse" ID="sec_course" ValidationGroup="sec" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_sec_couse_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_sec_couse_add" ID="sec_course_add" ValidationGroup="sec_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_sec_credit" runat="server" Text='<%# Eval("COURSE_CREDIT") %>' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_sec_credit" ValidChars="0123456789." ID="sec_creditfilter" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_sec_credit" ID="sec_credit" ValidationGroup="sec" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt_sec_credit_add" runat="server" Text='' Width="100%" Height="20"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender TargetControlID="txt_sec_credit_add" ValidChars="0123456789." ID="sec_creditfilter_add" runat="server"></asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="txt_sec_couse_add" ID="sec_credit_add" ValidationGroup="sec_add" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Del" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btn_delete_sec" runat="server"
                                                            ImageUrl="~/Images/delete.png"
                                                            OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="btn_delete_sec_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:ImageButton ID="btn_add_sec" runat="server" ToolTip="Add" ValidationGroup="sec_add"
                                                            ImageUrl="~/Images/plus.png" Height="16" OnClick="btn_add_sec_Click" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
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

