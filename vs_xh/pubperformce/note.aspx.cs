using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    Sqldata sqldata1 = new Sqldata();
    Note note1 = new Note();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["search"] = null;
            notebind();
        }
    }
    public void notebind()
    {
        string strNote = "select * from notice";
        DataTable dsTable = sqldata1.GetDataSetStr(strNote, "noticeSet");
        this.GridView1.DataSource = dsTable.DefaultView;
        this.GridView1.DataKeyNames = new string[] { "title" };
        this.GridView1.DataBind();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ViewState["search"] = 1;
        noteSearchBind();
    }
    public void noteSearchBind()
    {
        DataTable dsTable = note1.search(this.TextBox1.Text);
        this.GridView1.DataSource = dsTable.DefaultView;
        this.GridView1.DataKeyNames = new string[] { "title" };
        this.GridView1.DataBind();
    }
    protected void ImaginButtonCollege_Click(object sender, ImageClickEventArgs e)
    {
        ViewState["search"] = 1;
        Sqldata dataCollege = new Sqldata();
        string note=ListBox1.Text;
        string sqlCollege="SELECT * FROM notice WHERE xueyuan='"+note+"'";
        SqlCommand commCollege = dataCollege.GetCommandStr(sqlCollege);
        dataCollege.ExecNQ(commCollege);
        DataTable tableCollege = dataCollege.GetDataSet(commCollege, "CollegeSet");
        this.GridView1.DataSource = tableCollege.DefaultView;
        this.GridView1.DataKeyNames = new string[] {"title" };
        this.GridView1.DataBind();     
    }
}