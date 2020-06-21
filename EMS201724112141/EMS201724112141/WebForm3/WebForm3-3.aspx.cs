using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EMS201724112141.WebForm3
{
    public partial class WebForm3_3 : System.Web.UI.Page
    {
        private myDBEntities myDBEntities = new myDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Table1()
        {
            //通过linq+ef技术查询
            var result = from dp in myDBEntities.department
                         join ep in myDBEntities.employee
                         on dp.ep_id equals ep.ep_id
                         select new { department = dp, employee = ep };

            //设置表头
            string write = "<table id='table1' border=1 cellspacing=0 cellpadding=2 style='font-size:30px'>";
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

        protected void delete_Click(object sender, EventArgs e)
        {
            int dp_id = Convert.ToInt32(TextBox1.Text);
            int result = 0;

            try
            {
                department delete = myDBEntities.department.Single(id => id.dp_id == dp_id);
                myDBEntities.department.Remove(delete);
                result = myDBEntities.SaveChanges();
            }
            catch(Exception ex)
            {
                Response.Write("<script>window.onload = function () {alert('删除失败，编号不存在');}</script>");
            }

            if(result > 0)
            {
                Response.Write("<script>window.onload = function () {alert('删除成功');}</script>");
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            int dp_id = Convert.ToInt32(TextBox1.Text);

            try
            {
                department update = myDBEntities.department.Single(id => id.dp_id == dp_id);

                Label2.Text = update.dp_id.ToString();
                TextBox2.Text = update.name;
                Response.Write("<script>window.onload = function () {$('#hid3').attr('style', 'display: none; ');$('.update').attr('style', 'display: block; ');}</script>");
                setDropDownList(update.dp_id, Convert.ToInt32(update.ep_id.ToString()));
            }
            catch (Exception ex)
            {
                Response.Write("<script>window.onload = function () {alert('编号不存在');}</script>");
            }
            
        }

        public void setDropDownList(int dp_id, int ep_id)
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
                string sql = "select * from employee where dp_id = '" + dp_id + "'";
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
            int dp_id = Convert.ToInt32(Label2.Text);
            department department = myDBEntities.department.Where(dp => dp.dp_id == dp_id).FirstOrDefault();
            if(department != null)
            {
                department.name = TextBox2.Text;
                department.ep_id = Convert.ToInt32(DropDownList1.SelectedValue);
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