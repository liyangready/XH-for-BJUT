using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
///Note 的摘要说明
/// </summary>
public class Note
{
    Sqldata oneNote = new Sqldata();
	public Note()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public DataTable search(string strKeyWord)
    {
        string sqlSelectNote = "select * from notice where connect like '%" + strKeyWord + "%'";  //???
        SqlCommand myCom=oneNote.GetCommandStr(sqlSelectNote);
        oneNote.ExecNQ(myCom);
        DataTable dsTable = oneNote.GetDataSet(myCom, "noticeSet");
        return dsTable;
    }

}