<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_pasteventssql.aspx.cs" Inherits="update_news" ValidateRequest="false" Title="Latest Post" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
     
    
 <div class="main-section">			
					

					
					
					  <div  class="page-section "   style="margin-top: 0px;margin-bottom: 0px;border-top: 0px #e0e0e0 solid;border-bottom: 0px #e0e0e0 solid;" >
                                <!-- Container Start -->
                <div  class="container">
                    <div class="row">
                        <div class="section-fullwidth">
                            <div class="element-size-100">
                                <div class="cs-heading-sec col-md-12">
                                    <div class="inner-sec" style="border-bottom:1px solid #ebebe9 !important;"  >
                                        <h1 style="color: !important; font-size: 30px !important; text-align:left;">Photo Gallery<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager></h1>
                                        

                                    </div>

                                </div>

                            </div>
                            <div class="element-size-100">
                                
                                    <div class="col-md-12">
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
                Width="300px" ></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                TargetControlID="txt_date" ValidChars="0987654321-">
            </asp:FilteredTextBoxExtender>
        </td>
    </tr>
    
    <tr>
        <td align="left">
            Description :</td>
        <td colspan="3" style="padding:5px;">
            <cc1:Editor ID="txt_description" runat="server" Height="400px" />
        </td>
    </tr>
    <tr>
        <td align="left">
            
            Upload Front Pic</td>
        <td align="left" valign="top" style="padding:5px;">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;&nbsp;<asp:CheckBox ID="chk_new" runat="server" class="checkbox-inline" AutoPostBack="True" 
                oncheckedchanged="chk_new_CheckedChanged" Text="New Photo" Visible="False" />
            &nbsp;
            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>
            
                    
                
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                Font-Bold="True" ForeColor="Black">Upload Photo</asp:LinkButton>
        
        </td>
        <td align="left" valign="top">
            
            Show in Gallery</td>
        <td align="left" valign="top" colspan="3" style="padding:5px;">
            <asp:DropDownList ID="ddl_show" runat="server" Width="350px" BorderColor="Black">
                 <asp:listitem>No</asp:listitem>
                 <asp:listitem>Yes</asp:listitem>
                                                                    
            </asp:DropDownList>
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
        <td align="left" valign="top">
            
            Show in Gallery</td>
        <td align="left" valign="top" colspan="3" style="padding:5px;">
            <asp:DropDownList ID="ddl_session" runat="server" Width="350px" BorderColor="Black">
                <asp:listitem value="2020-2021">2020-2021</asp:listitem> 
                <asp:listitem value="2019-2020">2019-2020</asp:listitem> 
                <asp:listitem value="2018-2019">2018-2019</asp:listitem>
                 <asp:listitem value="2017-2018">2017-2018</asp:listitem>
                                                                    
            </asp:DropDownList>
        </td>
    </tr>
         
        
    <tr>
        <td align="left">&nbsp;</td>
        <td align="left" colspan="3" style="padding:5px;">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                style="height: 30px" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="4" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="left"><h4>Existing Post</h4>
            </td>   
    </tr>

    <tr>
        <td style="line-height:3em;" colspan="4" align="left">
            
            <asp:GridView ID="news_Grid" runat="server" 
                AutoGenerateColumns="False" CellPadding="4"
                 ForeColor="#333333" GridLines="None" 
                Width="100%" style="left: 1px; top: -4px" DataKeyNames="event_id,event_pic" >
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
                    <asp:BoundField DataField="event_page" HeaderText="Session"  />
                    <asp:BoundField DataField="department_show" HeaderText="Gallery"/>
                    
                    <asp:TemplateField HeaderText="PIC" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <img src="<%# Eval("event_pic") %>" class="img-responsive" width="100" height="60" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_edit" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" style="height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtn_delete" runat="server" 
                            ImageUrl="~/Images/delete.png"  
                            OnClientClick="return confirm('Do you want to delete this Details? ');" OnClick="imgbtn_delete_Click1" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="10pt" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

