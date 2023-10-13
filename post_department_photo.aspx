<%@ Page Language="C#" AutoEventWireup="true" CodeFile="post_department_photo.aspx.cs" Inherits="photo_upload" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Photo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="700"cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="font-family:Calibri; font-size:24px; color:#006699;" align="center" 
                colspan="2">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                Upload Photo</td>
        </tr>
        <tr>
            <td width="20%" style="font-family:Arial; font-size:12px; line-height:1.8em;">Photo 
                ID</td>
            <td width="80%" style="font-family:Arial; font-size:12px; line-height:1.8em;">
            
                    
                
            <asp:Label ID="lbl_photo_id" runat="server" Font-Names="Arial" Font-Size="12px"></asp:Label>
            
            
                
            <asp:Label ID="lbl_did" runat="server" Font-Names="Arial" Font-Size="12px" 
                    Visible="False"></asp:Label>
            
            
            </td>
        </tr>
        <tr>
            <td width="20%" style="font-family:Arial; font-size:12px; line-height:1.8em;">Choose 
                Photo</td>
            <td width="80%" style="font-family:Arial; font-size:12px; line-height:1.8em;">
                <asp:Image ID="img_preview" runat="server" />
                <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" 
                    onuploadcomplete="AjaxFileUpload1_UploadComplete" />
            </td>
        </tr>
        <tr>
            <td width="20%" style="font-family:Arial; font-size:12px; line-height:1.8em;">
                <asp:Label ID="lbl_master_id" runat="server"></asp:Label>
            </td>
            <td width="80%" style="font-family:Arial; font-size:12px; line-height:1.8em;">
            <asp:ImageButton ID="btn_Save" runat="server" 
                ImageUrl="~/Images/tour_save_button.png" onclick="btn_Save_Click" />
            &nbsp; 
            <asp:ImageButton ID="btn_ok" runat="server" 
                ImageUrl="~/Images/ok.jpg" onclick="btn_ok_Click" 
                    />
            &nbsp;&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/reset_icon.jpg" onclick="ImageButton2_Click" />
            &nbsp;&nbsp; 
            <asp:ImageButton ID="img_del" runat="server" 
                OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                ImageUrl="~/Images/delete-button01.png" onclick="img_del_Click" 
                Width="100px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="img_del_all" runat="server" 
                OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                ImageUrl="~/Images/delete_all.png" onclick="img_del_all_Click" 
                Width="100px" />
            </td>
        </tr>
        <tr>
            <td width="20%" style="font-family:Arial; font-size:12px; line-height:1.8em;">&nbsp;</td>
            <td width="80%" style="font-family:Arial; font-size:12px; line-height:1.8em;">
                
                    </td>
        </tr>
        <tr>
            <td width="20%" align="center" 
                style="font-family:Arial; font-size:12px; line-height:1.8em; width: 100%;" 
                colspan="2">
            
            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Italic="False" 
                ForeColor="#CC3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="20%" 
                style="font-family:Arial; font-size:12px; line-height:1.8em; width: 100%;" 
                colspan="2"><b>Existing Records</b></td>
        </tr>
        <tr>
            <td width="20%" 
                style="font-family:Arial; font-size:12px; line-height:1.8em; width: 100%;" 
                colspan="2">
                <asp:GridView ID="gw_pics" runat="server" AutoGenerateSelectButton="True" 
                    Width="100%" onselectedindexchanged="gw_pics_SelectedIndexChanged">
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
