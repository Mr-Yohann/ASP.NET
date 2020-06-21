using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS201724112141.master
{
    public partial class Site4 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //通过Session检验是否登录状态
                if (Session["id"].ToString() == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch (NullReferenceException ex)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();//点击退出按钮清除全部Session
            Response.Redirect("~/Default.aspx");//返回登录页面
        }
    }
}