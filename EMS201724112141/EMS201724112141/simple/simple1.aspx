<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="simple1.aspx.cs" Inherits="EMS201724112141.simple.simple1"  Debug="true" MasterPageFile="~/master/Site4.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    查询设备信息
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="rightContentPlaceHolder" runat="server">
    <table class="main" style="width: 83%;font-size:30px;margin-left:12%;margin-bottom:20px;margin-top:5%;">
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
                write = Table1(); 
                Response.Write(write);%>
        </div>
        <div class="view-img" hidden="hidden" onclick="hiddenView1Img2()">
        </div>
    </div>
    <style type="text/css">
        .auto-style3 {
            width: 85px;
        }
        #view2 {
            margin-top: 20px;
            margin-left: 2%;
        }
        #search {
            text-align:center;
            font-size:30px;
        }
    </style>
    <script>
        function work2(target) {
            $(".view-table").attr("style", "display:none;");//隐藏div
            $(".view-img").attr("style", "display:block;");//显示div
            $(".view-img").html("<br> <img src = '../images/" + $(target).text() + "' /> ");
        };
        function hiddenView1Img2() {
            $(".view-table").attr("style", "display:block;");//隐藏div
            $(".view-img").attr("style", "display:none;");//显示div
        };
    </script>
</asp:Content>