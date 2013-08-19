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

    }

    protected void Login1_OnAuthenticate1(object sender, AuthenticateEventArgs e)
    {
        Session["Group"] = null;
        Session["UserName"] = null;
        Session["Sno"] = "您还未登陆";
        Sqldata master = new Sqldata();

        //     bool denglu=master.ExceSQL(sqlselect);

        SqlConnection conn = master.getcon();
        //   conn.ConnectionString = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1";
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        conn.Open();

        string Name = ((System.Web.UI.WebControls.Login)LoginView1.FindControl("Login1")).UserName;
        string Pw = ((System.Web.UI.WebControls.Login)LoginView1.FindControl("Login1")).Password;
        string sqlselect = "select * from Users where Sno='" + Name + "' and Password='" + Pw + "'";

        comm.CommandText = sqlselect;
        SqlDataReader dr = comm.ExecuteReader();
        if (dr.Read())
        {
            e.Authenticated = true; //通过身份验证
            Session.Add("Sno", Name);

            string Gp = dr.GetString(4);
            Session.Add("Group", Gp);

            string GL = dr.GetString(5);
            Session.Add("GroupLeaderSno",GL);

            string realName = dr.GetString(0);
            Session.Add("UserName", realName); //sesstion存入姓名


            //    Session["UserName"] = Name;


        }
        else
        {
            e.Authenticated = false;
        }
        dr.Close();
        conn.Close();
    }

    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        
      //  Session.Clear();
        Session.Abandon();
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Session["Sno"] = "您还未登陆";
       
      //  Response.Redirect("~/main.aspx");
    }
    protected void LoginView1_ViewChanged(object sender, EventArgs e)
    {

    }
}
