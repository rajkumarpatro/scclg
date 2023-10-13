<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="post_pastevents.aspx.cs" Inherits="post_pastevents" ValidateRequest="false" Title="Latest Post" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="main-section">
					  <div  class="page-section ">
                                <!-- Container Start -->
                <div  class="container">
                    <div class="row">
                        <div class="section-fullwidth">
                            <div class="element-size-100">
                                
                                    <div class="col-md-12">
                                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
    <table width="100%">
    
    <tr>
        <td align="left">
            Event Name<asp:Label ID="lbl_Id"  runat="server" Font-Bold="True" visible="false"></asp:Label></td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txt_Title" runat="server" Width="300px"></asp:TextBox>
        </td>
        <td align="left">
            Event Date</td>
        <td align="left" style="padding:5px;">
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                TargetControlID="txt_date" Format="dd-MM-yyyy">
            </asp:CalendarExtender>
            <asp:TextBox ID="txt_date" runat="server" 
                Width="100px" ></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                TargetControlID="txt_date" ValidChars="0987654321-">
            </asp:FilteredTextBoxExtender>
            &nbsp; &nbsp;
            Show in Gallery 
            <asp:DropDownList ID="ddl_show" Height="30" runat="server" Width="100px" BorderColor="Black">
                 
                 <asp:listitem>Yes</asp:listitem>                 
                <asp:listitem>No</asp:listitem>
            </asp:DropDownList>
        </td>
    </tr>
    
    <tr>
        <td align="left">
            Description :</td>
        <td colspan="3" style="padding:5px;">
            <cc1:Editor ID="txt_description" runat="server" Height="300px" />
        </td>
    </tr>
    
         <tr>
        <td align="left" valign="top">
            
            Department</td>
        <td align="left" valign="top" style="padding:5px;">
            <asp:GridView runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" ID="gv_department" AutoGenerateColumns="False" Width="300px" DataKeyNames="PAGE_ID">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox id="chk_department" class="checkbox-inline" runat="server" text="" style="padding-bottom: 20px;"></asp:CheckBox>
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
        </td>
        <td align="left" colspan="2" valign="top">
            <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" 
                    onuploadcomplete="AjaxFileUpload1_UploadComplete" />
            <asp:GridView runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" ID="gv_photos" AutoGenerateColumns="False" Width="100%" DataKeyNames="Photo_id,filepath">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    
                    <asp:TemplateField HeaderText="Photos" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                             <img src="<%# Eval("filepath") %>" class="img-responsive" width="100" />
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
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" /> &nbsp;  &nbsp;   
            <a href="CPanel.aspx" class="btn btn-primary">Back</a>
        </td>
    </tr>
         
        
    
    <tr>
        <td colspan="4" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
        <tr>
            <td colspan="4">
                <%--<asp:DropDownList ID="ddl_top" runat="server" Width="100" OnSelectedIndexChanged="ddl_top_SelectedIndexChanged">
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="25" Value="25"></asp:ListItem>
                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                    <asp:ListItem Text="All" Value="100%"></asp:ListItem>
                </asp:DropDownList>--%>
            </td>
        </tr>

    <tr>
        <td style="line-height:3em;" colspan="4" align="left">
            
            <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" Width="100%" DataKeyNames="event_id,event_pic" EnableModelValidation="True" >
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="event_id" HeaderText="event_id" visible="false" />
                    <asp:BoundField DataField="event_name" HeaderText="Event" />
                    <asp:BoundField DataField="event_date" HeaderText="Date"  />
                    <asp:BoundField DataField="department_show" HeaderText="Show"/>
                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_edit" runat="server" ToolTip="Edit" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" style="height: 16px" /> &nbsp; 
                            <asp:ImageButton ID="imgbtn_delete" runat="server" ToolTip="Delete" 
                            ImageUrl="~/Images/delete.png"  
                            OnClientClick="return confirm('Do you want to delete this record? ');" OnClick="imgbtn_delete_Click1" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    
                </Columns>
                <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <HeaderStyle Font-Size="10pt" HorizontalAlign="Left" />
            </asp:GridView>
            
          </td>
    </tr>
    <tr>
        <td colspan="4" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                    </div>
                </div>
    <//div>
                       </div>
                    </div>
                          </div>
     </div>
    


    

</asp:Content>

