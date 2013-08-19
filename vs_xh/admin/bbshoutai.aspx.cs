using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class admin_bbshoutai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/admin/login.aspx");
            }
            LoadDatas();
        }
    }
    /// <summary>
    /// 加载数据，在GridView控件中显示数据信息
    /// </summary>
    private void LoadDatas()
    {
        Sqldata bbs1 = new Sqldata();
        SqlConnection sqlcon = bbs1.getcon();
        
        string strsqls = "select distinct plid,pltitle,forum_style,Name,pldates,hf_nums from view_forum order by plid";
        SqlDataAdapter adsa = new SqlDataAdapter(strsqls, sqlcon);
        DataSet adds = new DataSet();
        adsa.Fill(adds);
        //if (adds.Tables[0].Rows.Count > 0)
        //{
        // GridView1.DataSourceID = null;
        GridView2.DataSource = adds;
        GridView2.DataKeyNames = new string[] { "plid" };
        GridView2.DataBind();
        //}

        if (Session["UserName"] == null)
        {
            Label1.Text = "您还没有登录!";
        }
        else
        {
            if (Session["UserName"] != null && Session["UserName"].ToString() != "您还没有登录")
                Label1.Text = "用户名称：" + Session["UserName"].ToString();//赋完值了就又为空了吗？
        }
    }
    protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)//按下查看按钮！
    {
        LoadDatas();
        //评论编号
        int ids = Convert.ToInt32(GridView2.Rows[e.NewSelectedIndex].Cells[0].Text);
        //回复数量
        Session["nums"] = GridView2.Rows[e.NewSelectedIndex].Cells[5].Text;
        //评论标题
        Session["strtitle"] = GridView2.Rows[e.NewSelectedIndex].Cells[1].Text;
        //评论类型编号
        Session["forumstyle"] = GridView2.Rows[e.NewSelectedIndex].Cells[2].Text;
        Response.Redirect("houtaiforumList.aspx?plid=" + ids + "");
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        LoadDatas();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)//"您还没有登录"
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('您还没有登录,请您登录后再发帖！')</script>");
        }
        else
        {
            Response.Redirect("houtaipublish.aspx");
        }
    }
    protected void GridView2_deleting(object sender, GridViewDeleteEventArgs e)//注意各种事件的参数类型  
    {
        if (Session["UserName"] == null)//"您还没有登录"
         {
            HttpContext.Current.Response.Write("<script>alert('只有登录后才可以删帖');location.href='bbshoutai.aspx';</script>");
         }
        else
        {
            Sqldata bbs2 = new Sqldata();
            SqlConnection sqlcon1 = bbs2.getcon();
            sqlcon1.Open();
            string deleteuser = GridView2.DataKeys[e.RowIndex].Value.ToString();//获取主键  
            string cmd = "delete from view_forum where plid='" + deleteuser + "'";//  
            SqlCommand cmdt = new SqlCommand(cmd, sqlcon1);
            try
            {
                cmdt.ExecuteNonQuery();
                HttpContext.Current.Response.Write("<script>alert('删除成功！')</script>");
            }
            catch
            {
                return;
            }
            LoadDatas();
            sqlcon1.Close();
        }

    }
}