using System;
using System.Collections;
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

public partial class admin_houtaiforumList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/admin/login.aspx");
            }
           
                Label7.Text = Session["strtitle"].ToString();          //显示发帖标题信息 在哪里初始化的？
                Label8.Text = Session["nums"].ToString();              //显示回复数量信息
                //显示发帖内容及回复信息
                Sqldata dataHoutaiForumList = new Sqldata();
                SqlConnection sqlcon = dataHoutaiForumList.getcon();
                
                sqlcon.Open();
                string strsqls = "select * from view_subforum where forumid=" + Convert.ToInt32(Request["plid"].ToString()) + " order by hfid";//id?
                SqlDataAdapter adsa = new SqlDataAdapter(strsqls, sqlcon);
                DataSet adds = new DataSet();
                adsa.Fill(adds);
                if (adds.Tables[0].Rows.Count > 0)
                {
                    DataList1.DataSource = adds;
                    DataList1.DataBind();
                }
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["Sno"] == "您还没有登录" || Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script>alert('您还没有登录,请您登录后再回帖');location.href='bbshoutai.aspx';</script>");
        }
        else
        {
            if (TextBox2.Text == "" || TextBox4.Text == "")
            {
                HttpContext.Current.Response.Write("<script>alert('请输入回复评论的标题和内容');</script>");

                return;
            }
            else
            {
                //判断输入的验证码是否正确
                string num = this.TextBox3.Text.Trim();
                if (Session["ValidNums"].ToString() == num.ToUpper())
                {
                    // 连接数据库
                    Sqldata list = new Sqldata();
                    SqlConnection sqlcons = list.getcon();
                   
                    sqlcons.Open();
                    //获得回复数量
                    string strselect1 = "select * from plforums where plid='" + Request["plid"].ToString() + "'";//?哪个id?
                    SqlCommand sqlcmd1 = new SqlCommand(strselect1, sqlcons);
                    SqlDataReader dr1 = sqlcmd1.ExecuteReader();
                    int hfnums = 0;
                    if (dr1.Read())
                    {
                        hfnums = Convert.ToInt32(dr1["hf_nums"].ToString()) + 1;
                    }
                    dr1.Close();
                    //更改主表中的回复数量
                    string Strupdate = "update plforums set hf_nums=" + hfnums + " where plid='" + Request["plid"].ToString() + "'";//id?
                    SqlCommand cmd = new SqlCommand(Strupdate, sqlcons);
                    cmd.ExecuteNonQuery();
                    //向子表中插入数据
                 
                    string StrInserts = "insert into hf_forums(forumid,styleid,hftitle,contents,hfdates,hfSno,first_forum) values(@forumid,@styleid,@hftitle,@contents,@hfdates,@hfSno,0)";
                    SqlCommand cmds = new SqlCommand(StrInserts, sqlcons);
                    // 添加参数并且设置参数值
                    cmds.Parameters.Add("@forumid", SqlDbType.VarChar);
                    cmds.Parameters["@forumid"].Value = Request["plid"].ToString();//哪个id？
                    cmds.Parameters.Add("@styleid", SqlDbType.VarChar);
                    cmds.Parameters["@styleid"].Value = GetStyleId(Session["forumstyle"].ToString()).ToString();//这些对象都在哪里初始化的？？
                    cmds.Parameters.Add("@hftitle", SqlDbType.VarChar);
                    cmds.Parameters["@hftitle"].Value = this.TextBox4.Text.ToString();
                    cmds.Parameters.Add("@contents", SqlDbType.VarChar);
                    cmds.Parameters["@contents"].Value = this.TextBox2.Text.ToString();
                    cmds.Parameters.Add("@hfdates", SqlDbType.VarChar, 50);
                    cmds.Parameters["@hfdates"].Value = DateTime.Now.ToString();
                    cmds.Parameters.Add("@hfSno", SqlDbType.VarChar);
                    cmds.Parameters["@hfSno"].Value = Session["Sno"].ToString();
                    // 执行插入数据的操作
                    cmds.ExecuteNonQuery();
                    sqlcons.Close();
                    HttpContext.Current.Response.Write("<script>alert('恭喜！您成功回帖!');location.href='bbshoutai.aspx';</script>");

                }
                else
                {
                    this.Page.RegisterStartupScript("ss", "<script>alert('您输入的验证码不正确!')</script>");
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("bbshoutai.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox4.Focus();
    }
    /// <summary>
    /// 获得论坛类型编号
    /// </summary>
    /// <param name="instr">类型名称</param>
    /// <returns>返回类型编号</returns>
    public int GetStyleId(string instr)
    {
        int Numsid = 0;
        if (instr == "")
        {
            Numsid = 1;
        }
        else
        {
            Sqldata dataHoutaiForumList2 = new Sqldata();
            SqlConnection sqlconss = dataHoutaiForumList2.getcon();
            
            sqlconss.Open();
            SqlDataAdapter adsas = new SqlDataAdapter("select forum_id,forum_style from forum_style where forum_style='" + instr + "'", sqlconss);
            DataSet addss = new DataSet();
            adsas.Fill(addss);
            if (addss.Tables[0].Rows.Count > 0)
            {
                Numsid = Convert.ToInt32(addss.Tables[0].Rows[0][0].ToString());
            }
            sqlconss.Close();
        }
        return Numsid;
    }
}