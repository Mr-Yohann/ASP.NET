using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm2
{
    public partial class WebForm2_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void Table1()
        {
            //使用linq+ef技术查询
            myDBEntities dBEntities = new myDBEntities();
            var result = dBEntities.employee;

            //设置表头
            string write = "<table id='table1' border=1 cellspacing=0 cellpadding=2>";
            write += "<tr>";
            write += "<td>员工编号</td>";
            write += "<td>员工姓名</td>";
            write += "<td>手机号</td>";
            write += "<td>是否为管理员</td>";
            write += "<td>部门编号</td>";
            write += "</tr>";

            //通过遍历 注入表格信息
            foreach (var employee in result)
            {
                write += "<tr>";
                write += "<td>" + employee.ep_id + "</td>";
                write += "<td>" + employee.name + "</td>";
                write += "<td>" + employee.phone + "</td>";
                write += "<td>" + employee.administrator + "</td>";
                write += "<td>" + employee.dp_id + "</td>";
                write += "</tr>";
            }
            write += "</table>";
            Response.Write(write);//响应表格到前端
        }
    }
}