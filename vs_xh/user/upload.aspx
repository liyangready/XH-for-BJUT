<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="user_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <p>
        标题：<asp:TextBox ID="TextBox1" runat="server" Width="259px"></asp:TextBox>
        （*标题不能为空）</p>
    <p style="height: 26px">
        报告类型：<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>初期检查报告</asp:ListItem>
            <asp:ListItem>中期检查报告</asp:ListItem>
            <asp:ListItem>终期检查报告</asp:ListItem>
        </asp:DropDownList>
    &nbsp;(*请确认好报告类型，每种类型报告只能提交一次！）</p>
    <p>
        内容：<asp:FileUpload ID="FileUpload1" runat="server" Width="121px" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:Button ID="upload" runat="server" Height="22px" onclick="upload_Click" 
            Text="上传" Width="66px" />
&nbsp;
        <asp:Button ID="Button2" runat="server" Height="23px" onclick="Button2_Click" 
            Text="重置" Width="68px" />
&nbsp;<asp:Button ID="return" runat="server" Height="23px" onclick="return_Click" 
            Text="返回" Width="68px" />
    </p>
</asp:Content>

