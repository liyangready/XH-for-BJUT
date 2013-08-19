using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class admin_noticeMagement : System.Web.UI.Page
{
    Commen commen1 = new Commen();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/admin/login.aspx");
            }
            GridViewBind();
        }

    }


    public void GridViewBind()
    {
        string myConn = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1"; 
        //定义SQL语句
        SqlConnection c = new SqlConnection();
        c.ConnectionString = myConn;
        string SqlStr = "select * from notice";
        //实例化SqlDataAdapter对象
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, myConn);
        //实例化数据集DataSet
        DataSet ds = new DataSet();
        da.Fill(ds, "notice");
        //绑定DataList控件
        GridView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
        GridView1.DataKeyNames = new string[] { "title" };
        GridView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)    
    {
        GridView1.EditIndex = e.NewEditIndex; //设置GridView控件的编辑项的索引为选择的当前索引
        GridViewBind(); //数据绑定
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string noticeID = GridView1.DataKeys[e.RowIndex].Value.ToString();  //取得编辑行的关键字段的值
        string noticeDateTime = DateTime.Now.ToLocalTime().ToString();
       
        string sqlEdit = "update notice set addDate='"+noticeDateTime+"' where title= '"+noticeID+"'";


        Sqldata noteM = new Sqldata();
        bool j = noteM.ExceSQL(sqlEdit);
        

      /*  SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Persist Security Info=True;Server=lenovo-pc;Integrated Security=SSPI;Initial Catalog=xhMS1";
        conn.Open();
        SqlCommand update = new SqlCommand();
        update.Connection = conn;
        update.CommandText = sqlEdit;
        int j=update.ExecuteNonQuery();
        update.Dispose();
        conn.Close();  */
        GridView1.EditIndex = -1;
        GridViewBind();
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string noticeID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string sqlDelete = "delete from notice where title='" + noticeID + "'";
        Sqldata noteDelete = new Sqldata();
        noteDelete.ExceSQL(sqlDelete);
        GridView1.EditIndex = -1;
        GridViewBind();
    }


    protected void GridView1_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void add_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/noteAdd.aspx");
    }

    public String GetVarStr(string str)
    {
        return commen1.VarStr(str,6);
    }
}