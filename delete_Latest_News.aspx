<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="delete_Latest_News.aspx.cs" Inherits="delete_Latest_News" Title="Update News" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h5>Delete Latest News File Ms Excess</h5>
    
<section class="section bgw">
            <div class="container">
                <div class="section-title-2 text-center">
<table width="100%">
   
    <tr>
        <td colspan="2" align="center">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="left"><h4>Existing News</h4> 
            <asp:Button ID="btn_delete" runat="server" class="btn btn-success" OnClick="btn_delete_Click" Text="Delete"></asp:Button>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="left" style="line-height:3em;">
           


            <asp:GridView ID="news_Grid" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                Width="100%" Style="left: 1px; top: -4px" DataKeyNames="news_Id,news_filepath" EnableModelValidation="True">
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="news_Id" HeaderText="ID" />
                    
                    <asp:BoundField DataField="news_filepath" HeaderText="File_path" />
                </Columns>
                <RowStyle Font-Size="9pt" HorizontalAlign="Left" VerticalAlign="Top" />
                <HeaderStyle Font-Size="10pt" HorizontalAlign="Left" />
            </asp:GridView>
          </td>
    </tr>
    <tr>
        <td align="left" 
            colspan="2" align="left">
            
            &nbsp;</td>
    </tr>
</table>
                </div>
            </div>
</section>


    

</asp:Content>

