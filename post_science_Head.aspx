<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="post_science_Head.aspx.cs" Inherits="post_science_Head" Title="Page Head" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
   
    
	

    <section>
      <div class="container">
          <h4>Page Head</h4>
        <div class="row">
            
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                            <div class="element-size-100">
                                
                                    <div class="col-md-12">   
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>
                                                <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="#CC3300"></asp:Label>
                                                <label>Menu Name :</label>
                                                <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>
                                                
                                            </div>
                                            <div class="col-md-3">
                                                <label>Order No :</label>
                                                <asp:DropDownList ID="ddl_order" runat="server" class="form-control"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Show :</label>
                                                 <asp:DropDownList ID="ddl_show" runat="server" class="form-control">
                                                    <asp:ListItem>Yes</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="col-md-4">
                                                 <br />
                                                 <asp:Button ID="btn_Save" runat="server" class="btn btn-success" onclick="btn_Save_Click" Text="Submit"></asp:Button>&nbsp; &nbsp;
                                                 <asp:Button ID="btn_setorder" runat="server" class="btn btn-primary" Text="Set Order"  OnClick="btn_setorder_Click"></asp:Button>
                                             </div>
                                        </div>
                                        <div class="row">
                                             
                                             
                                        </div><br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CellPadding="3" 
                                                    Width="100%" 
                                                     style="left: 1px; top: -4px" DataKeyNames="PAGE_HEAD_ID,REORDER,SHOW" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" >
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="PAGE_HEAD_ID" HeaderText="ID" visible="false" />
                    
                                                        <asp:BoundField DataField="PAGE_HEAD_NAME" HeaderText="Title" /> 
                                                        <asp:TemplateField HeaderText="ORDER" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_order" runat="server" Text='<%# Eval("REORDER") %>' Width="50" Height="20"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        
                                                        <asp:TemplateField HeaderText="Show">
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ID="lnk_show" Text='<%# Eval("SHOW") %>' OnClick="lnk_show_Click"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" style="height: 16px" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton3" runat="server" 
                                                                ImageUrl="~/Images/delete.png"  
                                                                OnClientClick="return confirm('Do you want to delete Menu? ');" OnClick="imgbtn_delete_Click" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
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

