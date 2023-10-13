<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_students_teacher_grid.aspx.cs" Inherits="students_feedback_form_about_Teachers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Feedback from Students About Teachers <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager></h1></div>
						</div>
					</div>
				</div>
                      </div>
     <div  class="container">
                    <div class="row">

                     <div class="row">
                     <div class="col-md-12">
                          <div class="row">
                                                        <div class="col-md-2">
                                                            <asp:Button ID="Button2" runat="server" Text="Back" Class="btn btn-success" OnClick="btn_back_Click" ValidationGroup="g1" />
                                                        </div>
                                                        <div class="col-md-2">
                                                            <asp:Button ID="Button3" runat="server" Text="Go to Control Panel" Class="btn btn-success" OnClick="btn_main_menu_Click" ValidationGroup="g1" />
                                                        </div>
                                                 </div>
                         <div class="row">
                                                            <div class="col-md-3">

                                                                <label>
                                                                    Name of Student<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                <asp:TextBox ID="txtsname" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Please enter your name" ControlToValidate="txtsname" ValidationGroup="g1" Display="Dynamic" Text="Please enter your name"></asp:RequiredFieldValidator>
                                                               
                                                                </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Father Name<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                      <asp:TextBox ID="txtfname" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Please enter your Father name" ControlToValidate="txtfname" ValidationGroup="g1" Display="Dynamic" Text="Please enter your Father name"></asp:RequiredFieldValidator>
                                                                     
                                                                     
                                                                 </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Level<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                   <asp:DropDownList ID="ddl_admissionclasstype" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" OnSelectedIndexChanged="ddl_admissionclasstype_SelectedIndexChanged" AutoPostBack="True">
                                                                        <asp:ListItem Value="UG">UG</asp:ListItem>
                                                                        <asp:ListItem Value="PG">PG</asp:ListItem>
                                                                    </asp:DropDownList> 

                                                                     </div>
                                                                  
                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Course<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:DropDownList ID="ddl_admissionclass" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300">
                                                                    </asp:DropDownList>
                                                                   </div>
                                                                 </div>
                                                                 <div class="row">     
                                                        <div class="col-md-3">

                                                                <label>
                                                                    Sem<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:DropDownList ID="ddl_part" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300">
                                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                     </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Academic Year<span style="color:red;font-weight:600;">*</span>
                                                                </label>
                                                                      <asp:DropDownList ID="Y_option" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                          <asp:ListItem Value="">Please Select</asp:ListItem>  
                                                                          <asp:listitem text="2019-20" value="2019-20"></asp:listitem>
                                                                      </asp:DropDownList>
                                                                        
                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please Select Academic Year" ControlToValidate="Y_option" ValidationGroup="g1" Display="Dynamic" Text="Please Select Academic Year"></asp:RequiredFieldValidator>
                                                                     

                                                                 </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                   Contact Number<span style="color:red;font-weight:600;">*</span>

                                                                </label><br />
                                                                      <asp:TextBox ID="txtcno" runat="server" MaxLength="10" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                                                                     
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Contact Number" ControlToValidate="txtcno" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Your Contact Number"></asp:RequiredFieldValidator>
                                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" ValidChars="0987654321" TargetControlID="txtcno"></asp:FilteredTextBoxExtender>
                                                                

                                                                 </div>
                                                                </div>
                                                             <div class="row">
                                                                 <hr />

                                                             </div>

                                                                 <div class="row">
                                                            <h4 class="text-danger">प्राध्यापकों का मूल्यांकन</h4>
                                                          
                                                        </div>
                         <hr />
                                                        
                                                            <div class="row">
                                                            
                                                                     <div class="col-md-3">
                                                                <label style="font-size: 11px;">01. अध्यापन शैली एवं विषय में दक्षता/पढ़ाने का तरीका एवं विषय का ज्ञान</label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q1" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                    <asp:ListItem value="4">Thoroughly/पूर्ण रूप से</asp:ListItem>
	                                                                <asp:ListItem value="3">Satisfactorily संतोषजनक</asp:ListItem>
	                                                                <asp:ListItem value="2">Poorly/अपर्याप्त</asp:ListItem>
	                                                                <asp:ListItem value="1">Indifferently/उदासीन</asp:ListItem>

                                                                </asp:DropDownList>
														        
                                                             </div>
                                                                     <div class="col-md-3">
                                                                <label style="font-size: 11px;">02. कक्षा में नियमितता एवं समयबद्धता<br /><br /></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q2" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                    <asp:ListItem value="4">More than adequate/बहुत पर्याप्त </asp:ListItem>
	                                                                <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                <asp:ListItem value="1">Very poor/बहुत कम</asp:ListItem>
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                                     <div class="col-md-3">
                                                                <label style="font-size: 11px;">03. विद्यार्थियों के प्रष्नों के उत्तर देने में कुषलता तथा संवाद<br /><br /></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q3" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                    <asp:ListItem value="4">Regular &amp; timely/नियमित एवं समय में</asp:ListItem>
	                                                                <asp:ListItem value="3">Usfull remarks/उपयोगी टिप्पणी</asp:ListItem>
	                                                                <asp:ListItem value="2">Some times late/अक्सर देर से</asp:ListItem>
	                                                                <asp:ListItem value="1">With ought any remarks/बिना किसी टिप्पणी के</asp:ListItem>
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                                     <div class="col-md-3">
                                                                <label style="font-size: 11px;">04. विद्यार्थियों से कक्षा में व्यवहार<br /><br /></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q4" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                    <asp:ListItem value="4">Always courteous/सदैव विनीत</asp:ListItem>
	                                                                <asp:ListItem value="3">Sometimes rude/कभी-कभी कठोर</asp:ListItem>
	                                                                <asp:ListItem value="2">Always indifferent/हमेशा उदासीन</asp:ListItem>
	                                                                <asp:ListItem value="1">Can not say/कह नहीं सकते</asp:ListItem>
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                             </div>
                                                            
                                                         <div class="row">
                                                            &nbsp;
                                                        </div> 
                                                           
                                                            <div class="row">
                                                            
                                                             <div class="col-md-3">
                                                                <label style="font-size: 11px;">05. पाठ्यक्रम पूर्ण करने में सक्षमता </label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q5" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                     <asp:ListItem value="4">More than adequate/बहुत पर्याप्त </asp:ListItem>
	                                                                <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                <asp:ListItem value="1">Very poor/बहुत कम</asp:ListItem>
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                             
                                                                </div>
                                                            
                                                      
                       
                                        
                                                                    <div class="row">
                                                                       <div class="col-md-12">

                                                                      <label> Suggestions if any / यदि कोई हो तो सुझाव दें</label><br />
                                                                     <asp:Textbox rows="5" class="form-control" BorderColor="#0000CC" ForeColor="#663300"  columns="80" TextMode="multiline" runat="server" ID="txtmsg" >

                                                                     </asp:Textbox>

                                                             </div>
                                                                </div>


                                                             <div class="row">
                                                             
                                                                 <div class="col-md-2">

                                                                <label>
                                                                  Thank You for Feedback……..!! 

                                                                </label>
                                                                     </div>


                                                                 <div class="col-md-2">

                                                                        <asp:Button ID="btn_Save" runat="server" Text="Update" class="btn btn-success" ValidationGroup="g1" OnClick="btn_Save_Click1"/> 

                                                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                                                        <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>

                                                                     </div>
                                                                 <div class="col-md-2">
                                                                        <asp:Button ID="btn_back" runat="server" Text="Back" Class="btn btn-success" OnClick="btn_back_Click" ValidationGroup="g1" />
                                                                </div>
                                                                 <div class="col-md-2">
                                                                        <asp:Button ID="btn_main_menu" runat="server" Text="Go to Control Panel" Class="btn btn-success" OnClick="btn_main_menu_Click" ValidationGroup="g1" />
                                                                </div>
                                                                 </div>

                                                                 

                                                                 <div class="row">
                                                                        &nbsp;
                                                                </div>

                                                                 
                                                                 </div>
                     </div>                                           
                                                                  
                                                                                                  
                                                                    </div>
                                                                    <div class="row">
                                                                        &nbsp;
                                                                    </div>

                         </div>
                         
    
</asp:Content>

