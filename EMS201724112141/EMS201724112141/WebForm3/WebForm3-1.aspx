<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3-1.aspx.cs" Inherits="EMS201724112141.WebForm3.WebForm3_1"  Debug="true" MasterPageFile="~/master/Site3.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    查看部门信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div id="view1">
        <div class="view-title">员工信息表</div>
        <div class="view-table"><%Table1();%></div>
    </div>
</asp:Content>