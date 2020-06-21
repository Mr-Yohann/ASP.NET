<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2-4.aspx.cs" Inherits="EMS201724112141.WebForm2.WebForm2_4"  Debug="true" MasterPageFile="~/master/Site2.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    添加员工信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div class="view-title">添加员工信息</div>
    <div id="add">
        <table class="auto-style3">
            <tr>
                <td class="auto-style1" style="height: 35px">密码：</td>
                <td class="auto-style2" style="height: 35px">
                    <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">名字：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">手机：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">管理员：</td>
                <td class="auto-style2">
                    <asp:CheckBox ID="checkbox" runat="server" Text="是" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">部门：</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="20px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="dp_id" Height="30px" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
    </div>
    <div id="view4-bottom">
        <asp:Button ID="Button2" runat="server" Text="添加" Height="40px" Width="80px" OnClick="Button2_Click"/><br />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [dp_id], [name] FROM [department]"></asp:SqlDataSource>
    </div>
</asp:Content>