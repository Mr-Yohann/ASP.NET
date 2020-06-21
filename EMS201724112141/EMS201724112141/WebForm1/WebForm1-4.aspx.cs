using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm1
{
    public partial class WebForm1_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //获取输入内容
            string name = TextBox3.Text;
            string specifications = TextBox4.Text;
            string price = TextBox5.Text;
            string date = TextBox6.Text;
            string location = TextBox7.Text;
            string picture = "";

            // 重新命名文件名,避免重复和保密
            string exten = System.IO.Path.GetExtension(FileUpload1.FileName);//取扩展名
            string newFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + exten;//生成新的文件名

            string path = "~/images/" + newFileName;//设置上传的目标虚拟路径

            if (FileUpload1.HasFile)//如果上传文件控件不为空,既有文件
            {
                picture = newFileName;
            }

            if (name != "" && specifications != "" && price != "" && date != "" && picture != "" && location != "")
            {
                //创建实体类对象 并且赋值
                equipment equipment = new equipment();
                equipment.name = name;
                equipment.specifications = specifications;
                equipment.price = Convert.ToDouble(price);
                equipment.date = Convert.ToDateTime(date);
                equipment.location = location;
                equipment.picture = picture;
                equipment.ep_id = Convert.ToInt32(Session["id"]);

                //通过linq技术 把实体类对象添加到数据库中
                myDBEntities myDBEntities = new myDBEntities();
                myDBEntities.equipment.Add(equipment);
                int result = myDBEntities.SaveChanges();

                //通过执行添加操作的返回值 判断添加是否成功
                if (result > 0)
                {
                    Label1.Text = "添加成功";
                    FileUpload1.SaveAs(Server.MapPath(path));//保存图片
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