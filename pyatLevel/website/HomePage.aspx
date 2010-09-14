<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Home Page"></asp:Label><br />
        &nbsp;
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userinfoid"
            DataSourceID="ObjectDataSourceUserInfo">
            <Columns>
                <asp:BoundField DataField="userinfo1" HeaderText="userinfo1" SortExpression="userinfo1" />
                <asp:BoundField DataField="userinfo2" HeaderText="userinfo2" SortExpression="userinfo2" />
                <asp:BoundField DataField="userinfo3" HeaderText="userinfo3" SortExpression="userinfo3" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSourceUserInfo" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetUserInfoByUserID" TypeName="pyatLevelLogicLayer.pyatLevelLogic">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="userID" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:Label ID="useridval" runat="server" Text="userid"></asp:Label></div>
    </form>
</body>
</html>
