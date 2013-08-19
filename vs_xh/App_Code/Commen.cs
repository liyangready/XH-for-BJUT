using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Commen 的摘要说明
/// </summary>
public class Commen
{
	public Commen()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public string VarStr(string sString,int nLeng)
    {

     /*   int index = sString.IndexOf(".");
        if (index == -1 || index + nLeng >= sString.Length)
            return sString;
        else
            return sString.Substring(0, (index + nLeng + 1)); */

        if (sString.Length > nLeng)
        {
            return sString.Substring(0, nLeng);
        }
        else
            return sString;
    }
}