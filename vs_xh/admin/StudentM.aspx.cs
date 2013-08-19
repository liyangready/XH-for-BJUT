using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_StudentM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Sno"] == null)
            {
                Response.Redirect("~/admin/login.aspx");
            }
            GridViewInfoBind();

        }
    }
    public void GridViewInfoBind()
    {
        string InSelect = "SELECT Gnum, ProName, ProClass, ProType, Teacher, Leader FROM groupinfo WHERE ProClass = '" + Session["OfClass"] + "' ORDER BY Gnum";
        Sqldata sqldataInfo = new Sqldata();
        DataTable Info = sqldataInfo.GetDataSetStr(InSelect, "InfoSet");
        GridView2.DataSource = Info;
        GridView2.DataKeyNames = new string[] { "Gnum" };
        GridView2.DataBind();
    }
}