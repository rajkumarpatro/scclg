<%@ Page Title="SMS Alert Registration | Best College in Durg" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Pending_SMS_Registration.aspx.cs" Inherits="User_Control_Faculties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="main-content">

    <div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Pending SMS Registration Request</h1></div>
						</div>
					</div><!-- end container-->
				</div><!-- end wrap-title-page -->


				<div class="section-breadcrumb">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div class="wrap-breadcrumb clearfix">
									<ol class="breadcrumb">
										<li><a href="javascript:void(0);"><i class="icon stroke icon-House"></i></a></li>
										<li class="active">SMS Alert System</li>
									</ol>
								</div>
							</div>
						</div><!-- end row -->
					</div><!-- end container -->
				</div><!-- end section-breadcrumb -->
    
     <section >
      <div class="container">
         <div class="section-content">
             <div class="row">
                 <div class="col-md-12">
                    <h2 class="ui-title-block">SMS <strong>Alert Registration</strong></h2>
                    <h4><asp:Label runat="server" ID="lbl_user" ForeColor="Maroon"></asp:Label></h4>
                 </div>
             </div>
         </div>
      </div>
    </section>
<section class="">
      <div class="container">
        <div class="section-content">
          
          <div class="row">
            <div class="col-md-12"><h5 class="text-uppercase font-weight-600 mt-0 font-20 ">
                महाविद्यालय के छात्राओं को महत्वपूर्ण सुचना प्रदान करने हेतु SMS अलर्ट सेवा 
                प्रारंभ की गई है, अतः जिन छात्राओं को महाविद्यालय से SMS प्राप्त नही होता है, वे 
                अपना रजिस्ट्रेशन करे</h5></div>
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
        <td style="text-align: left">
            &nbsp; &nbsp;<asp:ImageButton ID="btn_reset" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="btn_reset_Click" />
        &nbsp;<asp:ImageButton ID="img_back" runat="server" ImageUrl="~/images/back.jpg" 
                onclick="img_back_Click" />
&nbsp; <asp:ImageButton ID="btn_delete" runat="server" 
                ImageUrl="~/images/delete-button01.png" onclick="btn_delete_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btn_verify" runat="server" BackColor="Black" 
                BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" 
                Text="Verify Number" style="border-radius:3px;" Height="30px" 
                onclick="btn_verify_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    
    <tr>
        <td colspan="2" align="left">
            
            <b>Pending Registration</b><asp:Label ID="lbl_id" runat="server" 
                Visible="False"></asp:Label>
        </td>
    </tr>
    
    <tr>
        <td colspan="2" align="left">
            
            <asp:GridView ID="gv_record" runat="server" AutoGenerateSelectButton="True" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="gv_record_SelectedIndexChanged" Width="98%">
                <RowStyle BackColor="#EFF3FB" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle HorizontalAlign="Left" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
</table>
                    </div>
                </div>
    </section>
      </div>
    </section> 

     </div>

</asp:Content>

