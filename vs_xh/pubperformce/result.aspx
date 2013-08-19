<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="pubperformce_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="100%" BorderStyle="None" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Gnum" HeaderText="项目编号" 
                SortExpression="Gnum" >
                <HeaderStyle Width="80px" BorderStyle="None" HorizontalAlign="Left" />
            </asp:BoundField >
                
            <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                SortExpression="ProName">
                <HeaderStyle Width="350px" BorderStyle="None" HorizontalAlign="Left"/>
            </asp:BoundField >
            <asp:BoundField DataField="ProClass" HeaderText="项目类型" 
                SortExpression="ProType" >
                <HeaderStyle Width="80px" BorderStyle="None" HorizontalAlign="Left"/>
            </asp:BoundField >
            <asp:BoundField DataField="Teacher" HeaderText="指导教师" 
                SortExpression="Teacher">
                <HeaderStyle Width="80px" BorderStyle="None" HorizontalAlign="Left"/>
            </asp:BoundField >
            <asp:HyperLinkField DataNavigateUrlFields="Gnum" 
                
                DataNavigateUrlFormatString="~/pubperformce/showResultDetail.aspx?Gnum={0}" 
                Text="详情" />
        </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#a3c9ee" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#000000" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        
        SelectCommand="SELECT [Gnum], [ProName], [ProClass], [Teacher] FROM [groupinfo] WHERE ([Outstanding] = @Outstanding)">
        <SelectParameters>
            <asp:Parameter DefaultValue="优秀项目" Name="Outstanding" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

