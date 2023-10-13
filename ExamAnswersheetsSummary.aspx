<%@ Page Title="Exam Answer Sheets" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="ExamAnswersheetsSummary.aspx.cs" Inherits="ExamAnswersheetsSummary" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Exam Answer Sheets Summary<asp:ToolkitScriptManager ID="ToolkitScriptManager1" 
                runat="server"></asp:ToolkitScriptManager></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				=
    
     <section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                 
                 <div class="col-sm-2 col-xs-6 col-md-3">
                     <a href="CPanel.aspx" class="btn btn-warning">Back</a>
                </div>
                 
             </div>
         </div>
      </div>
    </section>
<section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">    
                    
                    <div class="row">
                        <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None"
                            Width="100%"
                            Style="left: 1px; top: -4px" DataKeyNames="CourseId,SubjectId,Part,SubjectName,CourseName,paper">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CourseName" HeaderText="Course" />
                                <asp:BoundField DataField="Part" HeaderText="Part" />
                                <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                                <asp:BoundField DataField="paper" HeaderText="Paper" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />

                                <asp:TemplateField HeaderText="Download" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtn_download" runat="server" Height="16"
                                            ImageUrl="~/Images/downloadicon.png" OnClick="imgbtn_download_Click" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
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
    </section>

</asp:Content>

