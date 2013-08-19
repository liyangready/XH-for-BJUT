using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
///sqlData 的摘要说明
/// </summary>
public class Sqldata
{
    private SqlConnection sqlcon;
    private SqlCommand sqlcom;
    private SqlDataReader re;
    public Sqldata()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
        sqlcon = new SqlConnection();
        sqlcon.ConnectionString = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1";
    }

    public SqlConnection getcon()
    {
        return sqlcon;
    }

    public bool ExceSQL(string strSqlCom)
    {
        SqlCommand sqlcom = new SqlCommand(strSqlCom, sqlcon);
        try
        {
            
            if (sqlcon.State == System.Data.ConnectionState.Closed)
            {
                sqlcon.Open();

            }
            sqlcom.ExecuteNonQuery();
            return true;

        }
        catch
        {
            return false;
        }
        finally
        {
            sqlcon.Close();
        }
    }

    public SqlDataReader ExecReader(string strSqlCom)
    {
        SqlCommand sqlcom = new SqlCommand(strSqlCom, sqlcon);
        try
        {
            if (sqlcon.State == System.Data.ConnectionState.Closed)
            {
                sqlcon.Open();              
            }
            return sqlcom.ExecuteReader();

        }
        catch
        {
            return null;
        }
        finally
        {
            sqlcon.Close();
        }
    }
    public void ExecNQ(SqlCommand myCmd)
    {
        try
        {
            if (myCmd.Connection.State == ConnectionState.Closed)
            {
                myCmd.Connection.Open(); //打开与数据库的连接
            }
            //使用SqlCommand对象的ExecuteNonQuery方法执行SQL语句，并返回受影响的行数
            myCmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            if (myCmd.Connection.State == ConnectionState.Open)
            {
                myCmd.Connection.Close(); //关闭与数据库的连接
            }
        }
    }
    public DataTable GetDataSet(SqlCommand myCom, string Tablename)
    {
        SqlDataAdapter adapt;
        DataSet ds = new DataSet();
        try
        {
            if (myCom.Connection.State != ConnectionState.Open)
            {
                myCom.Connection.Open();
            }
            adapt = new SqlDataAdapter(myCom);
            adapt.Fill(ds, Tablename);
            return ds.Tables[Tablename];
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex); //捕获异常
        }
        finally
        {
            if (myCom.Connection.State == ConnectionState.Open)
            {
                myCom.Connection.Close();
            }
        }
    }

    public DataTable GetDataSetStr(string sqlStr, string TableName)
    {
        SqlConnection myConn = new SqlConnection();
        string conn = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1";
        myConn.ConnectionString = conn;
        myConn.Open();

        DataSet ds = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter(sqlStr, myConn);
        adapt.Fill(ds, TableName);
        myConn.Close();
        return ds.Tables[TableName];
    }


    public SqlCommand GetCommandStr(string strSql)
    {
        SqlConnection sqlcon = new SqlConnection();
        sqlcon.ConnectionString = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1";
        sqlcon.Open();
        SqlCommand my= new SqlCommand(strSql, sqlcon);

        my.CommandType = CommandType.Text;
        return my;
    }
}