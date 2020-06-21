using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm3
{
    public partial class WebForm3_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void Table1()
        {
            //通过linq+ef技术查询
            myDBEntities dBEntities = new myDBEntities();
            var result = from dp in dBEntities.department
                         join ep in dBEntities.employee
                         on dp.ep_id equals ep.ep_id
                         select new { department = dp, employee = ep };

            //设置表头
            string write = "<table id='table1' border=1 cellspacing=0 cellpadding=2>";
            write += "<tr>";
            write += "<td>部门编号</td>";
            write += "<td>部门名称</td>";
            write += "<td>主管编号</td>";
            write += "<td>主管姓名</td>";
            write += "<td>主管手机号</td>";
            write += "</tr>";

            //遍历 填充数据
            foreach (var a in result)
            {
                write += "<tr>";
                write += "<td>" + a.department.dp_id + "</td>";
                write += "<td>" + a.department.name + "</td>";
                write += "<td>" + a.department.ep_id + "</td>";
                write += "<td>" + a.employee.name + "</td>";
                write += "<td>" + a.employee.phone + "</td>";
                write += "</tr>";
            }
            write += "</table>";
            Response.Write(write);
        }
    }
}