<%@ Page Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="post_video.aspx.cs" Inherits="update_news" Title="Media" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Post Online Video Lectures and Cultural Events <asp:Label ID="Label1" runat="server"></asp:Label></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


    
     <section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                
                   <div class="col-md-2">
                            <label class="text-danger">Date :</label>
                            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" visible="false"></asp:Label><asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                            <asp:TextBox ID="txtDisplayDate" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
            
                                <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender" 
                                    runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txtDisplayDate">
                                </asp:FilteredTextBoxExtender>
            
                                <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtDisplayDate" Format="dd-MM-yyyy">
                                </asp:CalendarExtender>
                   </div>
                   <div class="col-md-5">
                            <label class="text-danger">Title :</label>
                            <asp:TextBox ID="txt_Description" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" ></asp:TextBox>
                   </div>
                   <div class="col-md-5">
                            <label class="text-danger">Page :</label>
                            <asp:DropDownList ID="ddl_page" runat="server" AutoPostBack="True" EnableViewState="true" AutoGenerateColumns="False" class="form-control" BorderColor="#0000CC" ForeColor="#663300">    
                             
                        </asp:DropDownList>
                   </div>
            </div>
            <div class="row">
                
                   <div class="col-md-6">
                            <label class="text-danger">URL :</label>
                            <asp:TextBox ID="txt_url" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="Red" Text="*"></asp:Label>
                   </div>
                   
            </div>
            <div class="row">
                <div class="col-md-2 col-xs-12">
                            
                            <asp:Button runat="server" ID="btn_login" OnClick="btn_login_Click" class="post-btn btn btn-primary btn-effect" Text="Submit"></asp:Button><br />
                   </div>
                   <div class="col-md-2 col-xs-12">
                             
                            <asp:Button runat="server" ID="btn_Reset" OnClick="btn_Reset_Click" class="post-btn btn btn-primary btn-effect" Text="Reset"></asp:Button><br />
                   </div>
                  
                   <div class="col-md-2 col-xs-12">
                             
                            <asp:Button runat="server" ID="btn_Menu" OnClick="btn_Menu_Click" class="post-btn btn btn-primary btn-effect" Text="Main Menu"></asp:Button><br />
                   </div>
            </div>
            <div class="row">
                    <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-12">
                            <label class="text-danger">Existing Videos :</label>
                            <asp:GridView ID="news_Grid" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4"
                     ForeColor="#333333" GridLines="None" 
                    Width="100%" style="left: 1px; top: -4px" DataKeyNames="D_id" >
                    <Columns>
                        <asp:TemplateField HeaderText="S.No.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="D_id" HeaderText="D_id"  visible="false"/>
                        <asp:BoundField DataField="D_date" HeaderText="Date"   />

                        <asp:BoundField DataField="Description" HeaderText="Description"   />
                        <asp:BoundField DataField="D_page" HeaderText="Page"   />    
                        <asp:TemplateField HeaderText="Videos">  
                        <ItemTemplate>  
                            <video width="130" height="130" controls>  
                                <source src='<%#Eval("URL")%>' type="video/mp4" style="max-height:125px;">  
                            </video>  
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
                                OnClientClick="return confirm('Do you want to delete Video Details? ');" OnClick="imgbtn_delete_Click1" />
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
                </div>

            </div>
                     
                </div>
           
           </div>
      
 </section>
 <script type="text/javascript">  
    $(document).ready(function () {  
        $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();  
    });  
</script>
</asp:Content>

