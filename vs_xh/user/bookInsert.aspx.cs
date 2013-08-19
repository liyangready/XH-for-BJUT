using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_bookInsert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sno"] == null)
        {
            Response.Redirect("~/main.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Sqldata BookInsert = new Sqldata();
        string sBookClass = BClass.Text.ToString();
        string sBookName = BName.Text.ToString();
        string sBookAuther = BAuther.Text.ToString();
        string sBookPress = BPress.Text.ToString();
        string sBookPrice = BPrice.Text.ToString();
        string sBookISBN = BISBN.Text.ToString();
        string sBookGno = Session["Group"].ToString();
        string sqlBookInsert = "INSERT INTO Book(BookClass,BookName,Auther,Press,Price,ISBN,GroupNum) VALUES ('" + sBookClass + "','" + sBookName + "','" + sBookAuther + "','" + sBookPress + "','" + sBookPrice + "','" + sBookISBN + "','" + sBookGno + "')";
        bool cho = BookInsert.ExceSQL(sqlBookInsert);
        if (cho)
        {
            Response.Redirect("bookinfo.aspx");
        }

    }
}