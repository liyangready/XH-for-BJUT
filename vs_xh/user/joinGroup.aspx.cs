using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
public partial class user_joinGroup : System.Web.UI.Page
{
    Sqldata join = new Sqldata();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Sno"]==null)
            {
                Response.Redirect("~/main.aspx");
            }
            ViewState["search"] = null;
            GroupJoinbind();
        }
    }
    public void GroupJoinbind()
    {
        string strGro = "SELECT Gnum, ProName, Leader, ProClass, ProType FROM groupinfo ORDER BY Gnum";
        DataTable dsTable = join.GetDataSetStr(strGro, "GroupSet");
        this.GridView1.DataSource = dsTable.DefaultView;
        this.GridView1.DataKeyNames = new string[] { "ProName" };  //???
        this.GridView1.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ViewState["search"] = 1;
        JoinSearchBind();
    }
    public void JoinSearchBind()
    {
        string s=ListBox1.Text.ToString();
        string choose;
        switch (s)
        {
            case "项目名称关键字": choose = "ProName";
                break;
            case "项目类别": choose = "ProType";
                break;
            case "项目类型": choose = "ProClass";
                break;
            default: choose = " ";
                break;
        }
        string sqlSelectGroup = "select  Gnum, ProName, Leader, ProClass, ProType from groupinfo where "+choose+" like '%" + this.TextBox1.Text + "%'";  //???
        SqlConnection Joinconn= join.getcon();
        Joinconn.Open();
        SqlCommand JoinCom = new SqlCommand(sqlSelectGroup, Joinconn);
        join.ExecNQ(JoinCom);
        DataTable dsTable = join.GetDataSet(JoinCom, "GroupSet");
        this.GridView1.DataSource = dsTable.DefaultView;
        this.GridView1.DataKeyNames = new string[] { "ProName" };
        this.GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string GorNot = Session["Group"].ToString();
        if (string.Compare(GorNot,"0")!=0)//自己是组长或者是已申请其他组，则不能申请添加进其他组
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('你已经有组！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            int i = Convert.ToInt32(e.CommandArgument);
            string G = GridView1.Rows[i].Cells[0].Text;
            string UpdateSelectID = "update Users set Gno='" + G + "',LeaderSno='0' where Sno='" + Session["Sno"].ToString() + "'";
            Session["Group"] = G;
            Sqldata joinIn = new Sqldata();
            bool ch = joinIn.ExceSQL(UpdateSelectID);
            
            if (ch)
            {             
                HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('成功加入该组！');location='javascript:history.go(-1)'</script>");
            }
            else
            {
                HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('未成功加入该组！')</script>");
            }
            // GroupJoinbind();
        }
    } 
}