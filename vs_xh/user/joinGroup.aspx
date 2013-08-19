<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="joinGroup.aspx.cs" Inherits="user_joinGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td align="right" style="width:60px;">关键字</td>
            <td align="right" style="width:100px;"> 
                <asp:ListBox  ID="ListBox1" runat="server" Rows="1">
                    <asp:ListItem  Selected="True">项目名称关键字</asp:ListItem>
                    <asp:ListItem>项目类型</asp:ListItem>
                    <asp:ListItem>项目类别</asp:ListItem>
                </asp:ListBox>
            </td>
            <td align="left">              
                <asp:TextBox Width="150px"  ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td align="right">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~\Styles\shousuo1.jpg" 
                    onclick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" 
                     
                     onRowCommand="GridView1_RowCommand"
               
                     Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    style="margin-right: 342px" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Gnum" HeaderText="组号" SortExpression="Gnum" >
                            <HeaderStyle Width="30px"/>
                            <ItemStyle Width="30px" Height="35px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                            SortExpression="ProName" >
                            <HeaderStyle Width="200px"/>
                            <ItemStyle Width="200px" Height="35px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Leader" HeaderText="组长" SortExpression="Leader" >
                            <HeaderStyle Width="50px"/>
                            <ItemStyle Width="50px" Height="35px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProClass" HeaderText="项目类型" 
                            SortExpression="ProClass" >
                            <HeaderStyle Width="70px"/>
                            <ItemStyle Width="70px" Height="35px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProType" HeaderText="项目类别" 
                            SortExpression="ProType" >
                            <HeaderStyle Width="70px"/>
                            <ItemStyle Width="70px" Height="35px" />
                        </asp:BoundField>
                        <asp:ButtonField HeaderText="申请加入" Text="加入"/>
                    </Columns>

                    <EditRowStyle BackColor="#2461BF" />

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
                    SelectCommand="SELECT [Gnum], [ProName], [Leader], [ProClass], [ProType] FROM [groupinfo] ORDER BY [Gnum]">
                </asp:SqlDataSource>
            </td>
        </tr>
                       
    </table>


</asp:Content>

