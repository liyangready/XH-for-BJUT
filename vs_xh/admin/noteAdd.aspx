<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="admin_notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>

    <tr>
        <td>标题
        </td>
        <td>
            <asp:TextBox ID="title" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" ControlToValidate="title" runat="server" ErrorMessage="必须添加标题！"></asp:RequiredFieldValidator>
        </td>
    </tr>


    <tr>
        <td colspan="2">
            <asp:TextBox ID="connect" runat="server" TextMode="MultiLine" Height="400px" Width="580px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="submit" runat="server" Text="提交" onclick="submit_Click" />
        </td>
        <td>
            <asp:Button ID="cancel" runat="server" Text="取消"  />
        </td>
    </tr>
    </Table>
    
</asp:Content>

