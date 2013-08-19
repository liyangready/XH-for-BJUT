using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_notice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sno"] == null)
        {
            Response.Redirect("~/admin/login.aspx");
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        Sqldata noteData = new Sqldata();
       
     //   bool i = noteData.ExceSQL(sqlinsert_notice);
      
        
        string t = title.Text.ToString();
        string c = connect.Text.ToString();
        string college = Session["Ofcollege"].ToString();
        string time = DateTime.Now.ToLocalTime().ToString();
        string sqlinsert_notice = "insert into notice values ('" + t + "','" + c + "','" + time + "','" + college + "')";
        SqlConnection conn = noteData.getcon();
        conn.Open();
        SqlCommand com = new SqlCommand(sqlinsert_notice,conn);
        
        int i = com.ExecuteNonQuery();
        if (i>0)
        {
            Response.Redirect("~/admin/noticeM.aspx");
        }
        else
        {
            Response.Write("添加失败");
        }

    }
}