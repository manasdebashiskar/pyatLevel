<%@ page language="C#" autoeventwireup="true" inherits="HomePage, App_Web_41ywithm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Home Page"></asp:Label><br />
        &nbsp; &nbsp;<br />
        &nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="userinfoid" DataSourceID="UserInfoDS" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CommandField ButtonType="Button" EditText="Update Profile" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="UserInfoDS" runat="server"
            SelectMethod="GetUserInfoByUserID" TypeName="pyatLevelLogicLayer.pyatLevelLogic" UpdateMethod="UpdateUserInfoByUserInfoID">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="userID" SessionField="userid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="userinfoid" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        &nbsp;&nbsp;<br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="phoneid" DataSourceID="phoneDS" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="phonenumber" HeaderText="phonenumber" SortExpression="phonenumber" />
                <asp:BoundField DataField="address" HeaderText="Email ID" SortExpression="address" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        &nbsp; &nbsp;&nbsp;<br />
        <asp:ObjectDataSource ID="phoneDS" runat="server" InsertMethod="InsertPhoneNumber" SelectMethod="GetPhoneNumber" TypeName="pyatLevelLogicLayer.pyatLevelLogicPhoneNumber">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        &nbsp;&nbsp;<br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="phoneid" DataSourceID="phoneDS">
            <EditItemTemplate>
                phoneid:
                <asp:Label ID="phoneidLabel1" runat="server" Text='<%# Eval("phoneid") %>'></asp:Label><br />
                phonenumber:
                <asp:TextBox ID="phonenumberTextBox" runat="server" Text='<%# Bind("phonenumber") %>'>
                </asp:TextBox><br />
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>'>
                </asp:TextBox><br />
                address:
                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>'>
                </asp:TextBox><br />
                fuserid:
                <asp:TextBox ID="fuseridTextBox" runat="server" Text='<%# Bind("fuserid") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                phonenumber:
                <asp:TextBox ID="phonenumberTextBox" runat="server" Text='<%# Bind("phonenumber") %>'></asp:TextBox><br />
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox><br />
                Email Address:
                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>'></asp:TextBox><br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="Add New Number"></asp:LinkButton>
            </ItemTemplate>
        </asp:FormView>
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;
        <br />
        </div>
    </form>
</body>
</html>
