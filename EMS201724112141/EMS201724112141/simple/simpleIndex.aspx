<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="simpleIndex.aspx.cs" Inherits="EMS201724112141.simple.simpleIndex" Debug="true" MasterPageFile="~/master/Site4.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    欢迎使用设备管理系统
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="rightContentPlaceHolder" runat="server">
    <%string name = Session["name"].ToString();
        int time = Convert.ToInt32(DateTime.Now.ToString("HHmm"));
        string greetings = "";

        //根据系统时间呈现不同的问候语
        if(time >= 600 && time < 1130)
        {
            greetings = "早上好！";
        }
        else if(time >= 1130 && time < 1850)
        {
            greetings = "下午好！";
        }
        else
        {
            greetings = "晚上好！";
        }
        %>
    <div id="greetings"><%=name+greetings %></div>
    <div id="welcome">欢迎使用设备管理系统</div>
    <style>
        #greetings{
            text-align:center;
            font-size:40px;
            margin-top:15%;
            margin-bottom:10%;
        }
        #welcome{
            font-size:60px;
            margin-top:40px;
            margin-bottom:40px;
            text-align:center;
        }
    </style>
</asp:Content>