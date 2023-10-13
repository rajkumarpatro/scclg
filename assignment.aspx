<%@ Page Title="Assignment- science College Durg " Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="assignment.aspx.cs" Inherits="assignment" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="source/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="source/jquery.fancybox.css?v=2.1.5" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
                     
    <%
        sql_operations op = new sql_operations();
        UIHelper uiHelper = new UIHelper();
    %>
   <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Assignment</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				
	
    
    
    
    <section class="rtd " style="padding-top:20px;">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12"> 
                        <div class="card">
                            <div class="card-block">
                                <div class="md-card-block">

                                      <div class="row">        
                                            <div class="col-sm-12 col-xs-12 col-md-12">
                                                <label> <span class="text-danger">Note :- &nbsp; (Only Upload Pdf File (Before Upload all Page Merge in PDF format )*</span></label>
                                                </div>
                                            <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                            </ajaxtoolkit:ToolkitScriptManager>
                                          </div>
    
    <div class="row">
        
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <asp:Label runat="server" ID="lbl_user" ForeColor="Maroon" visible="false"></asp:Label>
                <label>कक्षा <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddl_admissionclass" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_admissionclass_SelectedIndexChanged"  ForeColor="#0099FF"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage=" कक्षा  चुनिये" ControlToValidate="ddl_admissionclass" ValidationGroup="g1" Display="Dynamic" Text="कक्षा  चुनिये" InitialValue="0"></asp:RequiredFieldValidator>
                
            </div>
        </div>
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <label>वर्ष  <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddl_part" runat="server" class="form-control"  ForeColor="#0099FF" AutoPostBack="True" OnSelectedIndexChanged="ddl_part_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="कृपया वर्ष चुनिये" ControlToValidate="ddl_part" ValidationGroup="g1" Display="Dynamic"  Text="कृपया वर्ष  चुनिये" InitialValue="0"></asp:RequiredFieldValidator>
                
            </div>
        </div>
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <label>विषय चुने <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddl_subject" runat="server" class="form-control" ForeColor="#0099FF"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="कृपया विषय चुनिये" ControlToValidate="ddl_subject" ValidationGroup="g1" Display="Dynamic"  Text="कृपया विषय चुनिये" InitialValue="0"></asp:RequiredFieldValidator>
                    
                </div>
        </div>
        <div class="col-sm-2 col-xs-6 col-md-3">
            <div class="md-input-wrapper">
                <label>पेपर का नाम<span class="text-danger">*</span></label>
                <asp:TextBox CssClass="form-control  " BorderColor="#0066CC" ID="txt_paper_name" runat="server"  ValidationGroup="g1"></asp:TextBox>
                <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txt_paper_name" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"></ajaxtoolkit:FilteredTextBoxExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ForeColor="Red" runat="server" ErrorMessage="कृपया पेपर का नाम  प्रविष्ट करे" ControlToValidate="txt_paper_name" ValidationGroup="g1" Display="Dynamic" Text="कृपया पेपर का नाम  प्रविष्ट करे"></asp:RequiredFieldValidator>
                    
                </div>
        </div>
       
    </div>

                                    <div class="row">
                                         
                               <div class="col-sm-2 col-xs-6 col-md-4">
                                            <div class="md-input-wrapper">
                                                <label>रोल नंबर<span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control  " BorderColor="#0066CC" ID="txt_rollno" runat="server"  ValidationGroup="g1"></asp:TextBox>
                                                <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txt_rollno" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"></ajaxtoolkit:FilteredTextBoxExtender>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="कृपया रोल नंबर प्रविष्ट करे" ControlToValidate="txt_rollno" ValidationGroup="g1" Display="Dynamic" Text="कृपया रोल नंबर प्रविष्ट करे"></asp:RequiredFieldValidator>
                    
                                                </div>
                                        </div>
                                <div class="col-sm-2 col-xs-6 col-md-4">
                                            <div class="md-input-wrapper">
                                                <label>अपलोड असाइनमेंट  <span class="text-danger">*</span></label>
                                               <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
                                                <asp:Label ID="Label1" runat="server" Text="0" visible="false"></asp:Label>
                                               <%--<asp:CheckBox ID="chk_not" runat="server" CssClass="checkbox-inline" Text="Photo Not Available" ForeColor="Red" />
                                               <asp:CheckBox ID="chk_new" runat="server" Text="असाइनमेंट " AutoPostBack="True" OnCheckedChanged="chk_new_CheckedChanged" />
                                               <asp:Image ID="img_logo" runat="server" Class="img-fluid" style="height: 200px;" />  --%>                                              
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="कृपया अपलोड असाइनमेंट  प्रविष्ट करे" ControlToValidate="FileUpload1" ValidationGroup="g1" Display="Dynamic" Text="कृपया अपलोड असाइनमेंट  प्रविष्ट करे"></asp:RequiredFieldValidator> 
                    
                                                </div>
                                        </div>

                                        <div class="col-sm-2 col-xs-6 col-md-2">
                                             <label>यहाँ क्लिक करें  <span class="text-danger">*</span></label>
                                            <asp:Button ID="btn_submit" ValidationGroup="g1" runat="server" Text="Submit" class="btn btn-success waves-effect waves-light m-r-30" OnClick="btn_submit_Click"/> 
                                        </div>
                                         
                                    </div>
                                    </div>
    
                            </div>
                        </div>
                    </div>
                </div>
         </div>
        </div>
    </section>
                   
</asp:Content>

