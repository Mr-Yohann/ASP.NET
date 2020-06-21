<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3-2.aspx.cs" Inherits="EMS201724112141.WebForm3.WebForm3_2"  Debug="true" MasterPageFile="~/master/Site3.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    查询部门信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div id="search"><span>请输入查询的部门：</span><asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="150px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="搜索" Height="30px" Width="60px" />
    </div>
    <div id="view2">
        <div class="view-table" style="margin-bottom: 0px">
            <%
                string write = "";
                if(TextBox1.Text != "")
                {
                    write = Table1(); 
                }
                Response.Write(write);%>
        </div>
    </div>
</asp:Content>