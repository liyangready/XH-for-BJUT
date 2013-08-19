using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_reportinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sno"] == null)
        {
            Response.Redirect("~/main.aspx");
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
            if (grv.Cells[5].Text == "0")
            {
                grv.Cells[5].Text = "未审核";
            }
            else
            {
                grv.Cells[5].Text = "已审核";
                grv.Cells[5].BackColor = System.Drawing.Color.Red;
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
          
        }
    }
}