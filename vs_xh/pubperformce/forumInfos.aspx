<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="forumInfos.aspx.cs" Inherits="pubperformce_forumInfos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 130px;
        }
        .style3
        {
            height: 46px;
        }
                        
.manage_lines1 {
	border: 1px solid #7F9DB9;
	text-align: right;
}
        .manage_lines3 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-TOP: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid
}
.manage_lines2 {
	BORDER-RIGHT: #7F9DB9 1px solid; BORDER-LEFT: #7F9DB9 1px solid; BORDER-BOTTOM: #7F9DB9 1px solid;
	text-align: right;
}
        .style15
        {
            width: 600px;
            height: 122px;
            border-color: #3366FF;
        }
        .style10
        {
            width: 547px;
            height: 109px;
        }
        
        .style13
        {
            height: 34px;
            width: 274px;
        }
        .style14
        {
            height: 34px;
        }
            
        .style11
        {
            width: 274px;
        }
                
        .style16
        {
            width: 439px;
        }
        .style17
        {
            height: 34px;
            width: 258px;
        }
        .style18
        {
            height: 34px;
            width: 162px;
        }
        </style>
    <table style="width:100%;"align="center">
          <tr>
             <td><h2 align = "center">论坛信息管理</h2></td>
          </tr>

          <tr>
             <td>
               <table> 
                  <tr>
                    <td align="left">
                         
                      
                      <asp:Label ID="Label1" runat="server"  Font-Size="10pt" align="left"></asp:Label>
                     
                    </td>
                    <td class="style7" 
                         style="font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 15px" align="right">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      
                      <a href="NewUser.aspx">注册</a>&nbsp;
                      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">发布新帖</asp:LinkButton>                     
                    </td>
                 </tr>
               </table> 
             </td>                                                                                                                                                                                                                                                                                          
          </tr>
          <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" Font-Size="9pt" 
                                    onpageindexchanging="GridView2_PageIndexChanging"  
                                    onselectedindexchanging="GridView2_SelectedIndexChanging" PageSize="5" 
                                    style="text-align: center" Width="580px" BackColor="White" 
                                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                    Font-Strikeout="False" GridLines="Horizontal" DataKeyNames="plid" EnablePersistedSelection="True" >
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                          <Columns>
                                        <asp:BoundField DataField="plid" HeaderText="编号" />
                                        <asp:BoundField DataField="pltitle" HeaderText="标题" SortExpression="title" />
                                        <asp:BoundField DataField="forum_style" HeaderText="类别" SortExpression="forum_style" />
                                        <asp:BoundField DataField="Name" HeaderText="作者" SortExpression="Name" />
                                        <asp:BoundField DataField="pldates" HeaderText="时间" SortExpression="pldates" />
                                        <asp:BoundField DataField="hf_nums" HeaderText="回复数" SortExpression="hf_nums" />
                                        <asp:CommandField HeaderText="详细信息" ShowCancelButton="False" ShowHeader="True"
                                            ShowSelectButton="True" SelectText="查看" >
                                            <ControlStyle ForeColor="Blue" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>


              
               
               
             
              
             </td>
          </tr>     
    </table>
</asp:Content>

