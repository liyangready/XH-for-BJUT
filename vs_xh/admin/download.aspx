<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="download.aspx.cs" Inherits="admin_download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Gnum" DataSourceID="SqlDataSource1" 
        onrowcommand="GridView1_RowCommand" AllowPaging="True" PageSize="8" >
        <Columns>
            <asp:BoundField DataField="Gnum" HeaderText="组号" ReadOnly="True" 
                SortExpression="Gnum" />
            <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                SortExpression="ProName" />
            <asp:BoundField DataField="StartReportName" HeaderText="初期检查报告" 
                SortExpression="StartReportName" />
            <asp:BoundField DataField="StartReportstate" HeaderText="审核状态" 
                SortExpression="StartReportstate" />
            <asp:ButtonField CommandName="download" Text="下载" />
            <asp:ButtonField CommandName="pass1" Text="通过" />
            <asp:BoundField DataField="MiddleReportName" HeaderText="中期检查报告" 
                SortExpression="MiddleReportName" />
            <asp:BoundField DataField="MiddleReportstate" HeaderText="审核状态" 
                SortExpression="MiddleReportstate" />
            <asp:ButtonField CommandName="download1" Text="下载" />
            <asp:ButtonField CommandName="pass2" Text="通过" />
            <asp:BoundField DataField="EndReportName" HeaderText="终期检查报告" 
                SortExpression="EndReportName" />
            <asp:BoundField DataField="EndReportstate" HeaderText="审核状态" 
                SortExpression="EndReportstate" />
            <asp:ButtonField CommandName="download2" Text="下载" />
            <asp:ButtonField CommandName="pass3" Text="通过" />
            <asp:ButtonField CommandName="info" Text="详细信息" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>"  
        
        
        SelectCommand="SELECT [Gnum], [ProName], [StartReportName], [StartReportState], [EndReportName], [EndReportState], [MiddleReportName], [MiddleReportState] FROM [groupinfo] WHERE ([ProClass] = @ProClass)">
        <SelectParameters>
            <asp:SessionParameter Name="ProClass" SessionField="OfClass" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

