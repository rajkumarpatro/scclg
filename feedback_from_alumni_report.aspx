<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="feedback_from_alumni_report.aspx.cs" Inherits="feedback_from_alumni_report" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Alumni Feedback form Report<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager> </h1></div>
						</div>
					</div>
				</div>
                      
     <div  class="container">
                    <div class="row">

                        <div class="col-md-12">
                            <div>&nbsp;</div>
                            <div class="row">
                                <div class="col-md-8">
                                    
                                     <asp:Button ID="Button1" runat="server" Text="Back" Class="btn btn-success" OnClick="btn_report_menu_Click"  />
                                 </div>
                                 <div class="col-md-4">
                                    <asp:Button ID="Button3" runat="server" Text="Go to Control Panel" Class="btn btn-success" OnClick="btn_main_menu_Click" />
                                </div>
                                </div>
                                                    <div class="row">
                                                            

                                                                <div class="col-md-2">

                                                                <label>
                                                                    Academic Year<span style="color:red;font-weight:600;">*</span>
                                                                </label>
                                                                      <asp:DropDownList ID="Y_option" runat="server" class="form-control md-static text-capitalize" width="80%">
                                                                          
                                                                          <asp:listitem text="2019-20" value="2019-20"></asp:listitem>
                                                                      </asp:DropDownList>
                                                                        
                                                                     </div>

                                                                <div class="col-md-2">

                                                                <label>
                                                                    Level<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                   <asp:DropDownList ID="ddl_admissionclasstype" runat="server" Width="100" height="40" OnSelectedIndexChanged="ddl_admissionclasstype_SelectedIndexChanged" AutoPostBack="True">
                                                                       <asp:listitem text="Select" value="0"></asp:listitem> 
                                                                       <asp:ListItem Value="UG" >UG</asp:ListItem>
                                                                        <asp:ListItem Value="PG" >PG</asp:ListItem>
                                                                    </asp:DropDownList> 

                                                                     </div>
                                                                  
                                                                 <div class="col-md-2">

                                                                <label>
                                                                    Course<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:DropDownList ID="ddl_admissionclass" runat="server" Width="200" height="40">
                                                                    </asp:DropDownList>
                                                                   </div>

                                                                <div class="col-md-2">

                                                                <label>
                                                                    Sem<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:DropDownList ID="ddl_part" runat="server" Width="100" height="40">
                                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                     </div>

                                                       
                                                        
                                                                <div class="col-md-2">
                                                                      <label>
                                                                            Click Here<span style="color:red;font-weight:600;">*</span>
                                                                        </label><br />
                                                                        <asp:Button ID="btn_show" runat="server" Text="Show" validationgroup="g1" class="btn btn-success" OnClick="btn_show_Click"/> 

                                                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                                                        <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                                                        <asp:Label ID="lblInfo" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                                                    
                                                                     </div>
                                                                </div>

                                                     <div class="row">

                                                         <div class="col-md-12">

                                                                <label>01. मैं शासकीय शास. वि. या. ता. स्नातकोत्तर स्वशासी महाविद्यालय, दुर्ग के विद्यार्थी होने पर गर्व अनुभव करता हूं। / I feel proud to be the student of Govt. V.Y.T.PG Autonomous College Durg.
                                                                    <span style="color:red;font-weight:600;">*</span>
                                                                </label>
                                                              </div>
                                                                 </div>
                                                              <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q1_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q1_a_pr" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q1_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_ns_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q1_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_d_vot" runat="server"></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q1_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_sd_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />

                                                            <div class="row">
                                                            <div class="col-md-12">
                                                                <label>02. महाविद्यालय में प्राप्त प्रशिक्षण मेरे कैरियर निर्माण में उपयोगी है। / The learning I had in the College is useful in my career.<span style="color:red;font-weight:600;">*</span></label>
                                                                
                                                             </div>

                                                        </div>

                                                        <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q2_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q2_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_a_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q2_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q2_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q2_sd_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_sd_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <label>03. विगत वर्षों में महाविद्यालय में हुए विकास प्रशंसनीय है। / The developments in the college in recent years are appreciative.<span style="color:red;font-weight:600;">*</span></label>
                                                                 
														        
                                                             </div>
                                                            </div>
                                                            <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q3_sa_pr" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_sa_vot" runat="server"></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q3_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q3_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q3_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q3_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_sd_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />
                                                             <div class="row">
                                                            <div class="col-md-12">
                                                                <label>04. महाविद्यालय में आरंभ किए गए नये पाठ्यक्रम वर्तमान समय की आवश्यकता के अनुरूप है। / The new courses introduced meet contemporary requirements.<span style="color:red;font-weight:600;">*</span></label>
                                                                 
														        
                                                             </div>
                                                                 </div>
                                                             
                                                                <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q4_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q4_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q4_ns_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q4_d_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q4_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_sd_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />
                                                            
                                                        
                                                             <div class="row">
                                                             <div class="col-md-12">
                                                                <label>05. महाविद्यालय की गतिविधियांे में भूतपूर्व विद्यार्थियों को भी शामिल किया जाता है। / College is involving alumni in its activities.<span style="color:red;font-weight:600;">*</span></label>
                                                               </div>
                                                                </div>
                                                            
                                                           <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q5_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q5_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q5_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q5_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_d_vot" runat="server"></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q5_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_sd_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />
                                                         <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>06. महाविद्यालय के अकादमिक स्तर को सुदृढ़ करने में भूतपूर्व विद्यार्थियों की अहम भूमिका है। / The alumni have a role to play in academically strengthening the college further.<span style="color:red;font-weight:600;">*</span></label>
                                                                
														        
                                                             </div>
                                                                </div>
                                                            
                                                      <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q6_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q6_a_pr" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q6_ns_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_ns_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q6_d_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q6_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_sd_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />
                                                             <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>07. महाविद्यालय के वित्तीय संसाधनों को सुदृढ़ करने में भूतपूर्व विद्यार्थियों की अहम भूमिका है। / The alumni have a role to play in financially strengthening the college.<span style="color:red;font-weight:600;">*</span></label>
                                                                
														        
                                                             </div>
                                                                </div>
                                                            
                                                         <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q7_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q7_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q7_ns_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_ns_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q7_d_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_d_vot" runat="server" Text="lbl_vot"></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q7_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_sd_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />
                                                            <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>08. प्रत्येक विभाग में भूतपूर्व छात्रों के संगठन का गठन एक सही कदम है। / Formation of Department wise alumni associations is a step in the right direction.<span style="color:red;font-weight:600;">*</span></label>
                                                                 
														        
                                                             </div>
                                                                </div>
                                                            
                                                         <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q8_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q8_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q8_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_ns_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q8_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_d_vot" runat="server"></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q8_sd_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_sd_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />
                                                            <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>09. प्रत्येक विभाग में विभागीय प्रशासन को भूतपूर्व छात्रों के संगठन को मजबूत करने तथा दक्ष बनाने में सकारात्मक आरंभिक प्रयास करना चाहिए। / The Department administration should take initiative to efficiently enroll and strengthen the alumni association.<span style="color:red;font-weight:600;">*</span></label>
                                                               
														        
                                                             </div>
                                                                </div>
                                                            
                                                              
                                                          <div class="row">
                                                                    <div class="col-md-2">

                                                                <label>
                                                                    Options<br />
                                                                   Votes in (%)<br />
                                                                    No. of Votes
                                                                </label>
                                                                       


                                                                        </div>
                                                                 <div class="col-md-2">

                                                                <label style="color:#0c7a00;">
                                                                   Strongly Agree<br />
                                                                    <asp:Label ID="lbl_q9_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Agree<br />
                                                                    <asp:Label ID="lbl_q9_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Not Sure<br />
                                                                    <asp:Label ID="lbl_q9_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_ns_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Disagree<br />
                                                                    <asp:Label ID="lbl_q9_d_per" runat="server"></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff0000;">
                                                                   Strongly Disagree<br />
                                                                    <asp:Label ID="lbl_q9_sd_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_sd_vot" runat="server"></asp:Label>
                                                                </label>

                                                                        </div>
                                                                    </div>
                                                                    <hr />

                                                         </div>
                            </div>
                        </div>
         </div>
          
    

</asp:Content>

