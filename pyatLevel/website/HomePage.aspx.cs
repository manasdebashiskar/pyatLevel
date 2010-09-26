using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using pyatLevelLogicLayer;

public partial class HomePage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        string strName = Session["userid"].ToString();

    }


    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        int parent_index = e.NewEditIndex;

     }

    protected void OnInsert(object sender, ObjectDataSourceMethodEventArgs e)
    {
   
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ObjectDataSource s = (ObjectDataSource)e.Row.FindControl("PhoneDS");
            s.SelectParameters["clientid"].DefaultValue = e.Row.Cells[0].Text;
            s.InsertParameters["clientid"].DefaultValue = e.Row.Cells[0].Text;
        }
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
       
    }
    protected void ShowPhoneNumber_Click(object sender, EventArgs e)
    {
       // Session["clientid"]= sender
        Button a = (Button)sender;
        Session["clientid"] = a.ToolTip;
    }
}