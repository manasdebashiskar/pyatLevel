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
        try
        {
            string strName = Request.QueryString["userid"];
            
            useridval.Text = strName;
        }
        catch { }

        pyatLevelLogic plLogic = new pyatLevelLogic();
      //  plLogic.getDataByUserID((int)useridval.Text);
       
    }
}
