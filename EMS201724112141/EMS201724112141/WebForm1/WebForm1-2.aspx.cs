using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm1
{
    public partial class WebForm1_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        public string Table1()
        {
            //获取输入信息
            string name = TextBox1.Text;
            string specifications = TextBox2.Text;
            string price = TextBox3.Text;
            string date = TextBox4.Text;
            string location = TextBox5.Text;
            string ep_id = "";
            if (CheckBox1.Checked)
            {
                ep_id = ListBox1.SelectedValue;
            }

            string write = "";//设定返回字符串

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
                string sql = "select * from equipment where 1=1 ";
                if(name != "")
                    sql += " and name = N'" + name + "'";
                if (specifications != "")
                    sql += " and specifications = N'" + specifications + "'";
                if (price != "")
                    sql += " and price = '" + price + "'";
                if (date != "")
                    sql += " and date = '" + date + "'";
                if (location != "")
                    sql += " and location = N'" + location + "'";
                if (ep_id != "")
                    sql += " and ep_id = '" + ep_id + "'";

                //执行sql语句
                SqlCommand myCommand = new SqlCommand(sql, myConnection);

                //创建查询的结果集，用另一个封装的方法,ExecuteReader
                SqlDataReader read = myCommand.ExecuteReader();

                write += "<table id='table1' border=1 cellspacing=0 cellpadding=2>";
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

                if (read.HasRows)
                {
                    //通过遍历 把数据输入表格
                    while (read.Read())
                    {
                        write += "<tr>";
                        write += "<td>" + read[0] + "</td>";
                        write += "<td>" + read[1] + "</td>";
                        write += "<td>" + read[2] + "</td>";
                        write += "<td><a onclick='work2(this)'>" + read[3] + "</a></td>";
                        write += "<td>" + read[4] + "</td>";
                        write += "<td>" + read[5] + "</td>";
                        write += "<td>" + read[6] + "</td>";
                        write += "<td>" + read[7] + "</td>";
                        write += "</tr>";
                    }
                    write += "</table>";
                }
                else
                {
                    write = "没有查到相关数据！";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                myConnection.Close();//关闭连接
            }
            return write;
        }
    }
}