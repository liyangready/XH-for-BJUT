<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="StudentM.aspx.cs" Inherits="admin_StudentM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" Width="100%">
        <Columns>
            <asp:BoundField DataField="Gnum" HeaderText="组号" SortExpression="Gnum" >
                <HeaderStyle Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                SortExpression="ProName" >
                <HeaderStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProClass" HeaderText="项目类型" 
                SortExpression="ProClass">
                <HeaderStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProType" HeaderText="项目类别" 
                SortExpression="ProType">
                <HeaderStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Teacher" HeaderText="指导教师" 
                SortExpression="Teacher" >
                <HeaderStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Leader" HeaderText="组长" SortExpression="Leader" >
                <HeaderStyle Width="60px" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    
</asp:Content>

