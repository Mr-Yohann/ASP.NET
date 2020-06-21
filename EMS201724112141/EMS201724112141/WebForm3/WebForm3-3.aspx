<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3-3.aspx.cs" Inherits="EMS201724112141.WebForm3.WebForm3_3"  Debug="true" MasterPageFile="~/master/Site3.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    更新部门信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div id="view3">
        <div id="hid3">
            <div id="operation">
                <asp:Label ID="Label1" runat="server" font-size="30px" Text="请输入编号："></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Height="30px" font-size="25px" Width="120px"></asp:TextBox>
                &nbsp;<asp:Button ID="delete" runat="server" Height="40px"  font-size="25px" Text="删除" Width="70px" OnClick="delete_Click" />
                &nbsp;<asp:Button ID="update" runat="server" Height="40px"  font-size="25px" Text="修改" Width="70px" OnClick="update_Click" />
            </div>
            <div id="table3">
                <%Table1(); %>
            </div>
        </div>
        <div class="update" style="text-align:center;" hidden="hidden">
            <table class="main" style="width: 9%">
                <tr>
                    <td style="height: 34px; width: 127px;">
                        <asp:Label ID="Label3" runat="server" Height="30px" Text="部门编号：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:Label ID="Label2" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 127px">
                        <asp:Label ID="Label4" runat="server" Height="30px" Text="部门名称：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 127px">
                        <asp:Label ID="Label5" runat="server" Height="30px" Text="部门主管：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" font-size="25px" Width="120px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button3" runat="server" Height="35px" font-size="25px" Text="确认" Width="80px" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>