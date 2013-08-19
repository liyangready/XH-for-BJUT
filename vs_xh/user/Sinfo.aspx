<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Sinfo.aspx.cs" Inherits="user_Sinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="Sno" DataSourceID="SqlDataSource1"  Width="100%">
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" >
                <HeaderStyle Width="70px"/>
            </asp:BoundField>
            <asp:BoundField DataField="Sno" HeaderText="学号" ReadOnly="True" 
                SortExpression="Sno" >
                <HeaderStyle Width="70px"/>
            </asp:BoundField>
            <asp:BoundField DataField="College" HeaderText="学院" 
                SortExpression="College" >
                <HeaderStyle Width="70px"/>
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                <HeaderStyle Width="70px"/>
            </asp:BoundField>
            <asp:BoundField DataField="Gno" HeaderText="组号" SortExpression="Gno" >
                <HeaderStyle Width="70px"/>
            </asp:BoundField>
            <asp:BoundField DataField="LeaderSno" HeaderText="组长" 
                SortExpression="LeaderSno">
                <HeaderStyle Width="70px"/>
            </asp:BoundField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        SelectCommand="SELECT [Name], [Sno], [College], [Email], [Gno], [LeaderSno] FROM [Users] WHERE ([Sno] = @Sno)">
        <SelectParameters>
            <asp:SessionParameter Name="Sno" SessionField="Sno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

