<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1-1.aspx.cs" Inherits="EMS201724112141.WebForm1.WebForm1_1" Debug="true" MasterPageFile="~/master/Site1.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    查看设备信息
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
    <div id="view1">
        <div class="view-title">设备信息表</div>
        <div class="view-table"><%Table1();%></div>
    </div>
    <div class="view-img" hidden="hidden" onclick="hiddenView1Img()">
    </div>
</asp:Content>