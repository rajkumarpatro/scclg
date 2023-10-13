<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_studentsection.aspx.cs" Inherits="update_news" Title="Downloads" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Student Section</h1><asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->

<section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                
                   <div class="col-md-2">
                            <label class="text-danger">Date :</label>
                            <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" visible="false"></asp:Label>
                            <asp:TextBox ID="txtDisplayDate" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
            
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                                    runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txtDisplayDate">
                                </asp:FilteredTextBoxExtender>
            
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                    Enabled="True" TargetControlID="txtDisplayDate" Format="dd-MM-yyyy">
                                </asp:CalendarExtender>
                   </div>
                   <div class="col-md-4">
                            <label class="text-danger">Title :</label>
                            <asp:TextBox ID="txt_Description" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" ></asp:TextBox>
                   </div>
                 <div class="col-md-3">
                     <label class="text-danger">Page :</label>
                     <asp:DropDownList ID="ddl_page" runat="server" AutoPostBack="True" EnableViewState="true" AutoGenerateColumns="False" class="form-control" BorderColor="#0000CC" ForeColor="#663300" OnSelectedIndexChanged="ddl_page_SelectedIndexChanged">
                         <asp:ListItem>Downloads</asp:ListItem>
                         <asp:ListItem>Admission Notice and List</asp:ListItem>
                         <asp:ListItem>Examination Notice</asp:ListItem>
                         <asp:ListItem>Results</asp:ListItem>
                         <asp:ListItem>Syllabus</asp:ListItem>
                         <asp:ListItem>College Prospectus</asp:ListItem>
                         <asp:ListItem>Placement Cell</asp:ListItem>
                         <asp:ListItem>Roll List</asp:ListItem>
                         <asp:ListItem>Enrollment List 2019-20</asp:ListItem>
                         <asp:ListItem>Enrollment List 2020-21</asp:ListItem>
                         <asp:ListItem>Admitted Student</asp:ListItem>
                     </asp:DropDownList>
                 </div>
                 <div class="col-md-3">
                     <label class="text-danger">File :</label>
                     <asp:FileUpload ID="FileUpload1" runat="server" />
                     &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True"
                         OnCheckedChanged="chk_new_CheckedChanged" Text="Upload New File"
                         Visible="False" />
                     &nbsp;<asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                 </div>
            </div>
             <div class="row">
                 
                 <div class="col-md-6">
                     <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
                 </div>
             </div>
             <div class="row">
                 <div class="col-md-6 col-xs-12">

                     <asp:Button runat="server" ID="btn_submit" OnClick="btn_submit_Click" class="post-btn btn btn-primary btn-effect" Text="Submit"></asp:Button>
                     &nbsp;
                            <asp:Button runat="server" ID="btn_Reset" OnClick="btn_Reset_Click" class="post-btn btn btn-primary btn-effect" Text="Reset"></asp:Button>
                     &nbsp;
                            <asp:Button runat="server" ID="btn_Menu" OnClick="btn_Menu_Click" class="post-btn btn btn-primary btn-effect" Text="Main Menu"></asp:Button>
                 </div>
                 <div class="col-md-6">
                     <asp:Button runat="server" ID="btn_delete_selected" OnClick="btn_delete_selected_Click" class="post-btn btn btn-primary btn-effect" Text="Delete Selected"></asp:Button>
                 </div>
             </div>
            <div class="row">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-12">
                            <label class="text-danger">Existing Records :</label>
                            <asp:GridView ID="news_Grid" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4"
                     ForeColor="#333333" GridLines="None" 
                    Width="100%" style="left: 1px; top: -4px" DataKeyNames="D_id,filepath" >
                    <Columns>
                        
                        <asp:TemplateField HeaderText="S.No.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="D_date" HeaderText="Date"   />

                        <asp:BoundField DataField="Description" HeaderText="Description"   />
                        <asp:BoundField DataField="D_page" HeaderText="Page"   />    
                        <asp:TemplateField HeaderText="Filepath">  
                        <ItemTemplate>  
                            <a href='<%#Eval("filepath")%>' target="_blank">Click here</a>  
                        </ItemTemplate>  
                    </asp:TemplateField>                
                        
                        <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtn_edit" runat="server" ImageUrl="images/edit.png" OnClick="imgbtn_edit_Click" style="height: 16px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_delete" runat="server" 
                                ImageUrl="~/Images/delete.png"  
                                OnClientClick="return confirm('Do you want to delete this Details? ');" OnClick="imgbtn_delete_Click1" />
                        </ItemTemplate>
                    </asp:TemplateField>

                        <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chk_select" runat="server" />
                            </ItemTemplate>
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
  
  


</asp:Content>

