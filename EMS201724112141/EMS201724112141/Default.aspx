<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EMS201724112141.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
</head>
<body style="width:100%;background-color:#F5F5F5;">
    <form id="form1" runat="server">
        <div class="container">
          <div  style="text-align:center;margin-top:10%;margin-bottom:10%;">
            <h1>设备管理系统</h1>
          </div>

            <div class="row">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4" style="font-size:30px;margin-top:5%;margin-bottom:5%;">
                    账号：<asp:TextBox ID="TextBox1" runat="server" Height="40px" Width="200px" Font-Size="20px"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4"  style="font-size:30px;">
                    密码：<asp:TextBox ID="TextBox2" runat="server" Height="40px" Width="200px" Font-Size="20px"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4"  style="font-size:30px;text-align:center;margin-top:5%;margin-bottom:5%;">
                    <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click"/>
                </div>
                <div class="col-sm-4">
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4"  style="font-size:30px;text-align:center;">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="col-sm-4">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
