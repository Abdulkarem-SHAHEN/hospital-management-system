<%@ Page Title="TopMgmt homepage" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminHomePage.aspx.cs" Inherits="HospitalManagementSystem.adminHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="icon" type="image/jpg" href="Content/images/JKRLOGO.JPG">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style=" font-size: 30px; color:#023DA6 ">Welcome Admin! This is the admin home page.<br />
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
       <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Button" />
       <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </div>
    <br/>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="view all patients" class="btn btn-primary rounded-pill px-3" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="view all doctors" class="btn btn-primary rounded-pill px-3"/>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="view all topMgmt" class="btn btn-primary rounded-pill px-3"/>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="view all assets" class="btn btn-primary rounded-pill px-3"/>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="view all accounts" class="btn btn-primary rounded-pill px-3"/>
    <br />
    <br />
    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Button" Visible="False" class="btn btn-secondary rounded-pill px-3" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Download PDF" Visible="False" class="btn btn-secondary rounded-pill px-3" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="search by" Visible="False"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Visible="False">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="search" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Label ID="Label4" runat="server" Text="from" Visible="False"></asp:Label>
    <asp:TextBox ID="FromText" runat="server" OnTextChanged="TextBox1_TextChanged" Visible="False"></asp:TextBox>
&nbsp;
    <asp:Label ID="Label5" runat="server" Text="to" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="ToText" runat="server" Visible="False"></asp:TextBox>
    <asp:Button ID="searchBtn" runat="server" OnClick="searchBtn_Click" Text="Button" Visible="False" />
&nbsp;<asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-primary table-striped" Width="95%" style="margin-left: auto; margin-right: auto; margin-bottom: auto;" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
    <Columns>
        <asp:HyperLinkField HeaderText="EDIT"  Text="edit" DataNavigateUrlFields="id" DataNavigateUrlFormatString="adminEdits.aspx?id={0}" >
        <ItemStyle ForeColor="Red" />
        </asp:HyperLinkField>
        <asp:ButtonField CommandName="Delete" HeaderText="DELETE" ShowHeader="True" Text="delete" />
    </Columns>
</asp:GridView>

<br />
<br />
<br />
<asp:GridView ID="GridView2" runat="server" hidden>
</asp:GridView>

</asp:Content>