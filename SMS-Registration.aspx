<%@ Page Title="SMS Alert Registration | Best College in Durg" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="SMS-Registration.aspx.cs" Inherits="User_Control_Faculties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
    <link href="css/animate.css" rel="stylesheet" type="text/css">
<link href="css/css-plugin-collections.css" rel="stylesheet"/>
<!-- CSS | menuzord megamenu skins -->
<link id="menuzord-menu-skins" href="css/menuzord-skins/menuzord-rounded-boxed.css" rel="stylesheet"/>
<!-- CSS | Main style file -->
<link href="css/style-main.css" rel="stylesheet" type="text/css">
<!-- CSS | Preloader Styles -->
<%--<link href="css/preloader.css" rel="stylesheet" type="text/css">--%>
<!-- CSS | Custom Margin Padding Collection -->
<link href="css/custom-bootstrap-margin-padding.css" rel="stylesheet" type="text/css">
<!-- CSS | Responsive media queries -->
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
<!-- <link href="css/style.css" rel="stylesheet" type="text/css"> -->

<!-- Revolution Slider 5.x CSS settings -->
<link  href="js/revolution-slider/css/settings.css" rel="stylesheet" type="text/css"/>
<link  href="js/revolution-slider/css/layers.css" rel="stylesheet" type="text/css"/>
<link  href="js/revolution-slider/css/navigation.css" rel="stylesheet" type="text/css"/>

<!-- CSS | Theme Color -->
<link href="css/colors/theme-skin-color-set-1.css" rel="stylesheet" type="text/css">
<link href="css/custom.css" rel="stylesheet" type="text/css" />
    
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="js/jquery-plugin-collection.js"></script>

<!-- Revolution Slider 5.x SCRIPTS -->
<script src="js/revolution-slider/js/jquery.themepunch.tools.min.js"></script>
<script src="js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="main-content">

    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/cw/assets/bg5.jpg" style="background-image: url(&quot;images/cw/assets/bg5.jpg&quot;); background-position: 50% 85px;">
      <div class="container pt-70 pb-20">
        <!-- Section Content -->
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h2 class="title text-white">SMS Registration</h2>
              <ol class="breadcrumb text-left text-black mt-10">
                <li><a href="#">Home</a></li>
                <li><a href="#">SMS Registration</a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </section>
<section class="">
      <div class="container">
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h6 class="letter-space-4 text-gray-darkgray text-uppercase mt-0 mb-0">SMS Facility</h6>
              <h2 class="text-uppercase font-weight-600 mt-0 font-28 line-bottom">SMS Alert Registration</h2>
                
            </div>          
          </div>
          
          <div class="row">
            <div class="col-md-12"><h5 class="text-uppercase font-weight-600 mt-0 font-20 ">महाविद्यालय के छात्राओं को महत्वपूर्ण सुचना प्रदान करने हेतु SMS अलर्ट सेवा प्रारंभ की गई है, अतः जिन छात्राओं को महाविद्यालय से SMS प्राप्त नही होता है, वे अपना रजिस्ट्रेशन करे</h5></div>
            </div>
          <section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">
    <table width="100%" bgcolor="white">
    
    <tr>
        <td align="left" width="15%">
            Student Name :</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txt_name" runat="server" BorderStyle="Dashed" 
                Width="300px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
            &nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>&nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" 
                Display="Dynamic" ErrorMessage="Please Enter Your Name" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            Fathers Name :</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txt_father" runat="server" BorderStyle="Dashed" 
                Width="300px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
            &nbsp;<asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txt_father" Display="Dynamic" 
                ErrorMessage="Please Enter Your Father Name" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            Class :</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txt_class" runat="server" BorderStyle="Dashed" 
                Width="300px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
            &nbsp;<asp:Label ID="Label3" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txt_class" Display="Dynamic" 
                ErrorMessage="Please Enter Your Class" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    
    <tr>
        <td align="left">
            10 Digit Mobile No. :</td>
        <td align="left" style="padding:5px;">
            <asp:TextBox ID="txt_mobile" runat="server" BorderStyle="Dashed" 
                Width="300px" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="Red" 
                Text="*"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txt_mobile" Display="Dynamic" 
                ErrorMessage="Please Enter Your 10 Digit Mobile Number" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            &nbsp;
            </td>
        <td style="text-align: left" colspan="2">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                ValidationGroup="g1" />
            &nbsp; &nbsp;<asp:ImageButton ID="btn_reset" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="btn_reset_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    
    <tr>
        <td colspan="3" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                    </div>
                </div>
    </section>
      </div>
    </section> 

     </div>


    </div>

</asp:Content>

