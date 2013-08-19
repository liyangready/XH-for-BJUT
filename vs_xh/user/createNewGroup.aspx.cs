using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class user_createNewGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sno"] == null)
        {
            Response.Redirect("~/main.aspx");
        }
    }

    protected void ProN_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string G = Session["Group"].ToString();
        if (string.Compare(G,"0")==0)//若无组
        {   
            Sqldata Groupreg = new Sqldata();
            string PName = ProN.Text.ToString();
            string PC = PClass.Text.ToString();
            string PT = PType.Text.ToString();
            
            string GroLeader = Session["Sno"].ToString(); //session获取注册者姓名，为组长
            string Pteacher = ProT.Text.ToString();
            string PM = ProM.Text.ToString();
            string Pinfo = Proinfo.Text.ToString();

            string sqlSelectNum = "select count(*) from groupinfo";  //获取groupinfo表中已有组数
            Sqldata SqlDataNum = new Sqldata();
            SqlConnection conn1 = SqlDataNum.getcon();
            conn1.Open();
            SqlCommand Numcommand = new SqlCommand(sqlSelectNum, conn1);
            int num = Convert.ToInt32(Numcommand.ExecuteScalar());
            string numString = num.ToString();

            string sqlInsert = "INSERT INTO groupinfo(ProName,ProClass,Protype,Teacher,ProMoney,Proinfo,Gnum,Leader) VALUES ('" + PName + "','" + PC + "','" + PT + "','" + Pteacher + "','" + PM + "','" + Pinfo + "','" + numString + "','" + GroLeader + "')";
            bool i = Groupreg.ExceSQL(sqlInsert);
            if (i)
            {
                Sqldata GroupUserUpdate = new Sqldata();
                string InsertGroup = "update Users set Gno='" + num + "' ,LeaderSno='" + Session["Sno"] + "' where Sno='" + Session["Sno"] + "'"; //将User表Gno,LeaderSno字段插入创建者的学号
                if (conn1.State == System.Data.ConnectionState.Closed)
                {
                    conn1.Open();
                }

                //  SqlCommand UserGroupInsert = new SqlCommand(InsertGroup,conn1);
                bool j = GroupUserUpdate.ExceSQL(InsertGroup);
                if (j)
                {
                   // Response.Write("User-Gno更新成功");
                }
                Session["Group"] = num; //sesstion存入User的组号

                Response.Redirect("~/User/createNewGroup.aspx");
            }
            else
            {
                Response.Write("添加失败");
                Response.Redirect("~/User/createNewGroup.aspx");
            }
        }
        else
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您已经有组！');location='javascript:history.go(-1)'</script>");
        }
    }
}