<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminAddAsset.aspx.cs" Inherits="HospitalManagementSystem.adminAddAsset" %>
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
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Item Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Count"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" CssClass="auto-style1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" CssClass="auto-style1" ErrorMessage="Minimum zero" MaximumValue="1000000" MinimumValue="0" ValidationGroup="OK" Type="Integer"></asp:RangeValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" CssClass="auto-style1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ADD" ValidationGroup="OK" CssClass="submit-button" />
        </div>
    </div>
</asp:Content>
