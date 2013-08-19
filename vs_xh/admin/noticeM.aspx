<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="noticeM.aspx.cs" Inherits="admin_noticeMagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating" 
                OnRowDeleting="GridView1_RowDeleting"
                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="标题" SortExpression="title" >
                        <HeaderStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="addDate" HeaderText="发布时间" 
                        SortExpression="addDate" >
                        <HeaderStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="xueyuan" HeaderText="学院" 
                        SortExpression="xueyuan" >
                        <HeaderStyle Width="100px" />
                    </asp:BoundField>

                        

                    <asp:TemplateField HeaderText="详细信息">   
                        <HeaderStyle Width="240px" />              
                        <ItemTemplate>
                        <%# GetVarStr(DataBinder.Eval(Container.DataItem,"connect").ToString()) %>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:HyperLinkField DataNavigateUrlFields="title" 
                        DataNavigateUrlFormatString="~/admin/noteDR.aspx?title={0}" Text="详细（删除）" >
                        <HeaderStyle Width="100px" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
                SelectCommand="SELECT [title], [addDate], [xueyuan], [connect] FROM [notice] ORDER BY [addDate]" 
                onselecting="SqlDataSource1_Selecting">
            </asp:SqlDataSource>
        </tr>
        <tr>
            <td><asp:Button ID="add" runat="server" Text="新增" OnClick="add_Click"/></td>           
        </tr>
    </table>
</asp:Content>

