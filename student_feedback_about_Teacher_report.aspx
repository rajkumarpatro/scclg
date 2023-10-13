<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="student_feedback_about_Teacher_report.aspx.cs" Inherits="student_feedback_about_Teacher_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Feedback from Students About Teacher Report </h1></div>
						</div>
					</div>
				</div>
                      
     <div  class="container">
                    <div class="row">
                        <div class="col-md-12">
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
                                                                            Sem
                                                                        </label><br />
                                                                        <asp:Button ID="btn_show" runat="server" Text="Show" validationgroup="g1" class="btn btn-success" OnClick="btn_show_Click"/> 

                                                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                                                        <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                                                        <asp:Label ID="lblInfo" runat="server" Text="lbl_msg" Visible="False"></asp:Label>
                                                                    
                                                                     </div>
                                                                </div>

                                                     <div class="row">
                                                            <div class="col-md-12">

                                                                <label>01. अध्यापन शैली एवं विषय में दक्षता/पढ़ाने का तरीका एवं विषय का ज्ञान</label>
                                                              
                                                                    
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
                                                                   Thoroughly/पूर्ण रूप से<br />
                                                                    <asp:Label ID="lbl_q1_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Satisfactorily संतोषजनक<br />
                                                                    <asp:Label ID="lbl_q1_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Poorly/अपर्याप्त<br />
                                                                    <asp:Label ID="lbl_q1_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   Indifferently/उदासीन<br />
                                                                    <asp:Label ID="lbl_q1_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q1_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />

                                                            <div class="row">
                                                            <div class="col-md-12">
                                                                <label>02.  कक्षा में नियमितता एवं समयबद्धता</label>
                                                                
														        
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
                                                                   More than adequate/बहुत पर्याप्त<br />
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
                                                                   Very poor/बहुत कम<br />
                                                                    <asp:Label ID="lbl_q2_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q2_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <label>03. विद्यार्थियों के प्रष्नों के उत्तर देने में कुषलता तथा संवाद</label>
                                                                 
														        
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
                                                                   Regular &amp; timely/नियमित एवं समय में<br />
                                                                    <asp:Label ID="lbl_q3_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Usfull remarks/उपयोगी टिप्पणी<br />
                                                                    <asp:Label ID="lbl_q3_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Some times late/अक्सर देर से<br />
                                                                    <asp:Label ID="lbl_q3_ns_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_ns_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ff6a00;">
                                                                   With ought any remarks/बिना किसी टिप्पणी के<br />
                                                                    <asp:Label ID="lbl_q3_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q3_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />
                                                             <div class="row">
                                                            <div class="col-md-12">
                                                                <label>04. विद्यार्थियों से कक्षा में व्यवहार</label>
                                                                
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
                                                                  Always courteous/सदैव विनीत<br />
                                                                    <asp:Label ID="lbl_q4_sa_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_sa_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                     

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#56ce49;">
                                                                   Sometimes rude/कभी-कभी कठोर<br />
                                                                    <asp:Label ID="lbl_q4_a_pr" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q4_a_vot" runat="server" ></asp:Label>
                                                                </label>

                                                                        </div>
                                                                       <div class="col-md-2">

                                                                <label style="color:#ffd800;">
                                                                   Always indifferent/हमेशा उदासीन<br />
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
                                                                <label>05. पाठ्यक्रम पूर्ण करने में सक्षमता</label>
                                                                
														        
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
                                                                   More than adequate/बहुत पर्याप्त<br />
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
                                                                   Very poor/बहुत कम<br />
                                                                    <asp:Label ID="lbl_q5_d_per" runat="server" ></asp:Label>
                                                                    <br />
                                                                       <asp:Label ID="lbl_q5_d_vot" runat="server" ></asp:Label>
                                                                </label>
                                                                          
                                                                        </div>
                                                                       
                                                                    </div>
                                                                    <hr />



                            </div>
                        </div>
         </div>
        </div>
    

</asp:Content>

