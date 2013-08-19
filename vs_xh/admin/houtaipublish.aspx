<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="houtaipublish.aspx.cs" Inherits="admin_houtaipublish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 130px;
        }
        .style3
        {
            height: 46px;
        }
                        
.manage_lines1 {
	border: 1px solid #7F9DB9;
	text-align: right;
}
        .manage_lines3 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-TOP: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid
}
.manage_lines2 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-LEFT: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid;
	text-align: right;
}
        .style15
        {
            width: 585px;
            height: 122px;
            border-color: #3366FF;
        }
        .style10
        {
            width: 547px;
            height: 109px;
        }
        
        .style13
        {
            height: 34px;
            width: 274px;
        }
        .style14
        {
            height: 34px;
        }
            
        .style11
        {
            width: 274px;
        }
                
        .style16
        {
            width: 439px;
        }
        .style17
        {
            height: 34px;
            width: 258px;
        }
        .style18
        {
            height: 34px;
            width: 142px;
        }
        </style>
    <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td class="style3" 
                    style="font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 18px">
                    &nbsp; 
                    <asp:Label ID="Label1" runat="server" Text="发布新帖"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center"  class="style2">
                
                    <table border="1" cellpadding="0" cellspacing="0" class="style15">
                        <tr>
                            <td>
                
                    <table cellpadding="0" cellspacing="0" class="style10" 
                        style="font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 13px">
                        <tr>
                            <td class="style13" style="text-align: right">
                                标题：</td>
                            <td >
                                <asp:TextBox ID="TextBox1" runat="server" Width="320px" BorderStyle="None" 
                                    Height="22px"></asp:TextBox>
                            </td>
                            <td class="style18" colspan="2" align="right">
                                类别：</td>
                            <td class="style14">
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="91px" 
                                    AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11" style="text-align: right">
                                内容：</td>
                            <td class="" colspan="4">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="480px" 
                                    BorderStyle="None" Height="141px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td align="right" class="style16" colspan="2">
                                验证码：<asp:TextBox ID="TextBox3" runat="server" Width="101px"></asp:TextBox>
                                <span>
                                <asp:Image ID="Image2" runat="server" Height="25px" ImageUrl="~/ValidNums.aspx" 
                                    Width="58px" />
                                </span>
                            </td>
                            <td style="text-align: right; width:150px" colspan="2">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="发帖" 
                                    Width="45px" />
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="取消" />
                            </td>
                        </tr>
                    </table>
                
                            </td>
                        </tr>
                    </table>
                
                </td>
            </tr>
        </table>
</asp:Content>

