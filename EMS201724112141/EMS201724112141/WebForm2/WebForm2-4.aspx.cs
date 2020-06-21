using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm2
{
    public partial class WebForm2_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //获取输入的信息
            string password = TextBox3.Text;
            string phone = "";
            string name = TextBox4.Text;
            bool super = checkbox.Checked;
            string dp_id = DropDownList1.SelectedValue;

            //判断手机号是否为11位
            if (TextBox5.Text.Length == 11)
            {
                phone = TextBox5.Text;
            }
            
            //判断输入是否为空
            if (name != "" && password != "" && phone != "" && dp_id != "")
            {
                //创建实体类对象
                employee employee = new employee();
                employee.password = password;
                employee.name = name;
                employee.phone = phone;
                employee.administrator = super;
                employee.dp_id = Convert.ToInt32(dp_id);

                //利用linq技术把实体类对象添加到数据库
                myDBEntities myDBEntities = new myDBEntities();
                myDBEntities.employee.Add(employee);
                int result = myDBEntities.SaveChanges();

                //通过执行添加操作的返回值判断是否添加成功
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
                if(phone == "")
                {

                    Label1.Text = "请正确填写手机号";
                }
                else
                {
                    Label1.Text = "请输入添加的信息!";
                }
            }
        }
    }
}