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
            SelectMethod="GetUserInfoByUserID" TypeName="pyatLevelLogicLayer.pyatLevelLogic" UpdateMethod="UpdateUserInfoByUserInfoID" InsertMethod="addUserInfo" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="userID" SessionField="userid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="userinfoid" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Qustion" Type="String" />
                <asp:Parameter Name="Answer" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="clientid"
            DataSourceID="ClientDS" GridLines="Both">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <EditItemTemplate>
                name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:TextBox
                    ID="nameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox><br />
                companyaddress: &nbsp;<asp:TextBox ID="companyaddressTextBox" runat="server" Text='<%# Bind("companyaddress") %>'></asp:TextBox><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:TextBox
                    ID="nameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox><br />
                companyaddress:
                <asp:TextBox ID="companyaddressTextBox" runat="server" Text='<%# Bind("companyaddress") %>'></asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="Add New Client"></asp:LinkButton>
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New"></asp:LinkButton>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:ObjectDataSource ID="ClientDS" runat="server" InsertMethod="InsertClient" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetClient" TypeName="pyatLevelLogicLayer.pyatLevelLogicClient">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                <asp:Parameter Name="companyAddress" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        &nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;
        <br />
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;<asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="clientid" DataSourceID="ClientDS" ForeColor="#333333"
            GridLines="None" OnRowEditing="OnRowEditing" OnRowDataBound="OnRowDataBound">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="clientid" HeaderText="clientid" InsertVisible="False"
                    ReadOnly="True" SortExpression="clientid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="companyaddress" HeaderText="companyaddress" SortExpression="companyaddress" />
                <asp:TemplateField HeaderText="Phone Number">
                    <EditItemTemplate>
                        <asp:FormView ID="FormView2" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="phoneid"
                            DataSourceID="PhoneDS" ForeColor="#333333">
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#E3EAEB" />
                            <EditItemTemplate>
                                phonenumber:
                                <asp:TextBox ID="phonenumberTextBox" runat="server" Text='<%# Bind("phonenumber") %>'></asp:TextBox><br />
                                name:
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox><br />
                                emailid:
                                <asp:TextBox ID="emailidTextBox" runat="server" Text='<%# Bind("emailid") %>'></asp:TextBox><br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                phonenumber:
                                <asp:TextBox ID="phonenumberTextBox" runat="server" Text='<%# Bind("phonenumber") %>'></asp:TextBox><br />
                                name:
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox><br />
                                emailid:
                                <asp:TextBox ID="emailidTextBox" runat="server" Text='<%# Bind("emailid") %>'></asp:TextBox><br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    OnClick="InsertButton_Click" Text="Insert"></asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                phonenumber:
                                <asp:Label ID="phonenumberLabel" runat="server" Text='<%# Bind("phonenumber") %>'></asp:Label><br />
                                name:
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>'></asp:Label><br />
                                emailid:
                                <asp:Label ID="emailidLabel" runat="server" Text='<%# Bind("emailid") %>'></asp:Label><br />
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                    Text="New"></asp:LinkButton>
                            </ItemTemplate>
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                <br />
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                    Text="New"></asp:LinkButton>
                            </EmptyDataTemplate>
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                        </asp:FormView>
                        <asp:ObjectDataSource ID="PhoneDS" runat="server" InsertMethod="InsertPhoneNumber"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetPhoneNumber" TypeName="pyatLevelLogicLayer.pyatLevelLogicPhoneNumber">
                            <SelectParameters>
                                <asp:Parameter Name="clientid" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="phonenumber" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="emailid" Type="String" />
                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                                <asp:SessionParameter Name="clientid" SessionField="clientid" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ObjectDataSource ID="PhoneDS" runat="server" InsertMethod="InsertPhoneNumber"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetPhoneNumber" TypeName="pyatLevelLogicLayer.pyatLevelLogicPhoneNumber">
                            <SelectParameters>
                                <asp:Parameter Name="clientid" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="phonenumber" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="emailid" Type="String" />
                                <asp:Parameter Name="userid" Type="Int32" />
                                <asp:Parameter Name="clientid" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ClientDS" runat="server" InsertMethod="InsertClient" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetClient" TypeName="pyatLevelLogicLayer.pyatLevelLogicClient">
                            <SelectParameters>
                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="userid" Type="Int32" />
                                <asp:Parameter Name="companyAddress" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                        <asp:Button ID="ShowPhoneNumber" runat="server" CommandName="Edit" OnClick="ShowPhoneNumber_Click"
                            Text="Show" ToolTip='<%# Eval("clientid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<br />
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
