<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="imageDeletion.aspx.cs" Inherits="HospitalManagementSystem.imageDeletion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
        Are you sure you want to delete your photo??</p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="yes" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="No" />
    </p>
    <p>
    </p>
</asp:Content>
