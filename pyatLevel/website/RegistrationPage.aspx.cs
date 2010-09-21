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
using System.Net.Mail;

public partial class RegistrationPage : System.Web.UI.Page
{
    static string approverEmailID = "mkar@msn.com";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        pyatLevelLogicLayer.pyatLevelLogic blObj = new pyatLevelLogic();
        try
        {

            int success = blObj.addNewUser(CreateUserWizard.UserName, CreateUserWizard.Password, CreateUserWizard.Email, CreateUserWizard.Question, CreateUserWizard.Answer);
            if (success > 0)
            {
                //user information was inserted successfully.
                //I guess more to be done when user info is inserted fully.
                //then a mail is sent to Brian. He confirms if one needs to be logging in.
              //  string approverEmailID = "mkar@rdmcorp.com";
                sendMailToApprove(CreateUserWizard.UserName, CreateUserWizard.Email, approverEmailID);
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

    protected void sendMailToApprove(string UserName, string UserEmail, string approverEmailID)
    {

        MailMessage message = new MailMessage();

        message.From = new MailAddress("mail@localhost");



        message.To.Add(new MailAddress(approverEmailID));


        message.Subject = "This is my subject";

        message.Body = UserName + "requests to create an account";
        //  SmtpMail.SmtpServer = "localhost";
        try
        {

            SmtpClient client = new SmtpClient();
            client.Host = "localhost";
            client.Send(message);
            Response.Write("Your Email has been sent sucessfully - Thank You");
        }
        catch (Exception exc)
        {
            Response.Write("Send failure: " + exc.ToString());
        }


    }
}
