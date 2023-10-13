<%@ Page Title="Students Assignments" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="poststudentsassignments.aspx.cs" Inherits="poststudentsassignments" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Student Assignments<asp:ToolkitScriptManager ID="ToolkitScriptManager1" 
                runat="server">  </asp:ToolkitScriptManager></h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
    
     <section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                 <div class="col-sm-2 col-xs-6 col-md-3">
                    <div class="md-input-wrapper">
                        
                        <label>खोजे दिनांकवार <span class="text-danger">*</span></label>

                        <asp:TextBox ID="txtDisplayDate" runat="server" class="form-control"></asp:TextBox>
            
                        <asp:FilteredTextBoxExtender ID="txtDisplayDate_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" ValidChars="0123456789-" TargetControlID="txtDisplayDate">
                        </asp:FilteredTextBoxExtender>
            
                        <asp:CalendarExtender ID="txtDisplayDate_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="txtDisplayDate" Format="dd-MM-yyyy">
                        </asp:CalendarExtender>
                
                    </div>
                </div>
                <div class="col-sm-2 col-xs-6 col-md-3"><br />
                    <asp:Button ID="btn_searchbydate" runat="server" Text="Search By Date" class="btn btn-success waves-effect waves-light m-r-30" OnClick="btn_searchbydate_Click"/> 
                </div>
                 <div class="col-sm-2 col-xs-6 col-md-3"><br />
                     <asp:Button ID="btn_rename" runat="server" Text="Rename" class="btn btn-danger waves-effect waves-light m-r-30" OnClick="btn_rename_Click" Visible="false"/>
                     <asp:Button ID="btn_delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete files listed in below table, this action will only delete files, records will not deleted?');" Text="Delete Files" class="btn btn-danger waves-effect waves-light m-r-30" OnClick="btn_delete_Click"/>
                 </div>
                 <div class="col-sm-2 col-xs-6 col-md-3"><br />
                    <asp:Button ID="btn_downloadzip" runat="server" Text="Download Zip" class="btn btn-info" OnClick="btn_downloadzip_Click"/> 
                     <a href="ResultPanel.aspx" class="btn btn-warning">Back</a>
                </div>
                 
             </div>
         </div>
      </div>
    </section>
<section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">    
                    <div class="row">
        
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <asp:Label runat="server" ID="lbl_user" ForeColor="Maroon" visible="false"></asp:Label>
                <label>कक्षा <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddl_admissionclass" runat="server" class="form-control" OnSelectedIndexChanged="ddl_admissionclass_SelectedIndexChanged" AutoPostBack="True"   ForeColor="#0099FF"></asp:DropDownList>
               
                
            </div>
        </div>
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <label>वर्ष  <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddl_part" runat="server" class="form-control"  ForeColor="#0099FF">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
             
                
            </div>
        </div>
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <label>विषय चुने <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddl_subject" runat="server" class="form-control" ForeColor="#0099FF"></asp:DropDownList>
              
                    
                </div>
        </div>
        <div class="col-sm-2 col-xs-6 col-md-2">
            <label>यहाँ क्लिक करें  <span class="text-danger">*</span></label>
        <asp:Button ID="btn_submit" runat="server" Text="Search" class="btn btn-success waves-effect waves-light m-r-30" OnClick="btn_submit_Click"/> 
        </div>
       
    </div>
                    <div class="row">
                    <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                 ForeColor="#333333" GridLines="None" 
                Width="100%" 
                 style="left: 1px; top: -4px" DataKeyNames="assig_id,CourseId,SubjectId" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="assig_id" HeaderText="ID" visible="false" />
                    <asp:BoundField DataField="CourseId" HeaderText="CourseId" visible="false"/>
                    <asp:BoundField DataField="UploadDates" HeaderText="Date" />
                    <asp:BoundField DataField="SubjectName" HeaderText="Subject" />     
                    <asp:BoundField DataField="Part" HeaderText="Part" />               
                    <asp:BoundField DataField="SubjectId" HeaderText="Link" visible="false"/>   
                    <asp:BoundField DataField="CourseName" HeaderText="Course" />                   
                    <asp:BoundField DataField="paper" HeaderText="Paper" />   
                    <asp:BoundField DataField="rollno" HeaderText="Roll No" />   
                    
                    <asp:TemplateField HeaderText="File" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href="<%# Eval("filepath") %>">Download</a>
                        </ItemTemplate>
                    </asp:TemplateField>   
                     <asp:BoundField DataField="filepath" HeaderText="File Name" />
                   <%-- <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtn_delete" runat="server" 
                            ImageUrl="~/Images/delete.png"  
                            OnClientClick="return confirm('Do you want to delete this Details? ');" OnClick="imgbtn_delete_Click" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
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

