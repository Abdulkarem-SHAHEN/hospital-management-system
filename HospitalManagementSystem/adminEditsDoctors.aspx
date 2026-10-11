<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminEditsDoctors.aspx.cs" Inherits="HospitalManagementSystem.adminEditsDoctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style type="text/css">
         .style6{
     -webkit-font-smoothing: antialiased;
    text-size-adjust: 100%;
    overflow: visible;
    text-transform: none;
    margin: 0;
    align-items: center;
    border: 1px solid #0000;
    border-radius: 290486px;
    box-shadow: none;
    box-sizing: border-box;
    cursor: pointer;
    font-family: UHC Sans,Helvetica,Arial,sans-serif;
    font-size: 14.22px;
    font-weight: 700;
    height: 40px;
    justify-content: center;
    line-height: 16px;
    padding: 0 24px;
    position: relative;
    user-select: none;
    vertical-align: top;
    appearance: button;
    caret-color: #0000;
    display: flex;
    width: 100%;
    background-color: rgb(21,53,76);
    border-color: rgb(2,34,80);
    color: #fff;
    margin-bottom: 0;
    margin-top: 0;
    }
     .style6:hover{
     -webkit-font-smoothing: antialiased;
    text-size-adjust: 100%;
    overflow: visible;
    text-transform: none;
    margin: 0;
    align-items: center;
    border: 1px solid #0000;
    border-radius: 290486px;
    box-shadow: none;
    box-sizing: border-box;
    cursor: pointer;
    font-family: UHC Sans,Helvetica,Arial,sans-serif;
    font-size: 14.22px;
    font-weight: 700;
    height: 40px;
    justify-content: center;
    line-height: 16px;
    padding: 0 24px;
    position: relative;
    user-select: none;
    vertical-align: top;
    appearance: button;
    caret-color: #0000;
    display: flex;
    width: 100%;
    background-color: rgb(28,70,102);
    border-color: rgb(2,34,80);
    color: #fff;
    margin-bottom: 0;
    margin-top: 0;
    }



     #cb{
            background-color:beige
        }
     </style>
    <%--RRRROOOWWWW------------------------------------------------------------------%>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body" id="cb">

                        <div class="form-group">
                            <Label>Doctor's ID</Label>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>




                        <div class="row">
                            <div class="col">
                                <label>Doctor's Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            <label>Specialized in: </label>
                            <div class="form-group">
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>


                            <label>Work Time: </label>
                            <div class="form-group">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                    <asp:ListItem>Full-Time</asp:ListItem>
                                    <asp:ListItem>Part-Time</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

<br>
                             <br>
                             <br>
                             
                             <div class="form-group">
                                <asp:Button ID="Button1"  class="style6" runat="server" OnClick="Button1_Click" Text="Save Changes" />
                            </div>
                            <br>
                             


                            <%--till here-------------------------------%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <br />

        <%--RRRROOOWWWW------------------------------------------------------------------%>









   
   




   
    <br />
    <br />
    <br />
    <br />
</asp:Content>
