<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="reportinfo.aspx.cs" Inherits="user_reportinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Gnum" HeaderText="组号" SortExpression="Gnum" />
            <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                SortExpression="ProName" />
            <asp:BoundField DataField="StartReportName" HeaderText="初期报告" 
                SortExpression="StartReportName" />
            <asp:BoundField DataField="StartReportState" HeaderText="初期报告审核状态" 
                SortExpression="StartReportState" />
            <asp:BoundField DataField="MiddleReportName" HeaderText="中期报告" 
                SortExpression="MiddleReportName" />
            <asp:BoundField DataField="MiddleReportState" HeaderText="中期报告审核状态" 
                SortExpression="MiddleReportState" />
            <asp:BoundField DataField="EndReportName" HeaderText="终期报告" 
                SortExpression="EndReportName" />
            <asp:BoundField DataField="EndReportState" HeaderText="终期报告审核状态" 
                SortExpression="EndReportState" />
            <asp:BoundField DataField="Teacher" HeaderText="指导教师" 
                SortExpression="Teacher" />
            <asp:BoundField DataField="ProClass" HeaderText="报告类型" 
                SortExpression="ProClass" />
            <asp:BoundField DataField="ProType" HeaderText="报告类别" 
                SortExpression="ProType" />
            <asp:BoundField DataField="ProMoney" HeaderText="项目经费" 
                SortExpression="ProMoney" />
            <asp:BoundField DataField="Proinfo" HeaderText="报告信息" 
                SortExpression="Proinfo" />
            <asp:BoundField DataField="Leader" HeaderText="组长" SortExpression="Leader" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        SelectCommand="SELECT [Gnum], [ProName], [StartReportName], [StartReportState], [EndReportName], [EndReportState], [MiddleReportName], [MiddleReportState], [Teacher], [ProClass], [ProType], [ProMoney], [Proinfo], [Leader] FROM [groupinfo] WHERE ([Gnum] = @Gnum)">
        <SelectParameters>
            <asp:SessionParameter Name="Gnum" SessionField="Group" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

