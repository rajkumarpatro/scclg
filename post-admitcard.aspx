<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post-admitcard.aspx.cs" Inherits="postadmitcard" ValidateRequest="false" Title="Upload Result" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>--%>
     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Upload Admit Card</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


  
     
  <section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">  
                     <table width="100%">
    
    <tr>
        <td height="43" align="left" colspan="2"><asp:Label ID="lbl_user" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Maroon"></asp:Label></td>
    </tr>
    
    <tr>
        <td height="43" align="left" width="10%" valign="top" style="color:Red; font-size:12px;">
            Note:</td>
        <td align="left" style="line-height:2em; color:Red; font-size:12px;" valign="top">
        1. Special Characters are not Allowed in Title<br />
        2. PDF Files Should be Saved as Students Roll Number
        </td>
    </tr>
    
    <tr>

       
        <td height="43" align="left" width="10%">
            Select Title</td>
        <td align="left" style="line-height:2em;">     
         <asp:DropDownList ID="ddl_topic" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="350px" BorderColor="Black" AutoPostBack="True" 
                onselectedindexchanged="ddl_topic_SelectedIndexChanged" >
            </asp:DropDownList>

            &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" Text="New Title" 
                oncheckedchanged="chk_new_CheckedChanged" />
                <div id="span_topic" runat="server">
                    <table width="100%">
                        <tr>
                            <td><asp:TextBox ID="txt_title" runat="server" 
                Width="350px" BorderStyle="Dashed" BorderWidth="1"></asp:TextBox>
                <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                        ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZ0987654321abcdefghijklmnopqrstuvwxyz-.() " 
                        TargetControlID="txt_title"></ajaxtoolkit:FilteredTextBoxExtender> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddl_topic" Display="Dynamic" 
                        ErrorMessage="Please Enter Title" ValidationGroup="g1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>Show 
                                <asp:DropDownList ID="ddl_show" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="100px" BorderColor="Black" Height="25px">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Whould you like to upload Roll List
            <asp:DropDownList ID="ddl_rolllist" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="100px" BorderColor="Black" Height="25px" AutoPostBack="True" OnSelectedIndexChanged="ddl_rolllist_SelectedIndexChanged">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:FileUpload runat="server" id="file_rolllist"></asp:FileUpload>&nbsp;<asp:CheckBox ID="chk_newlist" runat="server" AutoPostBack="True" 
                oncheckedchanged="chk_newlist_CheckedChanged" Text="Upload New File" 
                Visible="False" />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btn_savetitle" runat="server" BackColor="#339966" BorderWidth="0px" ForeColor="White" OnClick="btn_savetitle_Click" Text="Save" Width="75px" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_oktitle" runat="server" BackColor="#339966" BorderWidth="0px" ForeColor="White" Text="OK" Width="75px" OnClick="btn_oktitle_Click" />
                    &nbsp;<asp:Label ID="lbl_title_id" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="gv_topic" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="3" Font-Names="Calibri" Font-Size="14px" ForeColor="Black" 
                GridLines="Vertical" Width="100%" DataKeyNames="AcardClassID">
                <Columns>
                    <asp:BoundField DataField="AcardClassID" HeaderText="ID"/>
                    <asp:BoundField DataField="AcardClassName" HeaderText="Title" />
                    <asp:TemplateField HeaderText="Show">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lnk_show" Text='<%# Eval("AcardClassStatus") %>' OnClick="lnk_show_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="AcardRollList" HeaderText="RollList" />
                    <asp:BoundField DataField="AcardRollListPath" HeaderText="FilePath" />
                                    
                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_edit" runat="server" ImageUrl="~/images/edit.png" 
                                OnClick="imgbtn_edit_Click" Height="16px" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_enquiry" runat="server" 
                                ImageUrl="~/images/delete.png" Height="16px" 
                                onclick="imgbtn_enquiry_Click" OnClientClick="return confirm('Are you sure you want to delete this record?');"  />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
                            </td>
                        </tr>
                    </table>
            </div>
        </td>
    </tr>
    
    <tr>
        <td align="left" height="43" colspan="2">Year &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:DropDownList 
                runat="server" ID="ddl_year"
                Width="350px" BorderStyle="Dashed" BorderWidth="1" AutoPostBack="True" 
                onselectedindexchanged="ddl_year_SelectedIndexChanged"></asp:DropDownList>
                &nbsp;</td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Upload File :</td>
            <td>
                <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" 
                    onuploadcomplete="AjaxFileUpload1_UploadComplete" />
            </td>
    </tr>
    <tr>
        <td align="left">
            
            &nbsp;</td>
        <td height="43" align="left">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                style="height: 30px" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="img_back" runat="server" ImageUrl="~/Images/back.jpg" OnClick="img_back_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" style="line-height:1.8em;">
           Search</td>
           <td>&nbsp;</td>
    </tr>
                         <tr>
                             <td align="left" style="line-height:1.8em;" colspan="2">
                                 <asp:GridView ID="gv_result" runat="server" AutoGenerateColumns="False" 
                                     BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                     CellPadding="3" EmptyDataText="No Records Found" 
                                     Font-Names="Calibri" Font-Size="14px" ForeColor="Black" GridLines="Vertical" 
                                     Width="100%" DataKeyNames="AcardClassID,AcardPath,AcardRollNumber">
                                     <Columns>
                                         <asp:BoundField DataField="AcardClassID" HeaderText="AcardClassID" 
                                             Visible="False" />
                                         <asp:BoundField DataField="AcardClassName" HeaderText="Title" />
                                         <asp:BoundField DataField="AcardRollNumber" HeaderText="Roll Number" />
                                         <asp:TemplateField HeaderText="Download">
                                             <ItemTemplate>
                                                 <a href='<%#""+DataBinder.Eval(Container.DataItem,"AcardPath") %>' 
                                                     style="color:Black;" target="_blank">Click Here</a>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Show">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lnk_admitshow" Text='<%# Eval("AcardShow") %>' OnClick="lnk_admitshow_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_delete" runat="server" 
                                ImageUrl="~/images/delete.png" Height="16px" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="imgbtn_delete_Click"  />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                                     </Columns>
                                     <FooterStyle BackColor="#CCCCCC" />
                                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                     <AlternatingRowStyle BackColor="#CCCCCC" />
                                 </asp:GridView>
                             </td>
                         </tr>
    <tr>
        <td align="left" colspan="2">
            
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ShowMessageBox="True" ShowSummary="False" ValidationGroup="g1" />
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2">&nbsp;
        </td>
        </tr>
</table>
                </div>
           </div>
 </section>
<%--</ContentTemplate>
</asp:UpdatePanel>--%>

<script type="text/javascript">
   AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._testCrLfInTextNodes = function(element) {
       if (element.nodeType == 3) {
           if (/[\n\r]/g.test(element.data)) {
               element.data = element.data.replace(/[\n\r]/g, " ");
           }
       } else {
           for (var i = 0; i < element.childNodes.length; i++) {
               this._testCrLfInTextNodes(element.childNodes.item(i));
           }
       }
   }
   AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._saved_getContent = AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._getContent;
   AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._getContent = function() {
       if (!AjaxControlToolkit.HTMLEditor.isIE) {
           if (/[\n\r]/g.test(this._doc.body.innerHTML)) {
               this._testCrLfInTextNodes(this._doc.body);
           }
       }
       return this._saved_getContent();
   }
</script>

</asp:Content>

