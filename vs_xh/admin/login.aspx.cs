using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;




public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random random = new Random();
        if (!IsPostBack)
            lblCheckCode.Text = random.Next(1000, 9999).ToString();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (lblCheckCode.Text.Trim() != txtCheckCode.Text.Trim())
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('验证码不正确');location.href='Login.aspx'</script>");
        }
        Sqldata houtai = new Sqldata();
        SqlConnection conn = houtai.getcon();
        conn.Open();
        string name1 = txtUser.Text.ToString();
        string password1 = txtPwd.Text.ToString();
        string c = DropDownList1.SelectedValue;
        string sqlselect = "select * from admin where Name='" + name1 + "' and Password='" + password1 + "'and OfClass='"+ c +"'";
        SqlCommand comm = new SqlCommand(sqlselect,conn);
        SqlDataReader dr = comm.ExecuteReader();
       
      // int j = houtai. ExceSQL(sqlselect);
        if (dr.Read())
        {
            Session.Add("UserName", txtUser.Text.Trim());
            Session["Sno"] = dr.GetString(4);
            Session["OfClass"] = dr.GetString(3);
            Session["Ofcollege"] = dr.GetString(1);
            Response.Redirect("~/admin/houtaiDefault.aspx");
        }
        else
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('用户名 密码或者类别不正确');location.href='Login.aspx'</script>");
        }
    }
}