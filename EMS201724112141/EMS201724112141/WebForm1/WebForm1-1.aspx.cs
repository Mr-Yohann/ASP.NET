using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm1
{
    public partial class WebForm1_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void Table1()
        {
            //使用linq+ef查询
            myDBEntities dBEntities = new myDBEntities();
            var result = dBEntities.equipment;

            //设置表头
            string write = "<table id='table1' border=1 cellspacing=0 cellpadding=2>";
            write += "<tr>";
            write += "<td>设备编号</td>";
            write += "<td>设备名称</td>";
            write += "<td>设备规格</td>";
            write += "<td>设备图片</td>";
            write += "<td>设备价格</td>";
            write += "<td>购买日期</td>";
            write += "<td>存放位置</td>";
            write += "<td>负责人</td>";
            write += "</tr>";

            //通过遍历 设置表中的数据
            foreach (var equipment in result)
            {
                write += "<tr>";
                write += "<td>" + equipment.eq_id + "</td>";
                write += "<td>" + equipment.name + "</td>";
                write += "<td>" + equipment.specifications + "</td>";
                //图片名称通过a标签包裹 前端通过js实现显示图片
                write += "<td><a onclick='work(this)'>" + equipment.picture + "</a></td>";
                write += "<td>" + equipment.price + "</td>";
                write += "<td>" + equipment.date + "</td>";
                write += "<td>" + equipment.location + "</td>";
                write += "<td>" + equipment.ep_id + "</td>";
                write += "</tr>";
            }
            write += "</table>";
            Response.Write(write);//响应整个表格
        }
    }
}