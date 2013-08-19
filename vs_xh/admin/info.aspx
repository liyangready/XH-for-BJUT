<%@ Page Title="" Language="C#" MasterPageFile="~/houtaiSite.master" AutoEventWireup="true" CodeFile="info.aspx.cs" Inherits="admin_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource2"  Width="100%" AllowPaging="True" 
        OnItemCommand="GoodDetailsView1_ItemCommand"  >
        <Fields>
            <asp:BoundField DataField="Gnum" HeaderText="项目编号" SortExpression="Gnum"  >
                <HeaderStyle Width="85px" />
            </asp:BoundField>          
            <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                SortExpression="ProName" >

            </asp:BoundField>          
            <asp:BoundField DataField="Teacher" HeaderText="指导教师" 
                SortExpression="Teacher" >
            </asp:BoundField> 
            <asp:BoundField DataField="ProClass" HeaderText="项目类别" 
                SortExpression="ProClass">
            </asp:BoundField> 
            <asp:BoundField DataField="ProType" HeaderText="项目类型" 
                SortExpression="ProType">
            </asp:BoundField> 
            <asp:BoundField DataField="Proinfo" HeaderText="项目详细信息" 
                SortExpression="Proinfo" >
            </asp:BoundField> 
            <asp:BoundField DataField="Outstanding" HeaderText="是否为优秀项目" 
                SortExpression="Outstanding" >
            </asp:BoundField>  
            
            <asp:ButtonField ShowHeader="True" CommandName="pass1" HeaderText="是否同意该组为优秀项目"  Text="同意" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
        
        SelectCommand="SELECT [Gnum], [ProName], [Teacher], [ProClass], [ProType], [Proinfo], [Outstanding] FROM [groupinfo] WHERE ([Gnum] = @Gnum)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Gnum" QueryStringField="Gno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
   
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="返回" 
        Width="67px" />
</asp:Content>

