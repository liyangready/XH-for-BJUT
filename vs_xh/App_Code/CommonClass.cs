using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///CommonClass 的摘要说明
/// </summary>
public class CommonClass
{
    public CommonClass()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    public string MessageBox(string TxtMessage, string Url)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "');location='" + Url + "';</script>";
        return str;
    }
    /// <summary>
    /// 说明：MessageBox用来在客户端弹出对话框。
    /// 参数：TxtMessage 对话框中显示的内容。
    /// </summary>
    public string MessageBox(string TxtMessage)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "')</script>";
        return str;
    }
    /// <summary>
    /// 说明：MessageBoxPag用来在客户端弹出对话框，关闭对话框返回原页。
    /// 参数：TxtMessage 对话框中显示的内容。
    /// </summary>
    public string MessageBoxPage(string TxtMessage)
    {
        string str;
        str = "<script language=javascript>alert('" + TxtMessage + "');location='javascript:history.go(-1)';</script>";
        return str;
    }
}