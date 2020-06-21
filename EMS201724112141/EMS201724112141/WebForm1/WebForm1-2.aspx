<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1-2.aspx.cs" Inherits="EMS201724112141.WebForm1.WebForm1_2"  Debug="true" MasterPageFile="~/master/Site1.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <table class="main" style="width: 83%;font-size:30px;margin-left:12%;margin-bottom:20px;">
            <tr>
                <td class="auto-style3">设备名称：</td>
                <td style="width: 150px"><asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style3">设备规格：</td>
                <td style="width: 150px"><asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">设备价格:</td>
                <td style="width: 150px">
                    <asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="150px"></asp:TextBox>
                    <td class="auto-style3">购买日期：</td>
                <td style="width: 60px"><asp:TextBox ID="TextBox4" runat="server" Height="30px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">存放位置：</td>
                <td style="width: 150px">
                    <asp:TextBox ID="TextBox5" runat="server" Height="30px" Width="150px"></asp:TextBox>
                    <td class="auto-style3">负责人：</td>
                <td colspan="2">
                    <asp:CheckBox ID="CheckBox1" runat="server"  Height="40px" Width="20px" />
                    <asp:ListBox ID="ListBox1" runat="server" Height="40px" Rows="1" Font-Size="30px" Width="125px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="ep_id"></asp:ListBox>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ep_id], [name] FROM [employee]"></asp:SqlDataSource>
    
    <div id="search">
        <asp:Button ID="Button1" font-size="30px" runat="server" Text="搜索" Height="45px" Width="80px" />
    </div>
    <div id="view2">
        <div class="view-table">
            <%
                string write = "";
                //判断是否有输入内容
                if(TextBox1.Text != "" || TextBox2.Text != "" || TextBox3.Text != "" || TextBox4.Text != "" || TextBox5.Text != "" || CheckBox1.Checked == true)
                {
                    write = Table1(); 
                }
                Response.Write(write);%>
        </div>
        <div class="view-img" hidden="hidden" onclick="hiddenView1Img2()">
        </div>
    </div>
    <style type="text/css">
        .auto-style3 {
            width: 85px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    查询设备信息
    </asp:Content>
