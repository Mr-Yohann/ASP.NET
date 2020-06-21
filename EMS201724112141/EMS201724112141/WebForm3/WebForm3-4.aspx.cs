using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm3
{
    public partial class WebForm3_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //获取输入内容
            string name = TextBox3.Text;

            if (name != "")
            {
                //创建实体类对象
                department department = new department();
                department.name = name;

                //通过linq技术添加对象到数据库
                myDBEntities myDBEntities = new myDBEntities();
                myDBEntities.department.Add(department);
                int result = myDBEntities.SaveChanges();

                //通过执行返回值判断是否添加成功
                if (result > 0)
                {
                    Label1.Text = "添加成功";
                }
                else
                {
                    Label1.Text = "添加失败";
                }
            }
            else
            {
                Label1.Text = "请输入添加的信息!";
            }
        }
    }
}