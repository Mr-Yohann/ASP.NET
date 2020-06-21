<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1-3.aspx.cs" Inherits="EMS201724112141.WebForm1.WebForm1_3"  Debug="true" MasterPageFile="~/master/Site1.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    更新设备信息
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
                <asp:GridView ID="GridView1" runat="server" font-size="20px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="eq_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="eq_id" HeaderText="设备编号" InsertVisible="False" ReadOnly="True" SortExpression="eq_id" />
                        <asp:BoundField DataField="name" HeaderText="设备名称" SortExpression="name" />
                        <asp:BoundField DataField="specifications" HeaderText="设备规格" SortExpression="specifications" />
                        <asp:BoundField DataField="picture" HeaderText="设备图片" SortExpression="picture" />
                        <asp:BoundField DataField="price" HeaderText="设备价格" SortExpression="price" />
                        <asp:BoundField DataField="date" HeaderText="购买日期" SortExpression="date" />
                        <asp:BoundField DataField="location" HeaderText="存放位置" SortExpression="location" />
                        <asp:BoundField DataField="ep_id" HeaderText="负责人" SortExpression="ep_id" />
                    </Columns>
                </asp:GridView> 
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [equipment]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="update" style="text-align:center;" hidden="hidden">
            <table class="main" style="width: 9%">
                <tr>
                    <td style="height: 34px; width: 127px;">
                        <asp:Label ID="Label3" runat="server" Height="30px" Text="设备编号：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:Label ID="Label2" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:Label ID="Label6" runat="server" Height="30px" Text="设备名称：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 34px; width: 127px;">
                        <asp:Label ID="Label7" runat="server" Height="30px" Text="设备规格：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:Label ID="Label8" runat="server" Height="30px" Text="设备图片：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="height: 34px; width: 108px;">
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="30px" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 127px">
                        <asp:Label ID="Label4" runat="server" Height="30px" Text="设备价格：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:TextBox ID="TextBox4" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                    <td style="width: 108px">
                        <asp:Label ID="Label9" runat="server" Height="30px" Text="购买日期：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:TextBox ID="TextBox5" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 127px">
                        <asp:Label ID="Label5" runat="server" Height="30px" Text="存放位置：" font-size="25px" Width="150px"></asp:Label>
                    </td>
                    <td style="width: 108px">
                        <asp:TextBox ID="TextBox6" runat="server" Height="30px" Width="120px" font-size="25px" ></asp:TextBox>
                    </td>
                    <td style="width: 108px">
                        <asp:Label ID="Label10" runat="server" Height="30px" Text="负责人：" font-size="25px" Width="150px"></asp:Label>
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
                    <td style="width: 108px">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    </asp:Content>