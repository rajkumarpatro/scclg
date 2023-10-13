<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="post_department.aspx.cs" Inherits="update_news" ValidateRequest="false" Title="Department Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<div class="wrap-title-page">
					<div class="container">
						<div class="row">
							<div class="col-xs-12"><h1 class="ui-title-page">Post Departments</h1></div>
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
										<li class="active">Post Departments</li>
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
                    <h2 class="ui-title-block">Post <strong>Departments<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <img src="images/loading.gif" style="left:50%; top:50%; position:absolute;" alt="Loading..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
            
            </strong></h2>
                    <h4><asp:Label runat="server" ID="lbl_user" ForeColor="Maroon"></asp:Label></h4>
                 </div>
             </div>
         </div>
      </div>
    </section>
  <section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">  
                     <table width="100%">
    
    <tr>
        <td height="43" align="left" width="150">
            Department</td>
        <td align="left"><asp:DropDownList ID="ddl_department" runat="server" 
                BorderStyle="Dashed" BorderWidth="1"
                Width="350px" BorderColor="Black" AutoPostBack="True" 
                onselectedindexchanged="ddl_department_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
        <td align="right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.jpg" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td height="43" align="left">
            Topic</td>
        <td align="left" colspan="2" style="line-height:2em;">
            <asp:DropDownList ID="ddl_topic" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="350px" BorderColor="Black" AutoPostBack="true" 
                onselectedindexchanged="ddl_topic_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:TextBox ID="txt_topics" runat="server" 
                Width="350px" BorderStyle="Dashed" BorderWidth="1"></asp:TextBox>
            &nbsp;<asp:CheckBox ID="chk_new" runat="server" AutoPostBack="True" Text="New Topic" 
                oncheckedchanged="chk_new_CheckedChanged" />
            <asp:CheckBox ID="chk_edit" runat="server" AutoPostBack="True" Text="Edit Topic" 
                oncheckedchanged="chk_edit_CheckedChanged" />
                <div id="span_topic" runat="server">
                <asp:TextBox ID="txt_edittopic" runat="server" 
                Width="350px" BorderStyle="Dashed" BorderWidth="1"></asp:TextBox> &nbsp;
            <asp:DropDownList ID="ddl_order" runat="server" BorderStyle="Dashed" BorderWidth="1"
                Width="100px" BorderColor="Black">
            </asp:DropDownList>
        &nbsp;<asp:ImageButton ID="btn_Edittopic" runat="server" 
                ImageUrl="~/images/tour_save_button.png" onclick="btn_Edittopic_Click" 
                style="height: 30px" />
            &nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="btn_ok" runat="server" 
                ImageUrl="~/images/ok.jpg" onclick="btn_ok_Click" 
                style="height: 30px" />
            &nbsp;<asp:Label ID="lbl_topic_id" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:GridView ID="gv_topic" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="3" Font-Names="Calibri" Font-Size="14px" ForeColor="Black" 
                GridLines="Vertical" Width="100%">
                <Columns>
                    <asp:BoundField DataField="topic_id" HeaderText="ID"/>
                    <asp:BoundField DataField="topic_name" HeaderText="Topic" />
                    <asp:BoundField DataField="topic_order" HeaderText="Order" />
                    
                                    
                    <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_edit" runat="server" ImageUrl="~/images/edit.png" 
                                OnClick="imgbtn_edit_Click" Height="16px" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtn_enquiry" runat="server" 
                                ImageUrl="~/images/delete.png" Height="16px" 
                                onclick="imgbtn_enquiry_Click" OnClientClick="return confirm('Are you sure you want to delete this record?');"  />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            </div>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Description :</td>
            <td colspan="2">
            <cc1:Editor ID="txt_description" runat="server" Height="400px" />
        </td>
    </tr>
    <tr>
        <td align="left">
            
            &nbsp;</td>
        <td height="43" colspan="2" align="left">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" 
                style="height: 30px" />
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/back.jpg" 
                onclick="ImageButton3_Click" />
        &nbsp;
            
            <asp:Button ID="btn_events" runat="server" BackColor="#CC0000" 
                BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" 
                Text="Post New Departmental Events" style="border-radius:3px;" Height="30px" 
                onclick="btn_events_Click" />
            
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" align="left" style="line-height:1.8em;">
            
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" 
            colspan="3" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                </div>
           </div>
 </section>
</ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
   AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._testCrLfInTextNodes = function(element) {
       if (element.nodeType == 3) {
           if (/[\n\r]/g.test(element.data)) {
               element.data = element.data.replace(/[\n\r]/g, " ");
           }
       } else {
           for (var i = 0; i < element.childNodes.length; i++) {
               this._testCrLfInTextNodes(element.childNodes.item(i));
           }
       }
   }
   AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._saved_getContent = AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._getContent;
   AjaxControlToolkit.HTMLEditor.DesignPanel.prototype._getContent = function() {
       if (!AjaxControlToolkit.HTMLEditor.isIE) {
           if (/[\n\r]/g.test(this._doc.body.innerHTML)) {
               this._testCrLfInTextNodes(this._doc.body);
           }
       }
       return this._saved_getContent();
   }
</script>

</asp:Content>

