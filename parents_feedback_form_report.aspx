<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="parents_feedback_form_report.aspx.cs" Inherits="parents_feedback_form_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Parent Feedback form Report </h1></div>
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
                                                                        <asp:ListItem Value="UG" >UG</asp:ListItem>
                                                                        <asp:ListItem Value="PG" >PG</asp:ListItem>
                                                                    </asp:DropDownList> 

                                                                     </div>
                                                                  
                                                                 <div class="col-md-2">

                                                                <label>
                                                                    Course<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                    <asp:DropDownList ID="ddl_admissionclass" runat="server"  height="40">
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
                                                                    Click Here
                                                                </label><br />
                                                                        <asp:Button ID="btn_show" runat="server" Text="Show" validationgroup="g1" class="btn btn-success" OnClick="btn_show_Click"/> 

                                                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                                                        <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                                                        <asp:Label ID="lblInfo" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                                                    
                                                                     </div>
                                                                </div>

                                                     <div class="row">

                                                         <div class="col-md-12">
                                                                <label>01. अध्ययन अध्यापन का वातावरण</label>
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
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q1_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q1_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Challenging/चुनौती पूर्ण<br />
                                                                    <asp:Label ID="lbl_q1_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Dull/अरुचिपूर्ण<br />
                                                                    <asp:Label ID="lbl_q1_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                                
														        
                                                            
                                                            <div class="row">
                                                            <div class="col-md-12">
                                                                <label>02. पाल्य की प्रगति का स्तर</label>
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
                                                                   More than adequate&nbsp;(पर्याप्त से अधिक)<br />
                                                                    <asp:Label ID="lbl_q2_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q2_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                  Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q2_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Can not say/कह नहीं सकते<br />
                                                                    <asp:Label ID="lbl_q2_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <label>03. शैक्षणेत्तर गतिविधियों की व्यवस्था का स्तर</label>
                                                                 
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
                                                                   More than adequate&nbsp;(पर्याप्त से अधिक)<br />
                                                                    <asp:Label ID="lbl_q3_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q3_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                  Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q3_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Can not say/कह नहीं सकते<br />
                                                                    <asp:Label ID="lbl_q3_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                            <div class="row">
                                                            <div class="col-md-12">
                                                                <label>04. शैक्षणेत्तर गतिविधियों की व्यवस्था का स्तर</label>
                                                                 
														        
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
                                                                   More than adequate&nbsp;(पर्याप्त से अधिक)<br />
                                                                    <asp:Label ID="lbl_q4_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q4_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q4_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Can not say/कह नहीं सकते<br />
                                                                    <asp:Label ID="lbl_q4_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                            
                                                        
                                                            <div class="row">
                                                             <div class="col-md-12">
                                                                <label>05. परीक्षा परिणाम</label>
                                                                
														        
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
                                                                   More than adequate&nbsp;(पर्याप्त से अधिक)<br />
                                                                    <asp:Label ID="lbl_q5_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q5_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q5_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Can not say/कह नहीं सकते<br />
                                                                    <asp:Label ID="lbl_q5_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                         <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>06. शिक्षकों का व्यवहार</label>
                                                                
														        
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
                                                                   Always effective/हमेशा प्रभावशाली<br />
                                                                    <asp:Label ID="lbl_q6_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Sometimes effective/कभी-कभी प्रभावशाली<br />
                                                                    <asp:Label ID="lbl_q6_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Just satisfactorily/संतोषजनक<br />
                                                                    <asp:Label ID="lbl_q6_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Generally ineffective/सामान्य अप्रभावशाली<br />
                                                                    <asp:Label ID="lbl_q6_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q6_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                                <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>07. महा. के ग्रंथालय एवं अन्य सुविधाएं</label>
                                                                 
														        
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
                                                                   More than adequate&nbsp;(बहुत पर्याप्त)<br />
                                                                    <asp:Label ID="lbl_q7_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q7_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q7_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Very poor/बहुत कम<br />
                                                                    <asp:Label ID="lbl_q7_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q7_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                            <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>08. संस्था के शैक्षणिक वातावरण की समाज में छवि</label>
                                                                 
														        
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
                                                                   More than adequate&nbsp;(बहुत पर्याप्त)<br />
                                                                    <asp:Label ID="lbl_q8_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q8_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q8_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Very poor/बहुत कम<br />
                                                                    <asp:Label ID="lbl_q8_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q8_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                      
                                                                    </div>
                                                                    <hr />
                                                             <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>09. पाल्य के तकनीकि ज्ञान में वृद्धि का स्तर</label>
                                                                 
														        
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
                                                                   More than adequate&nbsp;(पर्याप्त से अधिक)<br />
                                                                    <asp:Label ID="lbl_q9_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q9_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q9_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Can not say/कह नहीं सकते<br />
                                                                    <asp:Label ID="lbl_q9_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q9_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                                <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>10. महाविद्यालय के खेल सुविधाएं</label>
                                                                 
														        
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
                                                                   More than adequate&nbsp;(बहुत पर्याप्त)<br />
                                                                    <asp:Label ID="lbl_q10_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q10_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q10_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q10_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q10_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q10_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Very poor/बहुत कम<br />
                                                                    <asp:Label ID="lbl_q10_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q10_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                                <div class="row">
                                                            
                                                             <div class="col-md-12">
                                                                <label>11. मूल्यपरक षिक्षा की स्थिति</label>
                                                                 
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
                                                                   More than adequate&nbsp;(बहुत पर्याप्त)<br />
                                                                    <asp:Label ID="lbl_q11_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q11_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Adequate/पर्याप्त<br />
                                                                    <asp:Label ID="lbl_q11_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q11_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Inadequate/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q11_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q11_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Very poor/बहुत कम<br />
                                                                    <asp:Label ID="lbl_q11_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q11_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                     
                                                                    </div>
                                                                    <hr />


                                                         </div>
                            

                            </div>
                        </div>
         </div>
        
    
</asp:Content>

