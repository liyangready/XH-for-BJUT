<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="bookInsert.aspx.cs" Inherits="user_bookInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
       <tr>
            <td align="right">图书类别</td>
            <td class="style1">
                <asp:TextBox ID="BClass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="BClass" ErrorMessage="必须输入图书类别">*</asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
            <td align="right">图书名</td>
            <td class="style1">
                <asp:TextBox ID="BName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="BName" ErrorMessage="必须输入图书名">*</asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
            <td align="right">作者</td>
            <td class="style1">
                <asp:TextBox ID="BAuther" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="BAuther" ErrorMessage="必须输入作者">*</asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
            <td align="right">出版社</td>
            <td class="style1">
                <asp:TextBox ID="BPress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="BPress" ErrorMessage="必须输入出版社">*</asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
            <td align="right">价格</td>
            <td class="style1">
                <asp:TextBox ID="BPrice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="BPrice" ErrorMessage="必须输入价格">*</asp:RequiredFieldValidator>
            </td>
       </tr>
        <tr>
            <td align="right">ISBN</td>
            <td class="style1">
                <asp:TextBox ID="BISBN" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="BISBN" ErrorMessage="必须输入ISBN">*</asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
           <td>
               <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" />
           </td>
       </tr>
       


                        
        
    </table>
</asp:Content>

