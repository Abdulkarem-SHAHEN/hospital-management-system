<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminDeletePatient.aspx.cs" Inherits="HospitalManagementSystem.adminDeletePatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
        .confirmation-container {
    max-width: 400px;
    margin: 0 auto;
    margin-top:20px;
    text-align: center;
    padding-bottom:50px;
       padding-top:50px;
       background-color:whitesmoke;
       border-radius: 20px;

}

.confirmation-label {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 20px;
}

.button-group {
    margin-top: 20px;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #000c49;
    color: #fff;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #888;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="confirmation-container">
        <p>
        </p>
        <asp:Label ID="Label1" runat="server" Text="Are you sure you want to delete patient?" CssClass="confirmation-label"></asp:Label>
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Yes" CssClass="btn btn-secondary rounded-pill px-3" />
        &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="No" CssClass="btn btn-secondary rounded-pill px-3" />
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>