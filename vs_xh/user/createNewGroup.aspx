<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="createNewGroup.aspx.cs" Inherits="user_createNewGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 98px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <Table id="Table1" >
    <tr>
        <td align="right" class="style1">项目名称</td>
        <td>
            <asp:TextBox ID="ProN" runat="server" ontextchanged="ProN_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="ProN" ErrorMessage="请输入项目名称">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right">项目类别</td>
        <td>
            
            <asp:ListBox  ID="PClass" Rows=1 runat="server">
                <asp:ListItem Selected="True">人文类</asp:ListItem>
                <asp:ListItem>计算机类</asp:ListItem>
                <asp:ListItem>社会类</asp:ListItem>
            </asp:ListBox>
            
        </td>
    </tr>
    <tr>
        <td align="right">项目类型</td>
        <td>
            <asp:ListBox ID="PType" Rows=1 runat="server">
                <asp:ListItem>普通项目</asp:ListItem>
                <asp:ListItem Selected="True">重点项目</asp:ListItem>
            </asp:ListBox>
        </td>
        
    </tr>
    <tr>
        <td align="right" class="style1">申请指导教师</td>
        <td>
            <asp:TextBox ID="ProT" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                 ControlToValidate="ProT" ErrorMessage="请输入指导教师">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right" class="style1">项目经费申请</td>
        <td>
            <asp:TextBox ID="ProM" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                 ControlToValidate="ProM" ErrorMessage="请输入项目经费">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right" class="style1">项目简介</td>
        <td>
            <asp:TextBox ID="Proinfo" runat="server" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                 ControlToValidate="Proinfo" ErrorMessage="请输入项目简介">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td><asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" /></td>          
    </tr>

</asp:Content>

