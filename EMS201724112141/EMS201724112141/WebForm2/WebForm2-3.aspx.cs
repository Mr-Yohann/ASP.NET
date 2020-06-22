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
    public partial class WebForm2_3 : System.Web.UI.Page
    {
        private myDBEntities myDBEntities = new myDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Table1()
        {
            var result = myDBEntities.employee;

            //设置表头
            string write = "<table id='table1' border=1 cellspacing=0 cellpadding=2  style='font-size:30px'>";
            write += "<tr>";
            write += "<td>员工编号</td>";
            write += "<td>员工姓名</td>";
            write += "<td>登录密码</td>";
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
                write += "<td>" + employee.password + "</td>";
                write += "<td>" + employee.phone + "</td>";
                write += "<td>" + employee.administrator + "</td>";
                write += "<td>" + employee.dp_id + "</td>";
                write += "</tr>";
            }
            write += "</table>";
            Response.Write(write);//响应表格到前端
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            int ep_id = Convert.ToInt32(TextBox1.Text);
            int result = 0;

            try
            {
                employee delete = myDBEntities.employee.Single(id => id.ep_id == ep_id);
                myDBEntities.employee.Remove(delete);
                result = myDBEntities.SaveChanges();
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.onload = function () {alert('删除失败，编号不存在');}</script>");
            }

            if (result > 0)
            {
                Response.Redirect("~/WebForm2/WebForm2-3.aspx");
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            int ep_id = Convert.ToInt32(TextBox1.Text);

            try
            {
                employee update = myDBEntities.employee.Single(id => id.ep_id == ep_id);

                Label2.Text = update.ep_id.ToString();
                TextBox3.Text = update.password;
                TextBox2.Text = update.name;
                TextBox4.Text = update.phone;
                CheckBox1.Checked = update.administrator;
                Response.Write("<script>window.onload = function () {$('#hid3').attr('style', 'display: none; ');$('.update').attr('style', 'display: block; ');}</script>");
                setDropDownList(update.dp_id);
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.onload = function () {alert('编号不存在');}</script>");
            }
        }

        public void setDropDownList(int dp_id)
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
                string sql = "select * from department";
                SqlCommand myCommand = new SqlCommand(sql, myConnection);

                SqlDataAdapter da = new SqlDataAdapter(myCommand);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "dp_id";
                DropDownList1.DataBind();
                DropDownList1.SelectedValue = dp_id.ToString();
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
            int ep_id = Convert.ToInt32(Label2.Text);
            employee employee = myDBEntities.employee.Where(ep => ep.ep_id == ep_id).FirstOrDefault();
            if (employee != null)
            {
                employee.name = TextBox2.Text;
                employee.password = TextBox3.Text;
                employee.phone = TextBox4.Text;
                employee.administrator = CheckBox1.Checked;
                employee.dp_id = Convert.ToInt32(DropDownList1.SelectedValue);
            }
            int result = myDBEntities.SaveChanges();

            if (result > 0)
            {
                Response.Write("<script>window.onload = function () {alert('修改成功');$('#hid3').attr('style', 'display: block; ');$('.update').attr('style', 'display: none; ');}</script>");
                TextBox1.Text = "";
            }
        }
    }
}