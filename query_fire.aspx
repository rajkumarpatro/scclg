<%@ Page Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="query_fire.aspx.cs" Inherits="query_fire" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <asp:TextBox ID="txt_query" runat="server" Height="100px" TextMode="MultiLine" 
                Width="735px"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Get Data" 
                Width="75px" />
&nbsp;
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Action" 
                Width="75px" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbl_info" runat="server" ForeColor="Red"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_count" runat="server" ForeColor="#339933"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </td>
    </tr>
   </table>
    
</asp:Content>

