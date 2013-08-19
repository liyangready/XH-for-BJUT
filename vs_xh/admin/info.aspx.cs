using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class admin_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/admin/login.aspx");
            }          
        } 
        DetailsView1.DataBind();
    }
   

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("download.aspx");
            
    }


    protected void GoodDetailsView1_ItemCommand(Object sender, DetailsViewCommandEventArgs e)

    {
        string g=Request.QueryString["Gno"];
        if (e.CommandName == "pass1")
        {
            string good = "update groupinfo set Outstanding ='优秀项目 ' where Gnum='"+g+"'";
            Sqldata sqldataGood = new Sqldata();
            SqlCommand commandGood = new SqlCommand();
            commandGood.Connection = sqldataGood.getcon();
            commandGood.CommandText = good;
            sqldataGood.getcon().Open();
            SqlDataReader GoodOrNot = commandGood.ExecuteReader();
            if (GoodOrNot.Read())
            {
                HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('成功同意该组为优秀项目')</script>");
            }
        }
       
        
    }


    
}