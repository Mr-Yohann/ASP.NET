using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.WebForm1
{
    public partial class WebForm1_3 : System.Web.UI.Page
    {
        private myDBEntities myDBEntities = new myDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            int eq_id = Convert.ToInt32(TextBox1.Text);
            int result = 0;
            string fileName = "~/images/";

            try
            {
                equipment delete = myDBEntities.equipment.Single(id => id.eq_id == eq_id);
                fileName += delete.picture;
                myDBEntities.equipment.Remove(delete);
                result = myDBEntities.SaveChanges();
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.onload = function () {alert('删除失败，编号不存在');}</script>");
            }

            if (result > 0)
            {
                //文件是否存在
                if (File.Exists(fileName))
                {
                    //删除文件
                    File.Delete(fileName);
                }
                Response.Write("<script>window.onload = function () {alert('删除成功');}</script>");
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            int eq_id = Convert.ToInt32(TextBox1.Text);

            try
            {
                equipment update = myDBEntities.equipment.Single(id => id.eq_id == eq_id);

                Label2.Text = update.eq_id.ToString();
                TextBox2.Text = update.name;
                TextBox3.Text = update.specifications;
                TextBox4.Text = update.price.ToString();
                TextBox5.Text = update.date.ToString();
                TextBox6.Text = update.location;
                Response.Write("<script>window.onload = function () {$('#hid3').attr('style', 'display: none; ');$('.update').attr('style', 'display: block; ');}</script>");
                setDropDownList(update.ep_id);
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.onload = function () {alert('编号不存在');}</script>");
            }

        }

        public void setDropDownList(int ep_id)
        {
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
                string sql = "select * from employee";
                SqlCommand myCommand = new SqlCommand(sql, myConnection);

                SqlDataAdapter da = new SqlDataAdapter(myCommand);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "ep_id";
                DropDownList1.DataBind();
                DropDownList1.SelectedValue = ep_id.ToString();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                myConnection.Close();//关闭连接
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int eq_id = Convert.ToInt32(Label2.Text);
            string path = "";

            equipment equipment = myDBEntities.equipment.Where(eq => eq.eq_id == eq_id).FirstOrDefault();
            if (equipment != null)
            {
                equipment.name = TextBox2.Text;
                equipment.specifications = TextBox3.Text;
                equipment.price = Convert.ToDouble(TextBox4.Text);
                equipment.date = Convert.ToDateTime(TextBox5.Text);
                equipment.ep_id = Convert.ToInt32(DropDownList1.SelectedValue);
                equipment.location = TextBox6.Text;

                // 重新命名文件名,避免重复和保密
                string exten = System.IO.Path.GetExtension(FileUpload1.FileName);//取扩展名
                string newFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + exten;//生成新的文件名

                path = "~/images/" + newFileName;//设置上传的目标虚拟路径

                if (FileUpload1.HasFile)//如果上传文件控件不为空,既有文件
                {
                    equipment.picture = newFileName;
                }
            }
            int result = myDBEntities.SaveChanges();

            if (result > 0)
            {
                FileUpload1.SaveAs(Server.MapPath(path));//保存图片
                Response.Write("<script>window.onload = function () {alert('修改成功');$('#hid3').attr('style', 'display: block; ');$('.update').attr('style', 'display: none; ');}</script>");
                TextBox1.Text = "";
            }
        }
    }
}