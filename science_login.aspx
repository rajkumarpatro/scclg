<%@ Page Language="C#" MasterPageFile="~/Home_Page.master" AutoEventWireup="true" CodeFile="science_login.aspx.cs" Inherits="science_login" Title="Login Here !" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


       <section id="sub-header-2" class="subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Admin Login</h1>          
                    </div>
                </div>
            </div>
        </section>
        

        <!-- content begin -->
        <div id="">
            <div class="container">
            <div class="row">
          <div class="col-md-4 mb-40">
            <h4 class="text-gray mt-0 pt-5"> </h4>
            <hr>                 
              <div class="row">
                <div class="form-group col-md-12">
                  <label for="form_username_email">Username/Email</label>
                  <asp:TextBox ID="txt_Username" runat="server" class="form-control" placeholder="User Name" ></asp:TextBox>
                </div>
                </div>
              <div class="row">
                <div class="form-group col-md-12">
                  <label for="form_password">Password</label>
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" class="form-control" placeholder="Password" ></asp:TextBox></div>
                </div>
            <div class="row">
              <div class="form-group col-md-12">
                 <asp:Button runat="server" Text="Login"  class="btn btn-primary tp-resizeme" ID="btn_login" OnClick="btn_login_Click"></asp:Button>
              </div>
                </div>
              </div>

              </div>            

              </div>
           
          
        
    
  </div>

</asp:Content>