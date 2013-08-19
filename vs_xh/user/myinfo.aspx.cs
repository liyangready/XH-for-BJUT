using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_myselfinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("~/user/Sinfo.aspx");
        }
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("~/user/bookinfo.aspx");
        }
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        
        else
        {

            Response.Redirect("~/user/joinGroup.aspx");
        }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            string GorNot = Session["Group"].ToString();
            if (string.Compare(GorNot,"0")!=0)//自己是组长或者是已申请其他组，则不能申请添加进其他组
            {
           
                HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您已经有组！');location='javascript:history.go(-1)'</script>");
            }
            else
            {
                Response.Redirect("~/user/createNewGroup.aspx");
            }
        }
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("~/user/GroupM.aspx");
        }
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("~/user/upload.aspx");
        }
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Sno"] == null)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('您还未登陆！');location='javascript:history.go(-1)'</script>");
        }
        else
        {
            Response.Redirect("~/user/reportinfo.aspx");
        }
    }
}