<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="pubperformce_NewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 198px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


                    <table id="Table1"
                    style="width:100%;">
                        <tr>
                            <td style="width:80px;height:50px;" align="right">用户名</td>
                            <td class="style1" style="width:400px;">
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="必须输入用户名"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td style="width:80px;height:50px;" align="right">学号</td>
                            <td class="style1" style="width:400px;">
                                <asp:TextBox ID="StudentNum" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="StudentNum" ErrorMessage="必须输入学号"></asp:RequiredFieldValidator>
                            </td>
                        </tr> 
                         <tr>
                            <td style="width:80px;height:50px;" align="right">学院</td>
                            <td class="style1" style="width:400px;">
                                <asp:ListBox ID="CollegeText" runat="server" Rows="1">
                                    <asp:ListItem Selected="True">机械工程与应用电子技术学院</asp:ListItem>
                                    <asp:ListItem>电子信息与控制工程学院</asp:ListItem>
                                    <asp:ListItem>建筑工程学院</asp:ListItem>
                                    <asp:ListItem >环境与能源工程学院</asp:ListItem>
                                    <asp:ListItem >应用数理学院</asp:ListItem>
                                    <asp:ListItem>计算机学院</asp:ListItem>
                                    <asp:ListItem>软件学院</asp:ListItem>
                                    <asp:ListItem >材料科学与工程学院</asp:ListItem>
                                    <asp:ListItem>生命科学与生物工程学院</asp:ListItem>
                                    <asp:ListItem>经济与管理学院</asp:ListItem>
                                    <asp:ListItem >建筑与城市规划学院</asp:ListItem>
                                    <asp:ListItem>人文社会科学学院</asp:ListItem>
                                    <asp:ListItem>外国语学院</asp:ListItem>
                                </asp:ListBox>
                                <asp:RequiredFieldValidator ID="CollegeRequired" runat="server" 
                                    ControlToValidate="CollegeText" ErrorMessage="必须输入学院">*</asp:RequiredFieldValidator>
                            </td>
                        </tr> 
                         <tr>
                            <td  style="width:80px;height:50px;" align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label>
                            </td>
                            <td class="style1" style="width:400px;">
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                                    >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td style="width:80px;height:50px;" align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">确认密码:</asp:Label>
                            </td>
                            <td class="style1" style="width:400px;">
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" ErrorMessage="必须填写“确认密码”。" 
                                    ToolTip="必须填写“确认密码”。">*</asp:RequiredFieldValidator>
                                
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="Password" ControlToCompare="ConfirmPassword" ErrorMessage="确认密码与密码不匹配" ToolTip="确认密码与密码不匹配"></asp:CompareValidator>
                                
                            </td>
                        </tr>
                         <tr>
                            <td style="width:80px;height:50px;" align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label>
                            </td>
                            <td class="style1" style="width:400px;">
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="必须填写“电子邮件”。" ToolTip="必须填写“电子邮件”。">*</asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="请输入有效邮箱" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><asp:Button ID="Button1" runat="server" Text="提交"  onclick="Button1_Click" /></td>
                        </tr>

                </table>
               
    
</asp:Content>

