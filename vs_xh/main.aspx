<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .stylep
        {
            line-height: 150%;
            text-indent: 24pt;
            margin: 0;
            padding: 0;
            width: 310px;
        }
        .dataGridView
        {
            height:280px;
            margin-top: 0px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:636px; margin-right: 0px;">
        
        <tr valign="top">
        
          
            <td valign="top" style="width:314px;height:280px; border:1px dashed #adaaaa; padding:0px 1px 1px 0px;" rowspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="title" DataSourceID="SqlDataSource1" Width="100%"  
                    Height="100%" PageSize="8"  GridLines="None" RowStyle-Height="15px" 
                    CssClass="dataGridView" BorderWidth="0px">
                    <Columns>
                       
                        <asp:HyperLinkField DataNavigateUrlFields="title" 
                            DataNavigateUrlFormatString="~/pubperformce/showNoteDetial.aspx?title={0}" 
                            DataTextField="title" HeaderImageUrl="~/Styles/noteNew.jpg" />
                       
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
                    SelectCommand="SELECT [title] FROM [notice] ORDER BY [addDate]">
                </asp:SqlDataSource>
            </td>
       
            <td  style="border-left:1px dashed #adaaaa;border-right:1px dashed #adaaaa; border-top:1px dashed #adaaaa">                             
                <img border="0" height="30" src="Styles/jianjie.jpg" usemap="#Map" width="314" alt="简介" />                                            
                <map id="Map" name="Map">
                    <area alt="详情" coords="249,2,312, 21" href="pubperformce/aboutXh.aspx" shape="rect" />                   
                </map>
            </td>
        </tr>
        <tr>
            <td style="width:315px;height:150px; border-left:1px dashed #adaaaa;border-right:1px dashed #adaaaa; border-bottom:1px dashed #adaaaa; padding:0px 0px 1px 0px;">
                
                <p class="stylep" >
                    <span style="line-height: 150%;">
                    <span style="font-family: 宋体; font-size: 10pt;">
                    为了贯彻教育部“质量工程”和“创新工程”的精神，培养学生的科研意识和创新意识，现开展第十四届“星火基金”项目征集工作。凡具有北京工业大学正式学籍的在校本科生、留学生均有资格提出申请，获得项目基金。</span></span><span 
                        lang="EN-US" style="line-height: 150%; font-family: 宋体; font-size: 12pt"><o:p></o:p></span></p>
                <p class="stylep" >
                    <span style="line-height: 150%;">
                    <span style="font-family: 宋体; font-size: 10pt;">
                    星火基金分为普通项目和重点项目两类。普通项目为科技发明以及小型的科研创新项目；重点项目为科技含量及科研价值较高，要求发表论文或申请专利、软件著作权<span 
                        lang="EN-US">,</span>并希望进一步参加更高一级科技比赛的项目。</span></span></p>
                
            </td>
        </tr>
        
        
        <tr>
            <td colspan="2">
                <asp:Image ID="image1" runat="server" ImageUrl="~/Styles/mid2.jpg" />
            </td>                   
        </tr>
        <tr>
            <td colspan="2">
                <img border="0" height="30" src="Styles/result.jpg" usemap="#Map2" width="628" alt="成果展示" />
                <map id="Map2" name="Map2">
                    <area alt="详情" coords="528, 5, 589, 23" href="pubperformce/result.aspx" 
                        shape="rect" />                   
                </map>
            </td>
        </tr>
        <tr valign="top">
           <td colspan="2" style="width:628px;height:280px; border:1px dashed #adaaaa; padding:1px 1px 1px 0px;">
                <asp:GridView ID="pro" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2" BorderWidth="0px" 
                    GridLines="None" AllowPaging="True" PageSize="8"
                    Width="100%" CssClass="dataGridView">
                    <RowStyle Height="15px" />
                    <Columns> 
                        <asp:BoundField DataField="Gnum" 
                            SortExpression="Gnum" HeaderText="组号" >
                            <HeaderStyle HorizontalAlign="Left" Width="40px" Height="20px"/>
                            <ItemStyle Height="15px" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="ProName" HeaderText="项目名称" 
                            SortExpression="ProName" >
                            <HeaderStyle HorizontalAlign="Left" Width="480px" />
                            <ItemStyle Height="15px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProClass" HeaderText="项目类别" 
                            SortExpression="ProClass">
                            <HeaderStyle HorizontalAlign="Left" Width="60px" />
                            <ItemStyle Height="15px" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Gnum" 
                             DataNavigateUrlFormatString="~/pubperformce/showResultDetail.aspx?Gnum={0}" Text="详情" />
                    </Columns>


                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:xhMS1ConnectionString %>" 
                    
                    SelectCommand="SELECT [Gnum], [ProName], [ProClass] FROM [groupinfo] WHERE ([Outstanding] = @Outstanding)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="优秀项目" Name="Outstanding" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            
        </tr>
    </table>



</asp:Content>

