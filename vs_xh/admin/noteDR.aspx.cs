using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_noteRD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/admin/login.aspx");
            }
        }
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void ButtonEdit_Click(object sender, EventArgs e)
    {
        string t=Request.QueryString["title"];
        string sqlEdit="DELETE FROM notice WHERE title='"+t+"'";
        Sqldata dataEdit=new Sqldata();
       /* SqlConnection connEdit=dataEdit.getcon();       
        connEdit.Open();
        SqlCommand commEdit=new SqlCommand();
        commEdit.Connection=connEdit;
        commEdit.CommandText=sqlEdit;*/
        bool EditOrNot = dataEdit.ExceSQL(sqlEdit);
        if(EditOrNot)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('成功同意该组为优秀项目')</script>");
            Response.Redirect("~/admin/noticeM.aspx");
        }
        
    }
}