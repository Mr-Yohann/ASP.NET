<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2-2.aspx.cs" Inherits="EMS201724112141.WebForm2.WebForm2_2"  Debug="false" MasterPageFile="~/master/Site2.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    查询员工信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <table class="main" style="width: 83%;font-size:30px;margin-left:12%;margin-bottom:20px;">
            <tr>
                <td style="width: 63px">名字：</td>
                <td style="width: 150px"><asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="150px"></asp:TextBox>
                </td>
                <td style="width: 60px">手机：</td>
                <td style="width: 150px"><asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 63px">管理员:</td>
                <td style="width: 150px"><span><asp:RadioButtonList ID="RadioButtonList1" Font-Size="30px" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="true">是</asp:ListItem>
            <asp:ListItem Value="false">否</asp:ListItem>
        </asp:RadioButtonList></span>
                </td>
                <td style="width: 60px">部门：</td>
                <td style="width: 150px">
                    <asp:CheckBox ID="CheckBox1" runat="server" Height="40px" Width="20px" />
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="dp_id" Height="40px" Font-Size="30px" Width="125px" Rows="1"></asp:ListBox>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [dp_id], [name] FROM [department]"></asp:SqlDataSource>

    <div id="search">
        <asp:Button ID="Button1" font-size="30px" runat="server" Text="搜索" Height="45px" Width="80px" />
    </div>
    <div id="view2">
        <div class="view-table" style="margin-bottom: 0px">
            <%
                string write = "";
                //判断是否有输入内容
                if(TextBox1.Text != "" || TextBox2.Text != "" || RadioButtonList1.SelectedValue != "" || CheckBox1.Checked == true)
                {
                    write = Table1(); 
                }
                Response.Write(write);%>
        </div>
    </div>
</asp:Content>