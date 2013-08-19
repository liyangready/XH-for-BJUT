using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class user_GroupM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/main.aspx");
            }
            GridViewInBind();
            GridViewJoinBind();
        }
    }
    public void GridViewInBind()
    {
        string InSelect = "SELECT  Name, College, Sno FROM Users WHERE Gno='" + Session["Group"] + "' AND LeaderSno='" + Session["Sno"] + "' ORDER BY Sno";
        Sqldata sqldataGroupM = new Sqldata();
        DataTable InGroup = sqldataGroupM.GetDataSetStr(InSelect, "GroupInSet");
        GridView1.DataSource = InGroup;
        GridView1.DataKeyNames = new string[] { "Sno" };
        GridView1.DataBind();
    }
    public void GridViewJoinBind()
    {
        if (Session["Group"].ToString() != "0")
        {
            string JoinSelect = "SELECT Name,College,Sno FROM Users WHERE Gno='" + Session["Group"] + "' AND LeaderSno='0' ORDER BY Sno";
            Sqldata sqldataGroupJoin = new Sqldata();
            DataTable JoinGroup = sqldataGroupJoin.GetDataSetStr(JoinSelect, "GroupJoinSet");
            GridView2.DataSource = JoinGroup;
            GridView2.DataKeyNames = new string[] { "Sno" };
            GridView2.DataBind();
        }
    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //只有组长才能同意加入该组 从groupinfo表中取出组长学号，进行比较
        int G = Convert.ToInt32(Session["Group"]);
        string GroupOutLSno = "SELECT * FROM groupinfo WHERE Gnum='"+G+"'";
        Sqldata dataOutLSno = new Sqldata();
        SqlConnection connOutLSno = dataOutLSno.getcon();
        connOutLSno.Open();
        SqlCommand commOutLSno = new SqlCommand(GroupOutLSno, connOutLSno);
        SqlDataReader readerOutLSno = commOutLSno.ExecuteReader();
        if (readerOutLSno.Read())
        {
            string LSno = readerOutLSno.GetString(13);

            if (LSno == Session["Sno"].ToString())
            {
                string InFive = "SELECT  Name, College, Sno FROM Users WHERE Gno='" + Session["Group"] + "' AND LeaderSno='" + Session["Sno"] + "' ORDER BY Sno";
                Sqldata sqldataGroupM = new Sqldata();
                DataTable InGroupFive = sqldataGroupM.GetDataSetStr(InFive, "GroupInFiveSet");
                int jishu = InGroupFive.Rows.Count;
                if (jishu < 5)
                {
                    int i = Convert.ToInt32(e.CommandArgument);
                    string S = GridView2.Rows[i].Cells[2].Text;   //将申请者学号取出
                    string UpdateLeader = "update Users set LeaderSno='" + Session["Sno"] + "' where Sno='" + S + "'";//将申请者LeaderSno字段置为组长学号
                    Sqldata joinIn = new Sqldata();
                    bool ch = joinIn.ExceSQL(UpdateLeader);
                    if (ch)
                    {
                        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('成功加入我组！');location='javascript:history.go(-1)'</script>");
                    }
                    else
                    {
                        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('未成功加入我组！')</script>");
                    }
                    GridViewInBind();
                    GridViewJoinBind();
                }
                else
                {
                    HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('该组人数已满');location='javascript:history.go(-1)'</script>");
                }
            }
        }
        else
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您不是组长，无权进行此操作');location='javascript:history.go(-1)'</script>");
        }
    }
}