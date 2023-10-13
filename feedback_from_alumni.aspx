<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="feedback_from_alumni.aspx.cs" Inherits="feedback_from_alumni" %>
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
                                    <div class="col-md-12">
                                       
                                                    <h3 class="text-danger">भूतपूर्व विद्यार्थियों से प्राप्त फीडबैक फार्म </h3>
                                                        
                                                        <hr />
                                                             <div class="row">
                                                            <div class="col-md-3">

                                                                <label>
                                                                    Name of the Alumnus<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                <asp:TextBox ID="txtaname" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>                                                                
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Please enter your name" ControlToValidate="txtaname" ValidationGroup="g1" Display="Dynamic" Text="Please enter your name"></asp:RequiredFieldValidator>
                                                               
                                                                </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Address of the Alumnus<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                      <asp:TextBox ID="txtaa" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                                                                     
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please enter Address of the Alumnus" ControlToValidate="txtaa" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Address of the Alumnus"></asp:RequiredFieldValidator>
                                                                     
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
                                                                    Gender <span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:DropDownList ID="ddl_gender" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300">                                                                     
                                                                    <asp:listitem text="Male" value="Male"></asp:listitem>
                                                                    <asp:listitem text="Female" value="Female"></asp:listitem>
                                                                    </asp:DropDownList>
                                                                 
                                                                     
                                                                     
                                                                 </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Age<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:Textbox ID="txt_age" runat="server" MaxLength="10" class="form-control" BorderColor="#0000CC" ForeColor="#663300"> </asp:Textbox>  
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Age" ControlToValidate="txt_age" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Your Age"></asp:RequiredFieldValidator>
                                                                     
                                                                 </div>

                                                                
                                                                <div class="col-md-3">

                                                                <label>
                                                                    Occupation<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:Textbox ID="txt_occ" runat="server"  class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:Textbox>      
                                                                    
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Occuption" ControlToValidate="txt_occ" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Your Occuption"></asp:RequiredFieldValidator>
                                                                 </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Department<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:Textbox ID="txt_Dep" runat="server"  class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:Textbox>    
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Department" ControlToValidate="txt_Dep" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Your Department"></asp:RequiredFieldValidator>
                                                                 </div>

                                                                     </div>
                                                                <div class="row">
                                                                 <div class="col-md-3">

                                                                <label>
                                                                   Year of completion of course<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                      <asp:TextBox ID="txtayear" runat="server" MaxLength="10" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                                                                     <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" ValidChars="0987654321" TargetControlID="txtayear"></asp:FilteredTextBoxExtender>                                                                     
                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Academic Year" ControlToValidate="txtayear" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Your Academic Year"></asp:RequiredFieldValidator>
                                                                     
                                                                     

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
                                                            <div class="col-md-6">

                                                                <label>01. मैं शासकीय शास. वि. या. ता. स्नातकोत्तर स्वशासी महाविद्यालय, दुर्ग के विद्यार्थी होने पर गर्व अनुभव करता हूं। / I feel proud to be the student of Govt. V.Y.T.PG Autonomous College Durg.
                                                                    <span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                              
                                                                     <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                    <asp:DropDownList ID="Q1" runat="server" Width="200" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:DropDownList>
														        
                                                                 </div>
                                                            <div class="col-md-6">
                                                                <label>02. महाविद्यालय में प्राप्त प्रशिक्षण मेरे कैरियर निर्माण में उपयोगी है। / The learning I had in the College is useful in my career.<span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q2" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                </asp:DropDownList>
														        
                                                             </div>

                                                                 </div>
                                                          

                                                        <div class="row">
                                                            &nbsp;
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label>03. विगत वर्षों में महाविद्यालय में हुए विकास प्रशंसनीय है। / The developments in the college in recent years are appreciative.<span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q3" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                            <div class="col-md-6">
                                                                <label>04. महाविद्यालय में आरंभ किए गए नये पाठ्यक्रम वर्तमान समय की आवश्यकता के अनुरूप है। / The new courses introduced meet contemporary requirements. <span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>

                                                                <asp:DropDownList ID="Q4" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                         </div>
                                                            
                                                             
                                                                <div class="row">
                                                                &nbsp;
                                                                 </div> 
                                                            
                                                        
                                                             <div class="row">
                                                                 <div class="col-md-6">
                                                                <label>05. महाविद्यालय की गतिविधियांे में भूतपूर्व विद्यार्थियों को भी शामिल किया जाता है। / College is involving alumni in its activities.<span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q5" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                                 <div class="col-md-6">
                                                                <label>06. महाविद्यालय के अकादमिक स्तर को सुदृढ़ करने में भूतपूर्व विद्यार्थियों की अहम भूमिका है। / The alumni have a role to play in academically strengthening the college further. <span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q6" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                   
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                             </div>
                                                            
                                                        
                                                            
                                                         <div class="row">
                                                            &nbsp;
                                                        </div> 
                                                             <div class="row">
                                                            
                                                                      <div class="col-md-6">
                                                                <label>07. महाविद्यालय के वित्तीय संसाधनों को सुदृढ़ करने में भूतपूर्व विद्यार्थियों की अहम भूमिका है। / The alumni have a role to play in financially strengthening the college. <span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q7" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                                      <div class="col-md-6">
                                                                        <label>08. प्रत्येक विभाग में भूतपूर्व छात्रों के संगठन का गठन एक सही कदम है। / Formation of Department wise alumni associations is a step in the right direction. <span style="color:red;font-weight:600;">*</span></label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q8" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                             </div>
                                                            
                                                         
                                                            
                                                         <div class="row">
                                                            &nbsp;
                                                        </div> 
                                                            <div class="row">                                                            
                                                             <div class="col-md-6">
                                                                <label>09. प्रत्येक विभाग में विभागीय प्रशासन को भूतपूर्व छात्रों के संगठन को मजबूत करने तथा दक्ष बनाने में सकारात्मक आरंभिक प्रयास करना चाहिए। / The Department administration should take initiative to efficiently enroll and strengthen the alumni association.<span style="color:red;font-weight:600;">*</span></label><br />
                                                                 <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                <asp:DropDownList ID="Q9" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                    
                                                                </asp:DropDownList>
														        
                                                             </div>
                                                             <div class="col-md-6">

                                                                      <label> भविष्य में महाविद्यालय विकास हेतु आपके बहुमूल्य सुझाव / Your valuable suggestions for further improvement of the College : </label><br />
                                                                      <asp:Textbox rows="5" class="form-control" BorderColor="#0000CC" ForeColor="#663300"  columns="70" TextMode="multiline" runat="server" ID="txtmsg" ></asp:Textbox>

                                                             </div>
                                                                </div>
                                                            
                                                         
                                        
                                                                    <div class="row">
                                                                        &nbsp;
                                                                </div>


                                                             <div class="row">
                                                             
                                                                 <div class="col-md-2">

                                                                <label>
                                                                  Thank You for Feedback……..!! 

                                                                </label>
                                                                     </div>


                                                                 <div class="col-md-2">
                                                                        
                                                                        <asp:Button ID="btn_Save" runat="server" Text="Submit" Class="btn btn-success" OnClick="btn_Save_Click" ValidationGroup="g1" />
                                                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                                                        <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>

                                                                     </div>
                                                                 </div>

                                                                 

                                                                 <div class="row">
                                                                        &nbsp;
                                                                </div>

                                                                 
                                                                 </div>
                                                          
                        </div>
                             </div>                          
                                               
                           </div>

</asp:Content>

