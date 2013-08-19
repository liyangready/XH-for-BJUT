using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_download : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    Sqldata dbObj = new Sqldata();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sno"] == null)
        {
            Response.Redirect("~/admin/login.aspx");
        }

        foreach (GridViewRow grv in GridView1.Rows)
        {
            if (grv.Cells[3].Text == "0")
            {
                grv.Cells[3].Text = "未审核";

            }
            else
            {
                grv.Cells[3].Text = "已审核";
                grv.Cells[3].BackColor = System.Drawing.Color.Red;
            }
            if (grv.Cells[7].Text == "0")
            {
                grv.Cells[7].Text = "未审核";
            }
            else
            {
                grv.Cells[7].Text = "已审核";
                grv.Cells[7].BackColor = System.Drawing.Color.Red;
            }
            if (grv.Cells[11].Text == "0")
            {
                grv.Cells[11].Text = "未审核";
            }
            else
            {
                grv.Cells[11].Text = "已审核";
                grv.Cells[11].BackColor = System.Drawing.Color.Red;
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "download")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            string path = "select StartReportPath from groupinfo where Gnum='" + GridView1.Rows[i].Cells[0].Text + "'";

            SqlCommand myCmd = dbObj.GetCommandStr(path);
            SqlDataReader dr1 = myCmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr1.Read())
            {
                if (dr1.IsDBNull(0))
                {
                    Response.Write("<script lanuage=javascript>alert('下载为空！');location='javascript:history.go(-1)'</script>");
                }
                else
                {
                    string s1 = dr1.GetString(0);
                    path = s1.Substring(s1.LastIndexOf("\\") + 1);
                }
            }

            string path1 = Server.MapPath("../") + "user\\StartReport\\" + path;
            FileInfo fi = new FileInfo(path1);
            if (fi.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fi.Name));
                Response.AddHeader("Content-Length", fi.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.Filter.Close();
                Response.WriteFile(fi.FullName);

                Response.End();
            }
        }
        if (e.CommandName == "download1")
        {
            
            int i2 = Convert.ToInt32(e.CommandArgument);
            string path2 = "select MiddleReportPath from groupinfo where Gnum='" + GridView1.Rows[i2].Cells[0].Text + "'";

            SqlCommand myCmd2 = dbObj.GetCommandStr(path2);
            SqlDataReader dr2 = myCmd2.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr2.Read())
            {
                if (dr2.IsDBNull(0))
                {
                    Response.Write("<script lanuage=javascript>alert('下载为空！');location='javascript:history.go(-1)'</script></script>");
                }
                else
                {
                    string s2 = dr2.GetString(0);
                    path2 = s2.Substring(s2.LastIndexOf("\\") + 1);
                }
            }

            string newpath = Server.MapPath("../") + "user\\MiddleReport\\" + path2;
            FileInfo fi2 = new FileInfo(newpath);
            if (fi2.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fi2.Name));
                Response.AddHeader("Content-Length", fi2.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.Filter.Close();
                Response.WriteFile(fi2.FullName);

                Response.End();
            }
        }
        if (e.CommandName == "download2")
        {
            int i3 = Convert.ToInt32(e.CommandArgument);
            string path3 = "select EndReportPath from groupinfo where Gnum='" + GridView1.Rows[i3].Cells[0].Text + "'";
            SqlCommand myCmd3 = dbObj.GetCommandStr(path3);
            SqlDataReader dr3 = myCmd3.ExecuteReader(CommandBehavior.CloseConnection);
            while (dr3.Read())
            {
                if (dr3.IsDBNull(0))
                {
                    Response.Write("<script lanuage=javascript>alert('下载为空！');location='javascript:history.go(-1)'</script></script>");
                }
                else
                {
                    string s3 = dr3.GetString(0);
                    path3 = s3.Substring(s3.LastIndexOf("\\") + 1);
                }
            }

            string newpath1 = Server.MapPath("../") + "user\\EndReport\\" + path3;
            FileInfo fi3 = new FileInfo(newpath1);
            if (fi3.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fi3.Name));
                Response.AddHeader("Content-Length", fi3.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.Filter.Close();
                Response.WriteFile(fi3.FullName);

                Response.End();
            }


        }
        if (e.CommandName == "pass1")
        {
            int j1 = Convert.ToInt32(e.CommandArgument);
            string str1 = "select StartReportName from groupinfo where Gnum='" + GridView1.Rows[j1].Cells[0].Text + "'";
            SqlCommand myCmd4 = dbObj.GetCommandStr(str1);
            SqlDataReader dr4 = myCmd4.ExecuteReader(CommandBehavior.CloseConnection);
            while (dr4.Read())
            {
                if (dr4.IsDBNull(0))
                {
                    Response.Write("<script lanuage=javascript>alert('当前不存在该组的初期报告！');location='javascript:history.go(-1)'</script></script>");
                }
                else
                {
                    string change1 = "Update groupinfo set StartReportstate=1 where Gnum='" + GridView1.Rows[j1].Cells[0].Text + "'";
                    bool update = dbObj.ExceSQL(change1);
                    if (update == true)
                    {
                        Response.Redirect(Request.Url.ToString());
                    }
                    else { Response.Redirect("houtawishouye.aspx"); }
                }
            }
        }
        if (e.CommandName == "pass2")
        {
            int j2 = Convert.ToInt32(e.CommandArgument);
            string str2 = "select MiddleReportName from groupinfo where Gnum='" + GridView1.Rows[j2].Cells[0].Text + "'";
            SqlCommand myCmd5 = dbObj.GetCommandStr(str2);
            SqlDataReader dr5 = myCmd5.ExecuteReader(CommandBehavior.CloseConnection);
            while (dr5.Read())
            {
                if (dr5.IsDBNull(0))
                {
                    Response.Write("<script lanuage=javascript>alert('当前不存在该组的中期报告！');location='javascript:history.go(-1)'</script></script>");
                }
                else
                {
                    string change2 = "Update groupinfo set MiddleReportstate=1 where Gnum='" + GridView1.Rows[j2].Cells[0].Text + "'";
                    bool update = dbObj.ExceSQL(change2);
                    if (update == true)
                    {
                        Response.Redirect(Request.Url.ToString());
                    }
                }
            }
        }
        if (e.CommandName == "pass3")
        {
            int j3 = Convert.ToInt32(e.CommandArgument);
            string str3 = "select EndReportName from groupinfo where Gnum='" + GridView1.Rows[j3].Cells[0].Text + "'";
            SqlCommand myCmd6 = dbObj.GetCommandStr(str3);
            SqlDataReader dr6 = myCmd6.ExecuteReader(CommandBehavior.CloseConnection);
            while (dr6.Read())
            {
                if (dr6.IsDBNull(0))
                {
                    Response.Write("<script lanuage=javascript>alert('当前不存在该组的终期报告！');location='javascript:history.go(-1)'</script></script>");
                }
                else
                {
                    string change3 = "Update groupinfo set EndReportstate=1 where Gnum='" + GridView1.Rows[j3].Cells[0].Text + "'";
                    bool update = dbObj.ExceSQL(change3);
                    if (update == true)
                    {
                        Response.Redirect(Request.Url.ToString());
                    }
                }
            }
        }
        if (e.CommandName == "info")
        {
            int i = Convert.ToInt32(e.CommandArgument);

            Response.Redirect("info.aspx?Gno=" + GridView1.Rows[i].Cells[0].Text + "");
        }

    }
    
}