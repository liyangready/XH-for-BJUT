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

public partial class pubperformce_forumInfos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDatas();
        }
    }
    /// <summary>
    /// 加载数据，在GridView控件中显示数据信息
    /// </summary>
    private void LoadDatas()
    {
        Sqldata dataForumInfos = new Sqldata();
        SqlConnection sqlcon = dataForumInfos.getcon();        
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

        if (Session["Sno"] == null || Session["Sno"].ToString() == "您还没有登录")
        {
            Label1.Text = "您还没有登录!";
        }
        else
        {
            if (Session["UserName"] != null && Session["UserName"].ToString() != "您还没有登录")
                Label1.Text = "用户名称：" + Session["UserName"].ToString();//赋完值了就又为空了吗？
        }
    }
    protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
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
        Response.Redirect("ForumList.aspx?plid=" + ids + "");
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        LoadDatas();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["Sno"] == null || Session["Sno"].ToString() == "您还没有登录")//"您还没有登录"
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('您还没有登录,请您登录后再发帖！')</script>");
        }
        else
        {
            Response.Redirect("publish.aspx");
        }
    }


    protected void GridView2_DataBinding(object sender, EventArgs e)
    {

    }
}