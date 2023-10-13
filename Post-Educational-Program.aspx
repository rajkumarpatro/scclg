<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="Post-Educational-Program.aspx.cs" Inherits="update_news" ValidateRequest="false" Title="Latest Post" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page">Syllabus</h1><asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->


   

    
    <section class="section bgw">
        <div class="container">
            <div class="section-title-2 text-center">
                <table width="100%">

                    <tr>
                        <td align="left" width="130" height="43">Select Page</td>
                        <td align="left">
                            <asp:DropDownList ID="ddl_page" runat="server" Width="400px" Height="35px"
                                AutoPostBack="True" OnSelectedIndexChanged="ddl_page_SelectedIndexChanged">
                                <asp:ListItem>Select Page</asp:ListItem>
                                <asp:ListItem>B.Sc.</asp:ListItem>
                                <asp:ListItem>B.A.</asp:ListItem>
                                <asp:ListItem>B.Com.</asp:ListItem>
                                <asp:ListItem>B.Lib.</asp:ListItem>
                                <asp:ListItem>M.Sc.</asp:ListItem>
                                <asp:ListItem>M.A.</asp:ListItem>
                                <asp:ListItem>M.Com.</asp:ListItem>
                                <asp:ListItem>M.Lib.</asp:ListItem>
                                <asp:ListItem>M.S.W.</asp:ListItem>
                                <asp:ListItem>Doctoral</asp:ListItem>
                                <asp:ListItem>Professional</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                            </asp:DropDownList>
                            <cc1:Editor ID="txt_description" runat="server" Height="400px" Visible="false" />
                        </td>
                        <td align="left">
                            Session: 
                            <asp:DropDownList ID="ddl_session" runat="server"  Width="400px" Height="35px">
                                <asp:ListItem>Select Session</asp:ListItem>
                                <asp:ListItem>2019-20</asp:ListItem>
                                <asp:ListItem>2020-21</asp:ListItem>
                                <asp:ListItem>2021-22</asp:ListItem>
                                <asp:ListItem>I,II Sem 2019-20 and III,IV 2020-21</asp:ListItem>
                                <asp:ListItem>I,II Sem 2020-21 and III,IV 2021-22</asp:ListItem>
                                <asp:ListItem>I, II Sem. 2021-22 and III, IV Sem. 2022-23</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td align="left" height="43">Details</td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txt_details" runat="server" BorderStyle="Dashed"
                                Width="400px" Height="35px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
                            &nbsp;<asp:Label ID="lbl_Id" runat="server"
                                Font-Bold="True" Visible="False"></asp:Label>
                        </td>
                        <td align="left">
                            Attachments
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True"
                                OnCheckedChanged="chk_new_CheckedChanged" Text="Upload New File"
                                Visible="False" />
                            &nbsp;<asp:Label ID="lbl_attachment" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        
                        <td style="text-align: left" colspan="3">
            <asp:ImageButton ID="img_add" runat="server" ImageUrl="~/images/tour_save_button.png"
                OnClick="img_add_Click" />
                            &nbsp;&nbsp;
            <asp:ImageButton ID="img_del" runat="server"
                OnClientClick="return confirm('Are you sure you want to delete this record?');"
                ImageUrl="~/Images/delete-button01.png" OnClick="img_del_Click"
                Width="100px" /> &nbsp;&nbsp; 
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg"
                                OnClick="ImageButton1_Click" />
                        </td>
                    </tr>

                    <tr>
                        
                        <td align="left" style="font-family: Calibri; font-size: 12px; line-height: 3em;" colspan="3">
                            <asp:GridView ID="gv_record" runat="server" AutoGenerateSelectButton="True"
                                CellPadding="4" ForeColor="Black"
                                OnSelectedIndexChanged="gv_record_SelectedIndexChanged"
                                Style="left: 1px; top: -4px" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                                <FooterStyle BackColor="#CCCCCC" />
                                <RowStyle BackColor="White" Font-Size="9pt"
                                    HorizontalAlign="Left" VerticalAlign="Top" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="10pt"
                                    ForeColor="White" HorizontalAlign="Left" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                        </td>
                    </tr>

                    <tr>
                        <td align="left"
                            colspan="3" align="center">

                            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False"
                                ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left"
                            colspan="3" align="left">
                            <asp:ImageButton ID="delete" runat="server" OnClick="delete_Click" Visible="False"></asp:ImageButton>
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>

</asp:Content>

