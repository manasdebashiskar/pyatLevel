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
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Click_Click(object sender, EventArgs e)
    {
        pyatLevelLogic plLogic = new pyatLevelLogic();
        //string m_strRemotingServer = "localhost";
        //string m_intRemotingPort = "7777";
        //string strURL = String.Format("tcp://{0}:{1}/pyatLevelLogic", m_strRemotingServer, m_intRemotingPort);
        //pyatLevelLogic plLogic = new pyatLevelLogic();
        //plLogic = (pyatLevelLogic)Activator.GetObject(typeof(pyatLevelLogic), strURL);  
       try
        {
           
            int res = plLogic.GetDataByUserNamenPassword(usernamefield.Text, passwordfield.Text);

            //TODO : store session info.
            if (res == 0)
                loginResult.Text = "Invalid UserName or Password";
            //TODO: Logic to redirect only on valid session.


            if (res > 0)
            {
                Session.Add("userid", res);
                Response.Redirect("HomePage.aspx");
              
            }
        }
        catch
        {
        }
       

       
    }


    
   
}
