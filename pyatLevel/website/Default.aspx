<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:TextBox ID="usernamefield" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="EmailIDField" runat="server"></asp:TextBox><br />
        Email ID<br />
        <br />
        <asp:TextBox ID="passwordfield" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="getuserid" TypeName="pyatLevelLogic">
            <SelectParameters>
                <asp:FormParameter FormField="userfield" Name="username" Type="String" />
                <asp:FormParameter FormField="passwordfield" Name="password" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
        <br />
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailIDField"
            ErrorMessage="Enter valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernamefield"
            ErrorMessage="User Name is a mandatory field"></asp:RequiredFieldValidator><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailIDField"
            ErrorMessage="Email ID is a mandatory field"></asp:RequiredFieldValidator><br />
        <asp:Label ID="loginResult" runat="server" ForeColor="Red" Height="12px" Width="384px"></asp:Label><br />
        <br />
        <asp:Button ID="Click" runat="server" OnClick="Click_Click" Text="Click" />&nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp;
        <asp:HyperLink ID="Register_hyperlink" runat="server" Height="16px" NavigateUrl="~/RegistrationPage.aspx"
            Width="101px">Register</asp:HyperLink>
        <br />
        <br />
        <br />
        <br />
  
     
    </form>
</body>
</html>
