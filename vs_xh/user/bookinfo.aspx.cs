using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class user_bookinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/main.aspx");
            }        
            BookBind();
           
        }
    }
    public void BookBind()
    {
            string dengluOrNot = Session["Sno"].ToString();
            if (dengluOrNot == "您还未登陆")
            {
                HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
            }
            else
            {
            Sqldata book=new Sqldata();
            SqlConnection bookConn=book.getcon();
            string bookSelect="SELECT GroupNum,BookClass,BookName, Auther, Press, Price, ISBN FROM Book WHERE GroupNum='" + Session["Group"] + "'";
            SqlCommand bookComm = book.GetCommandStr(bookSelect);
            SqlDataAdapter bookAdapter = new SqlDataAdapter(bookSelect, bookConn);
            DataSet bookSet = new DataSet();
            bookAdapter.Fill(bookSet, "book");
            GridView1.DataSource = bookSet;
            GridView1.DataKeyNames = new string[] { "ISBN" };
            GridView1.DataBind();
            }
     
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string dengluOrNot = Session["Sno"].ToString();
        if (dengluOrNot == "您还未登陆")
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("~/user/bookInsert.aspx");
        }
    }
}