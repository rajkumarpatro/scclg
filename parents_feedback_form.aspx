<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="parents_feedback_form.aspx.cs" Inherits="parents_feedback_form" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Feedback from Parents<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>  </h1></div>
						</div>
					</div>
				</div>
                     

                          
                            <div  class="container">
                    <div class="row">
                                
                                    <div class="col-md-12">
                                        <div>&nbsp;</div>
                                       <div class="row">
                                                            <div class="col-md-3">

                                                                <label>
                                                                    Name of the parent<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                <asp:TextBox ID="txtpname" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>                                                                
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Please enter your name" ControlToValidate="txtpname" ValidationGroup="g1" Display="Dynamic" Text="Please enter your name"></asp:RequiredFieldValidator>

                                                                </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                    Student Name<span style="color:red;font-weight:600;">*</span>
                                                                </label><br />
                                                                      <asp:TextBox ID="txtsname" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>                                                                     
                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please enter Student name" ControlToValidate="txtcno" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Student name"></asp:RequiredFieldValidator>
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
                                                                   Academic Year <span style="color:red;font-weight:600;">*</span>

                                                                </label><br />
                                                                     <asp:DropDownList ID="Y_option" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300">
                                                                          <asp:ListItem Value="">Please Select</asp:ListItem>  
                                                                          <asp:listitem text="2019-20" value="2019-20"></asp:listitem>
                                                                      </asp:DropDownList>                                                                      
                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Please enter Academic Year" ControlToValidate="txtcno" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Academic Year"></asp:RequiredFieldValidator>
                                                                 </div>

                                                                 <div class="col-md-3">

                                                                <label>
                                                                   Contact Number <span style="color:red;font-weight:600;">*</span>

                                                                </label><br />
                                                                      <asp:TextBox ID="txtcno" runat="server" MaxLength="10" class="form-control" BorderColor="#0000CC" ForeColor="#663300"></asp:TextBox>
                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Contact Number" ControlToValidate="txtcno" ValidationGroup="g1" Display="Dynamic" Text="Please Enter Your Contact Number"></asp:RequiredFieldValidator>
                                                                      <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" ValidChars="0987654321" TargetControlID="txtcno"></asp:FilteredTextBoxExtender>
                                                                 </div>
                                                                 </div>
                                                             <div class="row">
                                                                    <div class="col-md-3">

                                                                        <label>01. अध्ययन अध्यापन का वातावरण</label><br />
                                                                        <span style="color:red;font-weight:600;">Choose Your Option*</span>

                                                                        <asp:DropDownList ID="Q1" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                            <asp:ListItem Value="4">Adequate/पर्याप्त</asp:ListItem>
                                                                            <asp:ListItem Value="3">Inadequate/अपर्याप्त</asp:ListItem>
                                                                            <asp:ListItem Value="2">Challenging/चुनौती पूर्ण</asp:ListItem>
                                                                            <asp:ListItem Value="1">Dull/अरुचिपूर्ण</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                    <div class="col-md-3">
                                                                        <label>02. पाल्य की प्रगति का स्तर</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q2" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                             <asp:ListItem value="4">More than adequate&nbsp;(पर्याप्त से अधिक) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1"> Can not say/कह नहीं सकते</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                    <div class="col-md-3">
                                                                        <label>03. शैक्षणेत्तर गतिविधियों की व्यवस्था का स्तर</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q3" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                             <asp:ListItem value="4">More than adequate&nbsp;(पर्याप्त से अधिक) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1"> Can not say/कह नहीं सकते</asp:ListItem>
                                                                        </asp:DropDownList>
														                </div>
                                                                    <div class="col-md-3">
                                                                        <label>04. शैक्षणेत्तर गतिविधियों की व्यवस्था का स्तर</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>

                                                                        <asp:DropDownList ID="Q4" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                             <asp:ListItem value="4">More than adequate&nbsp;(पर्याप्त से अधिक) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1"> Can not say/कह नहीं सकते</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                              </div>
                                                             <div class="row">
                                                            &nbsp;
                                                              </div>
                                                         
                                                            
                                                        
                                                            <div class="row">
                                                                     <div class="col-md-3">
                                                                        <label>05. परीक्षा परिणाम</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q5" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                             <asp:ListItem value="4">More than adequate&nbsp;(पर्याप्त से अधिक) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1"> Can not say/कह नहीं सकते</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                      <div class="col-md-3">
                                                                        <label>06. शिक्षकों का व्यवहार</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q6" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                           <asp:ListItem value="4">Always effective/हमेशा प्रभावशाली</asp:ListItem>
	                                                                        <asp:ListItem value="3">Sometimes effective/कभी-कभी प्रभावशाली</asp:ListItem>
	                                                                        <asp:ListItem value="2">Just satisfactorily/संतोषजनक</asp:ListItem>
	                                                                        <asp:ListItem value="1">Generally ineffective/सामान्य अप्रभावशाली</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                     <div class="col-md-3">
                                                                        <label>07. महा. के ग्रंथालय एवं अन्य सुविधाएं</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q7" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                           <asp:ListItem value="4">More than adequate&nbsp;(बहुत पर्याप्त) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1">Very poor/बहुत कम</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                     <div class="col-md-3">
                                                                        <label>08. संस्था के शैक्षणिक वातावरण की समाज में छवि</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q8" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" >
                                                                            <asp:ListItem value="4">More than adequate&nbsp;(बहुत पर्याप्त) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1">Very poor/बहुत कम</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                             </div>
                                                      
                                                         <div class="row">
                                                            &nbsp;
                                                        </div> 
                                                        
                                                             <div class="row">
                                                            
                                                                     <div class="col-md-3">
                                                                        <label>09. पाल्य के तकनीकि ज्ञान में वृद्धि का स्तर</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q9" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                            <asp:ListItem value="4">More than adequate&nbsp;(पर्याप्त से अधिक) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1"> Can not say/कह नहीं सकते</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                     <div class="col-md-3">
                                                                        <label>10. महाविद्यालय के खेल सुविधाएं</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q10" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                             <asp:ListItem value="4">More than adequate&nbsp;(बहुत पर्याप्त) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1">Very poor/बहुत कम</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                     <div class="col-md-3">
                                                                        <label>11. मूल्यपरक षिक्षा की स्थिति</label><br />
                                                                         <span style="color:red;font-weight:600;">Choose Your Option*</span>
                                                                        <asp:DropDownList ID="Q11" runat="server" class="form-control" BorderColor="#0000CC" ForeColor="#663300" Width="200">
                                                                             <asp:ListItem value="4">More than adequate&nbsp;(बहुत पर्याप्त) </asp:ListItem>
	                                                                        <asp:ListItem value="3">Adequate/पर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="2">Inadequate/अपर्याप्त</asp:ListItem>
	                                                                        <asp:ListItem value="1">Very poor/बहुत कम</asp:ListItem>
                                                                        </asp:DropDownList>
														        
                                                                     </div>
                                                                     <div class="col-md-3">

                                                                      <label> Suggestions if any / यदि कोई हो तो सुझाव दें</label><br />
                                                                     
                                                                     <asp:Textbox rows="5" class="form-control" BorderColor="#0000CC" ForeColor="#663300" TextMode="multiline" runat="server" ID="txtmsg" >

                                                                     </asp:Textbox>

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

                                                                        <asp:Button ID="btn_Save" runat="server" Text="Submit" class="btn btn-success" ValidationGroup="g1" OnClick="btn_Save_Click1"/> 

                                                                        <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>

                                                                        <asp:Label ID="lbl_msg" runat="server" Text="lbl_msg" Visible="False"></asp:Label>

                                                                     </div>
                                                                 </div>
                                                                    
                                                                <div class="row">
                                                                        &nbsp;
                                                                </div>

                                                                 </div>
                                                                  <div class="row">
                                                                
                                                                 <asp:GridView ID="p_feedback" runat="server"  BackColor="White" BorderColor="#3366CC" DataKeyNames="FEEDBACK_ID" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" AutoGenerateColumns="False" Width="1460px" visible="false"  >
                                                                     <Columns>
                                                                        <asp:TemplateField HeaderText="Sn">
                                                                            <ItemTemplate>
                                                                                <%# Container.DataItemIndex + 1 %>
                                                                            </ItemTemplate>
                                                                           <HeaderStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="FEEDBACK_ID" HeaderText="FEEDBACK_ID" Visible="False" />
                                                                        <asp:BoundField DataField="PARENTS_NAME" HeaderText="PARENTS NAME" />
                                                                        <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT" />
                                                                        <asp:BoundField DataField="CLASS" HeaderText="CLASS" />
                                                                        <asp:BoundField DataField="ACADEMIC_YEAR" HeaderText="ACADEMIC YEAR" />
                                                                        <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT NO" />
                                                                        <asp:BoundField DataField="MESSAGE" HeaderText="MESSAGE" />
                                                                        <asp:BoundField DataField="Q_1" HeaderText="Q_1" />
                                                                        <asp:BoundField DataField="Q_2" HeaderText="Q_2" />
                                                                        <asp:BoundField DataField="Q_3" HeaderText="Q_3" />
                                                                        <asp:BoundField DataField="Q_4" HeaderText="Q_4" />
                                                                        <asp:BoundField DataField="Q_5" HeaderText="Q_5" />
                                                                        <asp:BoundField DataField="Q_6" HeaderText="Q_6" />
                                                                        <asp:BoundField DataField="Q_7" HeaderText="Q_7" />
                                                                        <asp:BoundField DataField="Q_8" HeaderText="Q_8" />
                                                                        <asp:BoundField DataField="Q_9" HeaderText="Q_9" />
                                                                        <asp:BoundField DataField="Q_10" HeaderText="Q_10" />
                                                                        <asp:BoundField DataField="Q_11" HeaderText="Q_11" />
                                                                      
                                                                         
                                                                         <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgbtn_delete" runat="server" 
                                                                                    ImageUrl="~/Images/delete.png"  
                                                                                    OnClientClick="return confirm('Do you want to delete Parents Feedback Details? ');" OnClick="imgbtn_delete_Click1" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>     
                                                                       
                                                                        
                                                                     </Columns>
                                                                     <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                                                     <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                                                     <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                                                     <RowStyle BackColor="White" ForeColor="#003399" />
                                                                     <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                                    </asp:GridView>

                                                                    </div>
                                                                      </div>
                                </div>
                                                           
                                                     
                           
                             

                            
                                        

                            

                         
                </div>
</asp:Content>

