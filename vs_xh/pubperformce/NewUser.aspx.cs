using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;



public partial class pubperformce_NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Sqldata zhuce = new Sqldata();
        string Name = UserName.Text.ToString();
        string StuNum = StudentNum.Text.ToString();
        string Pd = Password.Text.ToString();
        string El = Email.Text.ToString();
        string C = CollegeText.Text.ToString();
        string sqlInsert = "INSERT INTO Users(Name,Sno,Password,Email,College) VALUES ('" + Name + "','" + StuNum + "','" + Pd + "','" + El + "','"+C+"')";
        bool i = zhuce.ExceSQL(sqlInsert);

   /*     SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1";
        SqlCommand comm=new SqlCommand();
        comm.Connection = conn;
        conn.Open();

        string Name = UserName.Text.ToString();
        string Pd = Password.Text.ToString();
        string El = Email.Text.ToString();

        string sqlInsert = "insert into Users values ('"+Name+"','"+Pd+"','"+El+"')";
        comm.CommandText=sqlInsert;
        int i = 0;
        i=comm.ExecuteNonQuery(); */
        if (i)
        {
            Response.Write("添加成功");
            Response.Redirect("~/User/myinfo.aspx?name="+Name+"&password="+Password.Text);
        }
        else
        {
            Response.Write("添加失败");
            Response.Redirect("~/pubperformce/NewUser.aspx");
        }
            

    //    conn.Close();
    }
}
