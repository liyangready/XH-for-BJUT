<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="showNoteDetial.aspx.cs" Inherits="pubperformce_oneNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            connect:
            <asp:TextBox ID="connectTextBox" runat="server" Text='<%# Bind("connect") %>' />
            <br />
            addDate:
            <asp:TextBox ID="addDateTextBox" runat="server" Text='<%# Bind("addDate") %>' />
            <br />
            xueyuan:
            <asp:TextBox ID="xueyuanTextBox" runat="server" Text='<%# Bind("xueyuan") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            connect:
            <asp:TextBox ID="connectTextBox" runat="server" Text='<%# Bind("connect") %>' />
            <br />
            addDate:
            <asp:TextBox ID="addDateTextBox" runat="server" Text='<%# Bind("addDate") %>' />
            <br />
            xueyuan:
            <asp:TextBox ID="xueyuanTextBox" runat="server" Text='<%# Bind("xueyuan") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            标题:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
            <br />           
            发布时间:
            <asp:Label ID="addDateLabel" runat="server" Text='<%# Bind("addDate") %>' />
            <br />
            学院:
            <asp:Label ID="xueyuanLabel" runat="server" Text='<%# Bind("xueyuan") %>' />
            <br />
            内容:
            <asp:Label ID="connectLabel" runat="server" Text='<%# Bind("connect") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        SelectCommand="SELECT title, connect, addDate, xueyuan FROM notice WHERE (title = @title)">
        <SelectParameters>
            <asp:QueryStringParameter Name="title" QueryStringField="title" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

