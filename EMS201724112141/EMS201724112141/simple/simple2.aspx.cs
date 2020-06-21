using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.simple
{
    public partial class simple2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string Table1()
        {
            //获取输入的信息
            string name = TextBox1.Text;
            string phone = TextBox2.Text;
            string super = RadioButtonList1.SelectedValue;
            string dp = "";
            if (CheckBox1.Checked)
            {
                dp = ListBox1.SelectedValue;
            }

            string write = "";//设定返回的字符串

            //数据库连接字段
            String sqlconn = "Data Source=(LocalDB)\\MSSQLLocalDB;" +
                             "AttachDbFilename=|DataDirectory|myDB.mdf;" +
                             "Integrated Security=True";
            //新建连接
            SqlConnection myConnection = new SqlConnection(sqlconn);

            try
            {
                //打开数据库连接
                myConnection.Open();

                //设定SQL叙述
                string sql = "select ep_id, name, phone, administrator, dp_id from employee where 1 = 1 ";
                if (name != "")
                    sql += "and name = N'" + name + "'";
                if (phone != "")
                    sql += "and phone = '" + phone + "'";
                if (super != "")
                    sql += "and administrator = '" + super + "'";
                if (dp != "")
                    sql += "and dp_id = '" + dp + "'";

                //执行sql语句
                SqlCommand myCommand = new SqlCommand(sql, myConnection);

                //创建查询的结果集，用另一个封装的方法,ExecuteReader
                SqlDataReader read = myCommand.ExecuteReader();

                write += "<table id='table1' border=1 cellspacing=0 cellpadding=2>";
                write += "<tr>";
                write += "<td>员工编号</td>";
                write += "<td>员工姓名</td>";
                write += "<td>手机号</td>";
                write += "<td>是否为管理员</td>";
                write += "<td>部门编号</td>";
                write += "</tr>";

                if (read.HasRows)
                {
                    //通过遍历 把数据输入表格
                    while (read.Read())
                    {
                        write += "<tr>";
                        write += "<td>" + read[0] + "</td>";
                        write += "<td>" + read[1] + "</td>";
                        write += "<td>" + read[2] + "</td>";
                        write += "<td>" + read[3] + "</td>";
                        write += "<td>" + read[4] + "</td>";
                        write += "</tr>";
                    }
                    write += "</table>";
                }
                else
                {
                    write = "<span style='margin-left:-45%;'>没有查到相关数据！<span>";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                //关闭连接
                myConnection.Close();
            }
            return write;
        }
    }
}