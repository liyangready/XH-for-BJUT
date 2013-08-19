<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="aboutXh.aspx.cs" Inherits="pubperformce_aboutXh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="~/App_Themes/StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
                    SelectCommand="SELECT * FROM [introduction]"></asp:SqlDataSource>
                
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        connect:
                        <asp:TextBox ID="connectTextBox" runat="server" Text='<%# Bind("connect") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        connect:
                        <asp:TextBox ID="connectTextBox" runat="server" Text='<%# Bind("connect") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="插入" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        
                        <asp:Label ID="titleLabel"  runat="server" Font-Bold="true" Font-Size="Larger"  Text='<%# Bind("title") %>' />
                        <br />
                        
                        <asp:Label ID="connectLabel" runat="server" Text='<%# Bind("connect") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                
            </td> 
        </tr>
    </table>
</asp:Content>

