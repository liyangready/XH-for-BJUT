using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null)//
        {
            Label1.Text = "您还没有登录!";
            LinkButton2.Text = "登录";
        }
        else
        {
            Label1.Text = Session["UserName"].ToString() + "hello!";
            LinkButton1.Text = "注销";
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {      
        Session.Abandon();
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Response.Redirect("houtaiDefault.aspx");
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}
