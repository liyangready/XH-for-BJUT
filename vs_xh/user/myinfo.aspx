<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="myinfo.aspx.cs" Inherits="user_myselfinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul id="MenuBar1" class="MenuBarVertical">
        <li>
          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Styles/zhuce.jpg" 
                onclick="ImageButton1_Click" BorderWidth="0px" Width="100px" Height="35px"    />
        </li>
        <li>          
          <asp:Image ID="Image4" runat="server" ImageUrl="~/Styles/xiaozu.jpg" BorderWidth="0px" Width="100px" Height="35px"  />
            <ul>
              <li>
                  <asp:ImageButton ID="ImageButton5" runat="server" 
                      ImageUrl="~/Styles/tianjia.jpg" BorderWidth="0px" 
                      onclick="ImageButton5_Click" Width="80px" Height="25px" /></li>
              <li>
                  <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Styles/xinzu.jpg" 
                      BorderWidth="0px" onclick="ImageButton6_Click" Width="80px" Height="25px"  />
                </li>
              <li>
                  <asp:ImageButton ID="ImageButton7" ImageUrl="~/Styles/guanli.jpg" 
                      BorderWidth="0px"  runat="server" onclick="ImageButton7_Click" Width="80px" Height="25px" />
                </li>
            </ul>
          
        </li>
        <li><asp:Image  ImageUrl="~/Styles/xiangmu.jpg" ID="ImageZu" runat="server" BorderWidth="0px" Width="100px" Height="35px" />
            <ul>
                <li>
                    <asp:ImageButton ID="ImageButton8" ImageUrl="~/Styles/shangchuan.jpg" 
                        BorderWidth="0px"  runat="server" onclick="ImageButton8_Click" Width="80px" Height="25px" />
                </li>
                <li>
                    <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Styles/xinxi.jpg" 
                        BorderWidth="0px" onclick="ImageButton9_Click" Width="80px" Height="25px" />
                </li>
            </ul>
        </li>
        <li>
            <asp:ImageButton ID="ImageButton4" ImageUrl="~/Styles/book.jpg" runat="server" BorderWidth="0px" 
                onclick="ImageButton4_Click" Width="100px" Height="35px" />
        </li>
    </ul>
</asp:Content>

