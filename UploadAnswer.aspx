<%@ Page Title="Upload Online Exam Answer- Science College Durg " Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="UploadAnswer.aspx.cs" Inherits="UploadAnswer" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <%
        sql_operations op = new sql_operations();
        UIHelper uiHelper = new UIHelper();
    %>
    <div class="wrap-title-page">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="ui-title-page">Upload Online Exam Answer</h1>
                </div>
            </div>
        </div>
        <!-- end container-->
    </div>
    <!-- end wrap-title-page -->







    <section class="rtd " style="padding-top: 20px;">
        <div class="container">
            <div class="section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-block">
                                <div class="md-card-block">

                                    <div class="row">
                                        <div class="col-sm-12 col-xs-12 col-md-12">
                                            <div class="text-danger">
                                                Note :- 
                                                    <ol>
                                                        <li>केवल पी.डी.ऍफ़. फाइल अपलोड करें | </li>
                                                        <li>आप 1 पेपर के लिए केवल 1 पी.डी.ऍफ़. फाइल अपलोड करें | </li>
                                                        <li>अपलोड करने से पहले विषयवार सभी पेज को 1 पी.डी.ऍफ़. फाइल में Merge कर लें| </li>
                                                        <li>केवल अपना या अपने परिचित का मोबाइल नंबर डालें, जिससे कि आपके द्वारा अपलोड किया गया फाइल त्रुटिपूर्ण हो अथवा Corrupted फाइल होने पर आपको सूचित किया जा सके | </li>
                                                        <li>पी.डी.ऍफ़. फाइल अपलोड करने से पहले Compress अवश्य कर लें, जिससे आपकी फाइल आसानी से अपलोड हो जाये| </li>
                                                        <li>Compress करने के लिए <a href="https://pdfcompressor.com/" target="_blank" style="color: blue;">https://pdfcompressor.com/</a> यहाँ क्लिक करें| </li>
                                                        <li>उत्तर पुस्तिका का मुख्य पृष्ठ दिए गए लिंक से डाउनलोड करें <a href="https://govtsciencecollegedurg.ac.in/newsData/294.pdf" target="_blank" style="color: blue;">Click here to download</a></li>
                                                    </ol>
                                            </div>
                                        </div>
                                        <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                        </ajaxtoolkit:ToolkitScriptManager>
                                    </div>
                                    <div class="row">
                                        &nbsp;
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-2 col-xs-6 col-md-2">
                                            <div class="md-input-wrapper">
                                                <label>कक्षा का स्तर <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddl_admissionclasstype" runat="server" class="form-control" OnSelectedIndexChanged="ddl_admissionclasstype_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Value="UG">UG</asp:ListItem>
                                                    <asp:ListItem Value="PG">PG</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-6 col-md-2">
                                            <div class="md-input-wrapper">
                                                <asp:Label runat="server" ID="lbl_user" ForeColor="Maroon" Visible="false"></asp:Label>
                                                <label>कक्षा <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddl_admissionclass" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_admissionclass_SelectedIndexChanged" ForeColor="#0099FF"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage=" कक्षा  चुनिये" ControlToValidate="ddl_admissionclass" ValidationGroup="g1" Display="Dynamic" Text="कक्षा  चुनिये" InitialValue="0"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-6 col-md-2">
                                            <div class="md-input-wrapper">
                                                <label>
                                                    <asp:Label ID="lbl_yearsem" runat="server"></asp:Label><span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddl_part" runat="server" class="form-control" ForeColor="#0099FF" AutoPostBack="True" OnSelectedIndexChanged="ddl_part_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="कृपया वर्ष चुनिये" ControlToValidate="ddl_part" ValidationGroup="g1" Display="Dynamic" Text="कृपया वर्ष  चुनिये" InitialValue="0"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-6 col-md-3">
                                            <div class="md-input-wrapper">
                                                <label>विषय चुने <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddl_subject" runat="server" class="form-control" ForeColor="#0099FF"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="कृपया विषय चुनिये" ControlToValidate="ddl_subject" ValidationGroup="g1" Display="Dynamic" Text="कृपया विषय चुनिये" InitialValue="0"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-6 col-md-3">
                                            <div class="md-input-wrapper">
                                                <label>पेपर का नाम<span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddl_paper" runat="server" class="form-control">
                                                    <asp:ListItem Value="Paper1">Paper1</asp:ListItem>
                                                    <asp:ListItem Value="Paper2">Paper2</asp:ListItem>
                                                    <asp:ListItem Value="Paper3">Paper3</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-sm-2 col-xs-6 col-md-3">
                                            <div class="md-input-wrapper">
                                                <label>रोल नंबर<span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control  " BorderColor="#0066CC" ID="txt_rollno" runat="server" ValidationGroup="g1"></asp:TextBox>
                                                <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txt_rollno" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"></ajaxtoolkit:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="कृपया रोल नंबर प्रविष्ट करे" ControlToValidate="txt_rollno" ValidationGroup="g1" Display="Dynamic" Text="कृपया रोल नंबर प्रविष्ट करे"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-6 col-md-3">
                                            <div class="md-input-wrapper">
                                                <label>10 अंको का मोबाइल नं.<span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control  " BorderColor="#0066CC" ID="txt_mobile" runat="server" ValidationGroup="g1"></asp:TextBox>
                                                <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txt_mobile" ValidChars="abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"></ajaxtoolkit:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="कृपया 10 अंको का मोबाइल नं. प्रविष्ट करे" ControlToValidate="txt_mobile" ValidationGroup="g1" Display="Dynamic" Text="कृपया 10 अंको का मोबाइल नं. प्रविष्ट करे"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="txt_mobile" ValidationGroup="g1" Display="Dynamic" ErrorMessage="केवल 10 अंको का मोबाइल नं. प्रविष्ट करे" Text="केवल 10 अंको का मोबाइल नं. प्रविष्ट करे" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-6 col-md-4">
                                            <div class="md-input-wrapper">
                                                <label>अपलोड असाइनमेंट  <span class="text-danger">*</span></label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                                <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
                                                <%--<asp:CheckBox ID="chk_not" runat="server" CssClass="checkbox-inline" Text="Photo Not Available" ForeColor="Red" />
                                               <asp:CheckBox ID="chk_new" runat="server" Text="असाइनमेंट " AutoPostBack="True" OnCheckedChanged="chk_new_CheckedChanged" />
                                               <asp:Image ID="img_logo" runat="server" Class="img-fluid" style="height: 200px;" />  --%>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="कृपया अपलोड असाइनमेंट  प्रविष्ट करे" ControlToValidate="FileUpload1" ValidationGroup="g1" Display="Dynamic" Text="कृपया अपलोड असाइनमेंट  प्रविष्ट करे"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                        <div class="col-sm-2 col-xs-6 col-md-2">
                                            <label>यहाँ क्लिक करें  <span class="text-danger">*</span></label>
                                            <asp:Button ID="btn_submit" ValidationGroup="g1" runat="server" Text="Submit" class="btn btn-success waves-effect waves-light m-r-30" OnClick="btn_submit_Click" />
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

