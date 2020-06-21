<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="simple3.aspx.cs" Inherits="EMS201724112141.simple.simple3"  Debug="true" MasterPageFile="~/master/Site4.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    查询部门信息
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="rightContentPlaceHolder" runat="server">
    <div id="search" style="margin-top:5%;"><span>请输入查询的部门：</span><asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="150px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="搜索" Height="30px" Width="60px" />
    </div>
    <div id="view2">
        <div class="view-table" style="margin-bottom: 0px">
            <%
                string write = "";
                write = Table1(); 
                Response.Write(write);%>
        </div>
    </div>
    <style>
        #view2 {
            margin-top: 50px;
            text-align: center;
        }

        #search {
            text-align: center;
            font-size: 30px;
        }

        #view2 .view-table {
            margin-left: 25%;
        }
    </style>
</asp:Content>