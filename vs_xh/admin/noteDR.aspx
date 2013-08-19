<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="noteDR.aspx.cs" Inherits="admin_noteRD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td>
            <asp:DetailsView ID="DetailsView1" runat="server"  Width="100%" 
                AutoGenerateRows="False" DataKeyNames="title" 
                DataSourceID="SqlDataSource1" 
                onpageindexchanging="DetailsView1_PageIndexChanging">
                <Fields>
                    <asp:BoundField DataField="title" HeaderText="标题" ReadOnly="True" 
                        SortExpression="title" >
                        <HeaderStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="xueyuan" HeaderText="发布学院" 
                        SortExpression="xueyuan" />
                    <asp:BoundField DataField="addDate" HeaderText="发布时间" 
                        SortExpression="addDate" />
                    <asp:BoundField DataField="connect" HeaderText="内容" 
                        SortExpression="connect" />
                </Fields>
            </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ButtonEdit" runat="server" Text="删除" 
                    onclick="ButtonEdit_Click" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        SelectCommand="SELECT [title], [connect], [xueyuan], [addDate] FROM [notice] WHERE ([title] = @title) ORDER BY [addDate]">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="title" Name="title" 
                QueryStringField="title" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>