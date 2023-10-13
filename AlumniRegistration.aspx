<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="AlumniRegistration.aspx.cs" Inherits="AlumniRegistration" ValidateRequest="false" Title="ALUMNIREGISTRATION" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
   <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Alumni Registrations</h1></div>
						</div>
					</div>
				</div>
                      
     <div  class="container">
                    <div class="row pb-40 pt-20">

                        <div class="col-md-12">
                        <div class="section-fullwidth">
                            
                            <div class="element-size-100">
                                    <div class="row">
                                    <div class="col-lg-12">
                                        
                                         <asp:Label ID="lbl_Id" runat="server" Font-Bold="True" Visible="false"></asp:Label>
                                    </div>
                                    </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Name&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_Name" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF" ></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Name" ControlToValidate="txt_Name" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Father Name&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_father" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Father Name" ControlToValidate="txt_father" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Passout Course&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:DropDownList ID="ddl_course" runat="server" ValidationGroup="g1" class="form-control md-static " width="90%" BorderColor="#0099FF" ForeColor="#333300">
                                            <asp:listitem text="B.A." value="B.A."></asp:listitem>
                                            <asp:listitem text="B.Com" value="B.Com"></asp:listitem>
                                            <asp:listitem text="B.Sc. (Bio)" value="B.Sc.(Bio)"></asp:listitem>
                                            <asp:listitem text="B.Sc. (Maths)" value="B.Sc. (Maths)"></asp:listitem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  InitialValue="0" ForeColor="Red" runat="server" ErrorMessage="Please Select Course" ControlToValidate="txt_Name" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Passout Year&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:DropDownList ID="ddl_passout_year" runat="server"  ValidationGroup="g1" class="form-control md-static " width="90%" BorderColor="#0099FF" ForeColor="#333300"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  InitialValue="0" ForeColor="Red" runat="server" ErrorMessage="Please Select Passout Year" ControlToValidate="ddl_passout_year" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Working Department&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_department" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Working Department" ControlToValidate="txt_department" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Working Designation&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_designation" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Designation" ControlToValidate="txt_designation" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Working Place&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_place" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Working Place" ControlToValidate="txt_place" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Mobile No.&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_mobile" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>      
                                          
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Mobile Number" ControlToValidate="txt_mobile" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Email Id&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_email" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Email Id" ControlToValidate="txt_email" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Full Address&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_address" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Address" ControlToValidate="txt_address" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Enter Your Passport Size Photo&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Button ID="btn_Save" ValidationGroup="g1" runat="server" Text="Submit Your Details" class="btn btn-success" onclick="btn_submit_Click"/> &nbsp; &nbsp;
                                    </div>
                                </div>
                                  <div class="row">
                                    <div class="col-lg-6">
                                        <asp:ValidationSummary runat="server" ValidationGroup="g1" ID="vls_msg" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                    </div>
                                </div>
                                              
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

</asp:content>
