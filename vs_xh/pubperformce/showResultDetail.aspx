<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="showResultDetail.aspx.cs" Inherits="pubperformce_showResultDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource1"  Width="100%" BorderStyle="None">
        <Fields>
            <asp:BoundField DataField="Gnum" HeaderText="编号:" SortExpression="Gnum">
                <HeaderStyle Width="60px" BorderStyle="None"/>
                <ItemStyle BorderStyle="None" />
            </asp:BoundField>
            <asp:BoundField DataField="ProName" HeaderText="项目名称:" 
                SortExpression="ProName">
                <HeaderStyle Width="60px" BorderStyle="None"/>
                <ItemStyle BorderStyle="None" />
            </asp:BoundField>
            <asp:BoundField DataField="ProClass" HeaderText="项目类型:" 
                SortExpression="ProClass">
                <HeaderStyle Width="60px" BorderStyle="None"/>
                <ItemStyle BorderStyle="None" />
            </asp:BoundField>
            <asp:BoundField DataField="Teacher" HeaderText="指导教师:" 
                SortExpression="Teacher">
                <HeaderStyle Width="60px" BorderStyle="None"/>
                <ItemStyle BorderStyle="None" />
            </asp:BoundField>
            <asp:BoundField DataField="Leader" HeaderText="组长:" 
                SortExpression="Leader">
                <HeaderStyle Width="60px" BorderStyle="None"/>
                <ItemStyle BorderStyle="None" />
            </asp:BoundField>
            <asp:BoundField DataField="Proinfo" HeaderText="项目简介:" 
                SortExpression="Proinfo" >
                <HeaderStyle Width="60px" BorderStyle="None"/>
                <ItemStyle BorderStyle="None" />
            </asp:BoundField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        SelectCommand="SELECT [Gnum], [ProName], [ProClass], [Teacher], [Leader], [Proinfo] FROM [groupinfo] WHERE ([Gnum] = @Gnum)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Gnum" QueryStringField="Gnum" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

