<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="note.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="~/App_Themes/StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width:"100%;">
        <tr>
            <td class="tableWidth">关键字</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="searchBox"></asp:TextBox>
            </td>          
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Styles/shousuo1.jpg" 
                    onclick="ImageButton1_Click" CssClass="makeRight" />
            </td>
        </tr>
        <tr>
            <td class="tableWidth">学院搜索</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" Rows="1">
                    <asp:ListItem Selected="True">机械工程与应用电子技术学院</asp:ListItem>
                    <asp:ListItem>电子信息与控制工程学院</asp:ListItem>
                    <asp:ListItem>建筑工程学院</asp:ListItem>
                    <asp:ListItem >环境与能源工程学院</asp:ListItem>
                    <asp:ListItem >应用数理学院</asp:ListItem>
                    <asp:ListItem>计算机学院</asp:ListItem>
                    <asp:ListItem>软件学院</asp:ListItem>
                    <asp:ListItem >材料科学与工程学院</asp:ListItem>
                    <asp:ListItem>生命科学与生物工程学院</asp:ListItem>
                    <asp:ListItem>经济与管理学院</asp:ListItem>
                    <asp:ListItem >建筑与城市规划学院</asp:ListItem>
                    <asp:ListItem>人文社会科学学院</asp:ListItem>
                    <asp:ListItem>外国语学院</asp:ListItem>
                 </asp:ListBox>
                
            </td>
            <td>
                <asp:ImageButton ID="ImaginButtonCollege" runat="server" 
                    ImageUrl="~/Styles/shousuo1.jpg" onclick="ImaginButtonCollege_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Horizontal" style="margin-right: 0px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="题目" SortExpression="title" >
                    <HeaderStyle Width="100px"/>
                    <ItemStyle Width="100px" Height="65px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="xueyuan" HeaderText="学院" 
                        SortExpression="xueyuan" >
                    <HeaderStyle Width="100px"/>
                    <ItemStyle Width="100px" Height="65px"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="addDate" HeaderText="发布时间" 
                        SortExpression="addDate" >
                    <HeaderStyle Width="80px"/>
                    <ItemStyle Width="80px" Height="65px" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="title" 
                        DataNavigateUrlFormatString="~/pubperformce/showNoteDetial.aspx?title={0}" 
                        DataTextField="connect" HeaderText="内容" >
                        <HeaderStyle Width="350px" />
                        <ItemStyle Width="350px" />
                   
                    </asp:HyperLinkField>
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
                SelectCommand="SELECT [title], [xueyuan], [addDate], [connect] FROM [notice] ORDER BY [addDate]">
            </asp:SqlDataSource>
            </td>
        </tr>
       
    </table>
</asp:Content>