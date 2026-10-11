<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminAddDoctor.aspx.cs" Inherits="HospitalManagementSystem.adminAddDoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;

        }
        .form-container {
    max-width: 400px;
      padding:15px;
    margin: 0 auto;
    background-color:whitesmoke;
     border-radius: 10px;
}

.form-group {
    margin-bottom: 20px;
}

.textbox {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.checkbox {
    margin-top: 10px;
}

.submit-button {
    padding: 10px 20px;
    background-color: #000c49;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.auto-style1 {
    color: Red;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Spec"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Full-Time" CssClass="checkbox"></asp:CheckBox>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" CssClass="auto-style1" Display="Dynamic" ErrorMessage="The password should be at least 6 characters" ValidationExpression=".{6,}" ValidationGroup="OK"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label5" runat="server" CssClass="auto-style1" Text="This Email is already taken" Visible="False"></asp:Label>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" ValidationGroup="OK" CssClass="submit-button" />
        </div>
    </div>
</asp:Content>