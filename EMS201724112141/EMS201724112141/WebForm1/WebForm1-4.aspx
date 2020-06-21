<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1-4.aspx.cs" Inherits="EMS201724112141.WebForm1.WebForm1_4"  Debug="true" MasterPageFile="~/master/Site1.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    添加设备信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div class="view-title">添加设备信息</div>
    <div id="add">
        <table class="auto-style3">
            <tr>
                <td class="auto-style1">设备名称：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">设备规格：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">设备图片：</td>
                <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" Width="150px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">设备价格：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">购买日期：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox6" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">存放位置：</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox7" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            </table>
    </div>
    <div id="view4-bottom">
        <asp:Button ID="Button2" runat="server" Text="添加" Height="40px" Width="80px" OnClick="Button2_Click"/><br />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
