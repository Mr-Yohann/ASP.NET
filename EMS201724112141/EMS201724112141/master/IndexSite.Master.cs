using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.master
{
    public partial class IndexSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                //检测是否为管理员登录
                if (Session["super"] == null || Session["id"] == null)
                {
                    Response.Redirect("~/Default.aspx");//返回登录页面
                }
            }
            catch (NullReferenceException ex)
            {
                Response.Redirect("~/Default.aspx");//返回登录页面
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();//点击退出按钮清除全部Session
            Response.Redirect("~/Default.aspx");//返回登录页面
        }
    }
}