<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_students_feedback_form_about_Teachers.aspx.cs" EnableEventValidation="false" Inherits="students_feedback_form_about_Teachers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Feedback from Students About Teachers </h1></div>
						</div>
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
                        <div style="overflow:scroll">
                                                                <asp:GridView ID="p_feedback" runat="server" BackColor="White"  BorderColor="#3366CC" DataKeyNames="FEEDBACK_ID,COURSE_ID" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" AutoGenerateColumns="False" Width="1460px"  >
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sn">
                                                                            <ItemTemplate>
                                                                                <%# Container.DataItemIndex + 1 %>
                                                                            </ItemTemplate>
                                                                           <HeaderStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="FEEDBACK_ID" HeaderText="FEEDBACK_ID" Visible="False" />
                                                                         <asp:BoundField DataField="STUDENT_NAME" HeaderText="PARENTS NAME" />
                                                                        <asp:BoundField DataField="FATHER_NAME" HeaderText="STUDENT" />
                                                                        <asp:BoundField DataField="COURSE_TYPE" HeaderText="COURSE_TYPE" />
                                                                        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" Visible="False"/>
                                                                        <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                                                                        <asp:BoundField DataField="YEAR_SEM" HeaderText="Sem" />
                                                                        <asp:BoundField DataField="ACADEMIC_YEAR" HeaderText="ACADEMIC YEAR" />
                                                                        <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" />
                                                                        <asp:BoundField DataField="MESSAGE" HeaderText="MESSAGE" />
                                                                        <asp:BoundField DataField="Q_1" HeaderText="Q_1" />
                                                                        <asp:BoundField DataField="Q_2" HeaderText="Q_2" />
                                                                        <asp:BoundField DataField="Q_3" HeaderText="Q_3" />
                                                                        <asp:BoundField DataField="Q_4" HeaderText="Q_4" />
                                                                        <asp:BoundField DataField="Q_5" HeaderText="Q_5" />
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
                                                                    <div class="row">
                                                                        &nbsp;
                                                                    </div>

                         </div>
                         </div>
                        
    
</asp:Content>

