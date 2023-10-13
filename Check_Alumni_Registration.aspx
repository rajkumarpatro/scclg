<%@ Page Title="Alumni Registration" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Check_Alumni_Registration.aspx.cs" Inherits="Check_Alumni_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
     <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Alumni Registration</h1></div>
						</div>
					</div>
				</div>
                      
     <div  class="container pt-20">
            
                    <div class="row pt-20">
                                <div class="row pt-20">
                                        <div class="col-md-8">
                                    
                                             <asp:Button ID="Button1" runat="server" Text="Back" Class="btn btn-success" OnClick="btn_main_menu_Click"  />
                                         </div>
                                 
                                        </div>
                        <div class="col-md-12">
                            <div>&nbsp;</div>
                            <div class="element-size-100">
                                <div class="col-md-2">

                                                                       
                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                         <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>

                                                                     </div>
                                                              <div class="row">
                                                                        &nbsp;
                                                                </div>

                                                                 
                                                                 </div>
                                                                
                                                                   <div style="overflow:scroll">
                                        
                                                                <asp:GridView ID="s_feedback" runat="server" BackColor="White" BorderColor="#3366CC" DataKeyNames="A_ID" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" AutoGenerateColumns="False" Width="1160px" >
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sn">
                                                                            <ItemTemplate>
                                                                                <%# Container.DataItemIndex + 1 %>
                                                                            </ItemTemplate>
                                                                           <HeaderStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="A_ID" HeaderText="A_ID" Visible="False" />
                                                                        <asp:BoundField DataField="NAME" HeaderText="NAME" />
                                                                        <asp:BoundField DataField="FATHER" HeaderText="FATHER" />
                                                                        <asp:BoundField DataField="COURSE" HeaderText="COURSE" />
                                                                        <asp:BoundField DataField="PASSOUTYEAR" HeaderText="PASSOUT YEAR" />
                                                                        <asp:BoundField DataField="COURSE" HeaderText="COURSE" />
                                                                        <asp:BoundField DataField="DEPARTMENT" HeaderText="WORKING DEP." />
                                                                        <asp:BoundField DataField="DESIGNATION" HeaderText="DESIGNATION" />
                                                                        <asp:BoundField DataField="PLACE" HeaderText="WORKING PLACE" />
                                                                        <asp:BoundField DataField="EMAIL_ID" HeaderText="EMAIL_ID" />
                                                                        <asp:BoundField DataField="MOBILE_NO" HeaderText="MOBILE_NO" />
                                                                        <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" />
                                                                        <asp:TemplateField HeaderText="PIC" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <img src="<%# Eval("PHOTO") %>" class="img-responsive" width="80" height="100" />
                                                                            </ItemTemplate>
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
                                                                    <div class="row">
                                                                        &nbsp;
                                                                    </div>


                                                        </div>
                                                      <asp:Label ID="lblInfo" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
													<div id="loading_div178161213"></div><div id="message178161213"  style="display:none;"></div></div>
											
                            </div>
                            <br />
                          <br />
                         </div>
                      
                 
                
</asp:Content>

