using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //获取输入信息
            string id = TextBox1.Text;
            string password = TextBox2.Text;

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
                string sql = "select * from employee where ep_id = '" + id + "' and password = '" + password + "'";
                SqlCommand myCommand = new SqlCommand(sql, myConnection);

                //创建查询的结果集，用另一个封装的方法,ExecuteReader
                SqlDataReader read = myCommand.ExecuteReader();

                int flag = 0;
                //通过遍历 设置session
                while (read.Read())
                {
                    Session["id"] = read[0];//设置员工编号session
                    Session["name"] = read[2];//设置名字session
                    if (Convert.ToBoolean(read[4]))
                    {
                        Session["super"] = read[4];//设置管理员session
                        Response.Redirect("~/index.aspx");//跳转到主页
                    }
                    else
                    {
                        Response.Redirect("~/simple/simpleIndex.aspx");
                    }
                    flag++;
                }
                if(flag == 0)
                {
                    Label1.Text = "密码错误，登录失败";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "登录失败";
                Response.Write(ex.Message);
            }
            finally
            {
                myConnection.Close();//关闭连接
            }
        }
    }
}