<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ForumList.aspx.cs" Inherits="pubperformce_ForumList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
        .style1
        {
            width: 575px;
            height: 338px;
        }
        .style10
        {
            width: 100%;
            height: 226px;
        }
        
        .manage_lines1 {
	border: 1px solid #7F9DB9;
}
        .manage_lines3 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-TOP: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid
}
.manage_lines2 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-LEFT: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid;
}
.manage_lines4 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid;
}
.manage_lines5{
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-TOP: #7F9DB9 1px solid;
}
        .style12
        {
        }
        .style15
        {
            width: 548px;
            height: 28px;
        }
        .style16
        {
            height: 28px;
        }
        .style19
        {
            height: 30px;
        }
                
        .style11
        {
            width: 62px;
        }
                
        .style20
        {
            width: 62px;
            height: 36px;
        }
        .style21
        {
            height: 36px;
        }
        .style30
        {
            width: 547px;
        }
        .style13
        {
            width: 99%;
            height: 95px;
        }
        .style17
        {
            border: 1px solid #7F9DB9;
            height: 29px;
        }
        .style29
        {
            width: 553px;
            height: 29px;
        }
                
        .style23
        {
            width: 100%;
            height: 94px;
        }
                        
        .style28
        {
            height: 19px;
        }
        .style27
        {
            height: 64px;
        }
                
        </style>
     <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td align ="center">
                
                    <table cellpadding="0" cellspacing="0" class="style10" 
                        style="font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 13px">
                        <tr>
                            <td class="style19" ><h2 align = "center">论坛详细信息列表</h2></td>
                        </tr>
                        <tr>
                            <td class="style12" style="text-align:center">
                                <table cellpadding="0" cellspacing="0" class="style30">
                                    <tr>
                                                <td align ="center"  colspan="2">
                                                    <table cellpadding="0" cellspacing="0" class="style29 manage_lines1" bgcolor="#3366FF">
                                                        <tr>
                                                            <td align ="left" style="font-weight:bold; color:White">
                                                                &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="11pt" 
                                                                    ForeColor="White" Text=''></asp:Label>
                                                             </td>
                                                            <td style="font-weight:bold; color:White; width:150px">
                                                                <asp:Label ID="Label1" runat="server" Text='回复 '></asp:Label>
                                                                <asp:Label ID="Label8" runat="server" Text=''></asp:Label>
                                                                <asp:Label ID="Label10" runat="server" Text=' 次'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:DataList ID="DataList1" runat="server" Width="559px">
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0" class="style13">
                                            <tr>
                                                <td style =" width:500px" class=" manage_lines1" align="left">
                                                <asp:Label ID="Label12" runat="server" Text='用户：'></asp:Label>
                                                   <asp:Label ID="Label2" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"Name") %>'></asp:Label>
                                                
                                                
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    
                                                    <asp:Label ID="Label5" runat="server" Text='发表于：'></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hfdates")%>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                               
                                                <td align ="left" valign ="top" style =" width:700px" class="manage_lines2">
                                                    &nbsp;
                                                    <table cellpadding="0" cellspacing="0" class="style23">
                                                        <tr>
                                                            <td valign ="top" class="style28">
                                                                 &nbsp;
                                                                 <asp:Label ID="Label4" runat="server" 
                                                                     Text='<%# DataBinder.Eval(Container.DataItem,"hftitle")%>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style27" valign="top">
                                                                &nbsp;&nbsp;<asp:Label ID="Label6" runat="server" 
                                                                    Text='<%# DataBinder.Eval(Container.DataItem,"contents")%>'></asp:Label>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" >
                                                                <asp:Button ID="Button3" runat="server" Text="回复" Width="77px" 
                                                                    onclick="Button3_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12" style="text-align: center">
                
                    <table border="1" cellpadding="0" cellspacing="0" class="style15">
                        <tr>
                            <td class ="manage_lines2">
                
                    <table cellpadding="0" cellspacing="0" class="style10" 
                        style="font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 13px">
                        <tr>
                            <td class="style20" style="text-align: right">
                                标题：</td>
                            <td class="style21" colspan="2" >
                                <asp:TextBox ID="TextBox4" runat="server" BorderStyle="None" Width="470px" 
                                    Height="21px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11" style="text-align: right">
                                内容：</td>
                            <td class="" colspan="2">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="471px" 
                                    BorderStyle="None" Height="141px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td align="right" class="style16">
                                验证码：<asp:TextBox ID="TextBox3" runat="server" Width="101px"></asp:TextBox>
                                <span>
                                <asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/ValidNums.aspx" 
                                    Width="58px" />
                                </span>
                            </td>
                            <td style="text-align: right; width:150px">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="发帖" 
                                    Width="54px" />
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="取消" 
                                    Width="52px" />
                            </td>
                        </tr>
                    </table>
                
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

