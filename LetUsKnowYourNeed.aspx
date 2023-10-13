<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="LetUsKnowYourNeed.aspx.cs" Inherits="LetUsKnowYourNeed" ValidateRequest="false" Title="Let Us Know Your Need" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
   <div  class="main-content">
             <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Let Us Know Your Need</h1></div>
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
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Admission No.&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_admission" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Admission No." ControlToValidate="txt_admission" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Class&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:DropDownList ID="ddl_course" runat="server" ValidationGroup="g1" class="form-control md-static " width="90%" BorderColor="#0099FF" ForeColor="#333300">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" ForeColor="Red" runat="server" ErrorMessage="Please Select Course" ControlToValidate="ddl_course" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Tell us about yourself  : Type of disability&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_disability" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="Please Tell us about yourself  : Type of disability" ControlToValidate="txt_disability" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Percentage of disability&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_percentage" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Please Enter Percentage of disability" ControlToValidate="txt_percentage" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Let us know, How can we help You&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_howhelp" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Please Let us know, How can we help You" ControlToValidate="txt_howhelp" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    
                                   <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Mobile No.&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_mobile" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>      
                                          
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Mobile Number" ControlToValidate="txt_mobile" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">Email Id&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:TextBox ID="txt_email" runat="server" class="form-control md-static " width="90%" BorderColor="#0099FF"></asp:TextBox>            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Email Id" ControlToValidate="txt_email" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span class="text-danger" style="font-weight:600;color:#0789b7;">How would you like to be contacted&nbsp;<span style="color:red;font-weight:600;">*</span></span><br />
                                        <asp:DropDownList ID="ddl_tobecontacted" runat="server" ValidationGroup="g1" class="form-control md-static " width="90%" BorderColor="#0099FF" ForeColor="#333300">
                                            <asp:listitem text="By Voice Call" value="By Voice Call"></asp:listitem>
                                            <asp:listitem text="By Whatsapp" value="By Whatsapp"></asp:listitem>
                                            <asp:listitem text="By Email" value="By Email"></asp:listitem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  InitialValue="0" ForeColor="Red" runat="server" ErrorMessage="Please Let Us Know How would you like to be contacted" ControlToValidate="ddl_tobecontacted" ValidationGroup="g1" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
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
