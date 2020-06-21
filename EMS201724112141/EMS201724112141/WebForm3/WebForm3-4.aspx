<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3-4.aspx.cs" Inherits="EMS201724112141.WebForm3.WebForm3_4"  Debug="true" MasterPageFile="~/master/Site3.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    添加部门信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div class="view-title">添加部门信息</div>
    <div id="add">
        <table class="auto-style3">
            <tr>
                <td class="auto-style1" style="height: 35px">部门名称：</td>
                <td class="auto-style2" style="height: 35px">
                    <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            </table>
    </div>
    <div id="view4-bottom">
        <asp:Button ID="Button2" runat="server" Text="添加" Height="40px" Width="80px" OnClick="Button2_Click"/><br />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ep_id], [name] FROM [employee] WHERE ([administrator] = @administrator)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="administrator" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>