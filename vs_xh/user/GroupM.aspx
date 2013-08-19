<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GroupM.aspx.cs" Inherits="user_GroupM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr><td>已有成员</td></tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Horizontal" style="margin-right: 0px" >
                <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" >
                            <HeaderStyle Width="60px"/>
                            <ItemStyle Width="60px" Height="20px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="College" HeaderText="学院" 
                            SortExpression="College" >
                            <HeaderStyle Width="150px"/>
                            <ItemStyle Width="150px" Height="20px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sno" HeaderText="学号" ReadOnly="True" 
                            SortExpression="Sno" >
                            <HeaderStyle Width="60px"/>
                            <ItemStyle Width="60px" Height="20px" HorizontalAlign="Center"/>
                        </asp:BoundField>
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
                    SelectCommand="SELECT [Name], [College], [Sno] FROM [Users] ORDER BY [Sno]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr><td>申请加入成员</td></tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Horizontal" style="margin-right: 0px" onRowCommand="GridView2_RowCommand">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" >
                            <HeaderStyle Width="50px"/>
                            <ItemStyle Width="50px" Height="20px" HorizontalAlign="Center"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="College" HeaderText="学院" 
                            SortExpression="College" >
                            <HeaderStyle Width="150px"/>
                            <ItemStyle Width="150px" Height="20px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sno" HeaderText="学号" ReadOnly="True" 
                            SortExpression="Sno" >
                            <HeaderStyle Width="60px"/>
                            <ItemStyle Width="60px" Height="20px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ButtonField HeaderText="加入" Text="同意" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
                    SelectCommand="SELECT [Name], [College], [Sno] FROM [Users] ORDER BY [Sno]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

