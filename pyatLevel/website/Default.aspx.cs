using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using pyatLevelLogicLayer;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Click_Click(object sender, EventArgs e)
    {
        pyatLevelLogic plLogic = new pyatLevelLogic();
        int res = plLogic.getuserid(usernamefield.Text, passwordfield.Text);
        Response.Redirect("HomePage.aspx");
       
    }
}
