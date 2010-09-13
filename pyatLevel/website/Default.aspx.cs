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
       try
        {
           int res = plLogic.getuserid(usernamefield.Text, passwordfield.Text);


            //TODO : store session info.
            //TODO: Logic to redirect only on valid session.
            Session.Add("userid", res.ToString());
        }
        catch
        {
        }
        Response.Redirect("HomePage.aspx");
       
    }
}
