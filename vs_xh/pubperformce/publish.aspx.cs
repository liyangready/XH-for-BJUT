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

public partial class pubperformce_publish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {  if(Session["Sno"]!=null)
            BindDatasOptionStyle(DropDownList1); //显示论坛类型信息
            else
            HttpContext.Current.Response.Write("<script>alert('注销成功！');location.href='../main.aspx';</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "")
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('请输入评论的标题和内容')</script>");
            return;
        }
        else
        {
            //判断输入的验证码是否正确
            string num = this.TextBox3.Text.Trim();
            if (Session["ValidNums"].ToString() == num.ToUpper())
            {
                // 连接数据库
                Sqldata sqldataPublish = new Sqldata();
                SqlConnection sqlcon = sqldataPublish.getcon();
               
                sqlcon.Open();
                // 向主表中插入数据信息,plid怎么生成的啊
                string StrInsert = "insert into plforums(pltitle,pldates,plSno,hf_nums) values(@pltitle,@pldates,@plSno,0)";
                SqlCommand cmd = new SqlCommand(StrInsert, sqlcon);
                // 添加参数并且设置参数值
            
                cmd.Parameters.Add("@pltitle", SqlDbType.VarChar);
                cmd.Parameters["@pltitle"].Value = this.TextBox1.Text.ToString();
                cmd.Parameters.Add("@pldates", SqlDbType.VarChar, 50);
                cmd.Parameters["@pldates"].Value = DateTime.Now.ToString();
                cmd.Parameters.Add("@plSno", SqlDbType.VarChar);
                cmd.Parameters["@plSno"].Value = Session["Sno"].ToString();//这块儿得重新看子孚的登录控制,直接用
                // 执行插入数据的操作
                cmd.ExecuteNonQuery();
                //获取主表中的编号
                string strselect1 = "select * from plforums where pltitle='" + TextBox1.Text.Trim() + "'";
                SqlCommand sqlcmd1 = new SqlCommand(strselect1, sqlcon);
                SqlDataReader dr1 = sqlcmd1.ExecuteReader();
                if (dr1.Read())//读取数据信息
                {
                    Session["forumid"] = dr1["plid"].ToString();//获取记录的id值当前的
                }
                dr1.Close();
                //向子表中插入数据
                string StrInserts = "insert into hf_forums(forumid,styleid,hftitle,contents,hfdates,hfSno,first_forum) values(@forumid,@styleid,@hftitle,@contents,@hfdates,@hfSno,1)";
                SqlCommand cmds = new SqlCommand(StrInserts, sqlcon);
                // 添加参数并且设置参数值
                cmds.Parameters.Add("@forumid", SqlDbType.VarChar);//和表中的类型不一样可以吗
                cmds.Parameters["@forumid"].Value = Session["forumid"].ToString();
                cmds.Parameters.Add("@styleid", SqlDbType.VarChar);
                cmds.Parameters["@styleid"].Value = GetStyleId(DropDownList1.Text).ToString();
                cmds.Parameters.Add("@hftitle", SqlDbType.VarChar);
                cmds.Parameters["@hftitle"].Value = this.TextBox1.Text.ToString();
                cmds.Parameters.Add("@contents", SqlDbType.VarChar);
                cmds.Parameters["@contents"].Value = this.TextBox2.Text.ToString();
                cmds.Parameters.Add("@hfdates", SqlDbType.VarChar, 50);
                cmds.Parameters["@hfdates"].Value = DateTime.Now.ToString();
                cmds.Parameters.Add("@hfSno", SqlDbType.VarChar);
                cmds.Parameters["@hfSno"].Value = Session["Sno"].ToString();
                // 执行插入数据的操作
                cmds.ExecuteNonQuery();
                sqlcon.Close();
                HttpContext.Current.Response.Write("<script>alert('恭喜！您已经成功发帖！');location.href='bbs.aspx';</script>");
               
                
            }
            else
            {
                this.Page.RegisterStartupScript("ss", "<script>alert('您输入的验证码不正确!')</script>");
            }
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("bbs.aspx");//取消按钮的操作
    }
    /// <summary>
    /// 获得论坛类型编号
    /// </summary>
    /// <param name="instr">类型名称</param>
    /// <returns>返回类型编号</returns>
    public int GetStyleId(string instr)
    {
        Sqldata sqldataPublish1 = new Sqldata();
        int Numsid = 0;
        if (instr == "")
        {
            Numsid = 1;
        }
        else
        {
            SqlConnection sqlcons = sqldataPublish1.getcon();
            
            sqlcons.Open();
            SqlDataAdapter adsas = new SqlDataAdapter("select forum_id,forum_style from forum_style where forum_style='" + instr + "'", sqlcons);
            DataSet addss = new DataSet();
            adsas.Fill(addss);
            if (addss.Tables[0].Rows.Count > 0)
            {
                Numsid = Convert.ToInt32(addss.Tables[0].Rows[0][0].ToString());
            }
            sqlcons.Close();
        }
        return Numsid;
    }
    /// <summary>
    /// 绑定论坛类型
    /// </summary>
    /// <param name="droplist">DropDownList控件名称</param>
    public void BindDatasOptionStyle(DropDownList droplist)
    {
        Sqldata sqldataPublish2 = new Sqldata();
        SqlConnection sqlcons = sqldataPublish2.getcon();
       
        sqlcons.Open();
        SqlDataAdapter adsas = new SqlDataAdapter("select forum_id,forum_style from forum_style order by forum_id", sqlcons);
        DataSet addss = new DataSet();
        adsas.Fill(addss);
        droplist.Items.Clear();
        if (addss.Tables[0].Rows.Count > 0)
        {
            droplist.Items.Add("");
            for (int i = 0; i < addss.Tables[0].Rows.Count; i++)
            {
                droplist.Items.Add(addss.Tables[0].Rows[i][1].ToString());
            }
        }
        sqlcons.Close();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
