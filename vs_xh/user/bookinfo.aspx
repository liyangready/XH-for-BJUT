<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="bookinfo.aspx.cs" Inherits="user_bookinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <Table>
    <tr>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Horizontal" style="margin-right: 0px; width:100%" >
                <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="GroupNum" HeaderText="图书编号" 
                SortExpression="GroupNum" >
                <HeaderStyle Width="50px"/>
                <ItemStyle Width="50px" Height="20px" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="BookClass" HeaderText="图书类别" 
                SortExpression="BookClass" >
                <HeaderStyle Width="70px"/>
                <ItemStyle Width="70px" Height="20px" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="BookName" HeaderText="图书名称" 
                SortExpression="BookName" >
                <HeaderStyle Width="180px"/>
                <ItemStyle Width="180px" Height="20px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Auther" HeaderText="作者" 
                SortExpression="Auther" >
                <HeaderStyle Width="60px"/>
                <ItemStyle Width="60px" Height="20px" HorizontalAlign="Center" />
             </asp:BoundField>
            <asp:BoundField DataField="Press" HeaderText="出版社" SortExpression="Press" >
                <HeaderStyle Width="60px"/>
                <ItemStyle Width="60px" Height="50px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="价格" SortExpression="Price" >
                <HeaderStyle Width="40px"/>
                <ItemStyle Width="40px" Height="20px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" >
                <HeaderStyle Width="60px"/>
                <ItemStyle Width="60px" Height="20px" HorizontalAlign="Center" />
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
            
            
            SelectCommand="SELECT [GroupNum], [BookClass], [BookName], [Auther], [Press], [Price], [ISBN] FROM [Book] ">
        </asp:SqlDataSource>
        
    </tr>
    <tr>
        <td><asp:Button ID="Button1" runat="server" Text="新增" onclick="Button1_Click"  /></td>
    </tr>
    </Table>
    
</asp:Content>

