<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_feedback_from_alumni.aspx.cs" Inherits="feedback_from_alumni" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Feedback from Alumni<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager></h1></div>
						</div>
					</div>
				</div>
                     
                         <div  class="container">

                             <div class="row">
                                       <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                       <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                 </div>
                             <div class="row">
                                 <div class="col-md-8">
                                    
                                     <asp:Button ID="Button1" runat="server" Text="Click Here For Report" Class="btn btn-success" OnClick="btn_report_menu_Click"  />
                                 </div>
                                 <div class="col-md-4">
                                    <asp:Button ID="Button3" runat="server" Text="Go to Control Panel" Class="btn btn-success" OnClick="btn_main_menu_Click" />
                                </div>
                             </div>
                             <div class="row">
                                &nbsp;
                            </div> 
                                            <div class="row">
                                  
                                                          <div style="overflow:scroll">
                                        
                                                                <asp:GridView ID="a_feedback" runat="server"  BackColor="White" BorderColor="#3366CC" DataKeyNames="FEEDBACK_ID" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" AutoGenerateColumns="False" Width="1460px" >
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sn">
                                                                            <ItemTemplate>
                                                                                <%# Container.DataItemIndex + 1 %>
                                                                            </ItemTemplate>
                                                                           <HeaderStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="FEEDBACK_ID" HeaderText="FEEDBACK_ID" Visible="False" />
                                                                        <asp:BoundField DataField="ALUMNUS_NAME" HeaderText="Name" />
                                                                        <asp:BoundField DataField="ALUMNUS_ADDRESS" HeaderText="ADDRESS" />
                                                                        <asp:BoundField DataField="COURSE_TYPE" HeaderText="TYPE" />
                                                                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" Visible="False" />
                                                                        <asp:BoundField DataField="COURSE_ID" HeaderText="Course Name"  />
                                                                        <asp:BoundField DataField="GENDER" HeaderText="GENDER" />
                                                                        <asp:BoundField DataField="AGE" HeaderText="AGE" />
                                                                        <asp:BoundField DataField="OCCUPATION" HeaderText="Occupation" />
                                                                        <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" />
                                                                        <asp:BoundField DataField="YEAR_OF_COURSE" HeaderText="Passout Year" />
                                                                        <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT NO" />
                                                                         <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgbtn_edit" runat="server" ImageUrl="~/Images/edit.png" style="height: 16px" 
                                                                                    OnClick="imgbtn_edit_Click"   />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>                                                                        

                                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtn_delete" runat="server" 
                                                                                ImageUrl="~/Images/delete.png"  
                                                                                OnClientClick="return confirm('Do you want to delete Student Feedback Details? ');" OnClick="imgbtn_delete_Click1" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>

                                                                    </Columns>
                                                                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                                 </asp:GridView>                                    
                                                                    </div>
                        </div>
                             </div>                          
                                               
                           </div>

</asp:Content>

