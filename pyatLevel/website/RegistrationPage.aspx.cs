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

public partial class RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        pyatLevelLogicLayer.pyatLevelLogic blObj = new pyatLevelLogic();
        try
        {
           
            int success = blObj.addNewUser(CreateUserWizard.UserName, CreateUserWizard.Password, CreateUserWizard.Email, CreateUserWizard.Question, CreateUserWizard.Answer);
            if (success)
            {
                //user information was inserted successfully.
                //I guess more to be done when user info is inserted fully.
            }
        }
        catch
        {
        }
       
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:49770/website/default.aspx");
    }
}
