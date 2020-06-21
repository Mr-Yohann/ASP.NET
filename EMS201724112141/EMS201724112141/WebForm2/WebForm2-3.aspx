<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2-3.aspx.cs" Inherits="EMS201724112141.WebForm2.WebForm2_3" Debug="false" MasterPageFile="~/master/Site2.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    更新员工信息
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
                <asp:GridView ID="GridView1" runat="server" font-size="30px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ep_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ep_id" HeaderText="员工编号" InsertVisible="False" ReadOnly="True" SortExpression="ep_id" />
                        <asp:BoundField DataField="password" HeaderText="登录密码" SortExpression="password" />
                        <asp:BoundField DataField="name" HeaderText="员工姓名" SortExpression="name" />
                        <asp:BoundField DataField="phone" HeaderText="手机号" SortExpression="phone" />
                        <asp:CheckBoxField DataField="administrator" HeaderText="是否为管理员" SortExpression="administrator" />
                        <asp:BoundField DataField="dp_id" HeaderText="部门编号" SortExpression="dp_id" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="update" style="text-align:center;"  hidden="hidden">
            <table class="main" style="width: 37%">
                <tr>
                    <td style="height: 34px; width: 127px;">
                        <asp:Label ID="Label3" runat="server" Height="30px" Text="员工编号：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:Label ID="Label2" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:Label ID="Label6" runat="server" Height="30px" Text="登录密码：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 127px">
                        <asp:Label ID="Label4" runat="server" Height="30px" Text="员工姓名：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                    <td style="width: 108px">
                        <asp:Label ID="Label7" runat="server" Height="30px" Text="手机号码：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:TextBox ID="TextBox4" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 127px">
                        <asp:Label ID="Label5" runat="server" Height="30px" Text="管理人员：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </td>
                    <td style="width: 108px">
                        <asp:Label ID="Label8" runat="server" Height="30px" Text="部门编号：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" font-size="25px" Width="120px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 39px">
                        <asp:Button ID="Button3" runat="server" Height="35px" font-size="25px" Text="确认" Width="80px" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </asp:Content>