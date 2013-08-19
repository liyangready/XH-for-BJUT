using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class user_upload : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    Sqldata dbObj = new Sqldata();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sno"] == null)
        {
            Response.Redirect("~/main.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
     
    }
    protected void upload_Click(object sender, EventArgs e)
    {

      /*  string GorNot = Session["GroupLeaderSno"].ToString();
        string oo = "0";
        if (string.Compare(GorNot, oo) == 0)//自己是组长或者是已申请其他组，则不能申请添加进其他组
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('你还不是该组成员，不能上传报告！');location='javascript:history.go(-1)'</script>");
        }   */

        if (this.TextBox1.Text == "")
        {
            Response.Write(ccObj.MessageBoxPage("请输入标题！"));
        }
        else
        {

                try
                {
                    if (FileUpload1.PostedFile.FileName == "")
                    {
                        Label1.Text = "要上传的文件不允许为空！";
                        return;
                    }
                    else
                    {
                        string filepath = FileUpload1.PostedFile.FileName;
                        string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                        if (DropDownList1.SelectedIndex == 0)
                        {
                            string sqlStr = "select * from dbo.groupinfo where StartReportName is not NULL AND Gnum='" + Session["Group"] + "'";
                            DataTable dsTable = dbObj.GetDataSetStr(sqlStr, "dbo.groupinfo");
                            if (dsTable.Rows.Count > 0)
                            {
                                Response.Write(ccObj.MessageBoxPage("该组已经上传过初期报告！"));
                            
                            }
                            string serverpath = Server.MapPath("StartReport\\") + filename;
                            FileUpload1.PostedFile.SaveAs(serverpath);
                            string str = FileUpload1.FileName;
                            string strAddSql = "Update  dbo.groupinfo set StartReportName='" + this.TextBox1.Text.Trim() + "',StartReportPath='" + "~\\StartReport\\" + str + "' where Gnum='" + Session["Group"] + "' ";
                            bool add = dbObj.ExceSQL(strAddSql);
                            if (add == true)
                            {
                                Label1.Text=("上传成功！！！");
                               

                            }
                        }
                        if (DropDownList1.SelectedIndex == 1)
                        {
                            string sqlStr = "select * from dbo.groupinfo where MiddleReportName is not NULL AND Gnum='" + Session["Group"] + "'";
                            DataTable dsTable = dbObj.GetDataSetStr(sqlStr, "dbo.groupinfo");
                            if (dsTable.Rows.Count > 0)
                            {
                                Response.Write(ccObj.MessageBoxPage("该组已经上传过中期报告！"));
                              
                            }
                            string serverpath = Server.MapPath("MiddleReport\\") + filename;
                            FileUpload1.PostedFile.SaveAs(serverpath);
                            string str = FileUpload1.FileName;
                            string strAddSql = "Update  dbo.groupinfo set MiddleReportName='" + this.TextBox1.Text.Trim() + "',MiddleReportPath='" + "~\\MiddleReport\\" + str + "' where Gnum='" + Session["Group"] + "' ";
                            bool add = dbObj.ExceSQL(strAddSql);
                            if (add == true)
                            {
                                Label1.Text = ("上传成功！！！");

                            }
                        }
                        if (DropDownList1.SelectedIndex == 2)
                        {
                            string sqlStr = "select * from dbo.groupinfo where EndReportName is not NULL AND Gnum='" + Session["Group"] + "'";
                            DataTable dsTable = dbObj.GetDataSetStr(sqlStr, "dbo.groupinfo");
                            if (dsTable.Rows.Count > 0)
                            {
                                Response.Write(ccObj.MessageBoxPage("该组已经上传过终期报告！"));
                            
                            }
                            string serverpath = Server.MapPath("EndReport\\") + filename;
                            FileUpload1.PostedFile.SaveAs(serverpath);
                            string str = FileUpload1.FileName;
                            string strAddSql = "Update  dbo.groupinfo set EndReportName='" + this.TextBox1.Text.Trim() + "',EndReportPath='" + "~\\EndReport\\" + str + "' where Gnum='" + Session["Group"] + "' ";
                            bool add = dbObj.ExceSQL(strAddSql);
                            if (add == true)
                            {
                                Label1.Text = ("上传成功！！！");

                            }
                        }
                                              
                    }
                }
                catch (Exception error)
                {
                    Label1.Text = "处理发生错误！原因：" + error.ToString();
                }
                

            
        }

    }
    protected void return_Click(object sender, EventArgs e)
    {
        Response.Redirect("myinfo.aspx");
    }
}