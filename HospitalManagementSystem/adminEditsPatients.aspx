<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminEditsPatients.aspx.cs" Inherits="HospitalManagementSystem.adminEditsPatients" %>
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


      <%--RRRROOOWWWW------------------------------------------------------------------%>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body" id="cb">

                        <div class="form-group">
                             <Label>Patient's ID</Label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>



                        <label>First Name</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="FName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FName" ErrorMessage="First name is required" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                                </div>



                         <label>Last Name</label>
                         <div class="form-group">
                               <asp:TextBox CssClass="form-control" ID="LName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LName" ErrorMessage="Last name is required" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                        </div>


                        <label>Phone Number</label>
                         <div class="form-group">
                              <asp:TextBox CssClass="form-control" ID="PhoneNum" runat="server" TextMode="Phone"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNum"
                                        ValidationExpression="^09\d{8}$" ErrorMessage="Please enter a valid Syrian phone number starting with 09 and containing 8 digits." ForeColor="Red" ValidationGroup="OK" />
                             </div>



                          <label>Age</label>
                         <div class="form-group">
                              <asp:TextBox class="form-control" ID="Age" runat="server" TextMode="Number" CausesValidation="True"></asp:TextBox>
                                <span class="auto-style1">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Age" ErrorMessage="Age is reqired" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                                </span>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Age" CssClass="auto-style1" ErrorMessage="age must be between 1 and 110" MaximumValue="110" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="OK"></asp:RangeValidator>
                             </div>



                        <label>Gender</label>
                         <div class="form-group">
                                <asp:RadioButtonList Style="display: inline" ID="Gender" runat="server">
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Gender" CssClass="auto-style1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
                             </div>



                        <br />
                         <div class="form-group">
                             <asp:Button ID="Button1"   class="style6" runat="server" OnClick="Button1_Click" Text="save changes" ValidationGroup="OK" />
                             </div>



                        </div> <%--------------------------------------------------------------------------%>
                    </div>
                </div>
            </div>
        </div>
    




<%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Age" ErrorMessage="Last name is required" ForeColor="Red" EnableTheming="True" ValidationGroup="ok">*</asp:RequiredFieldValidator>--%>

      
                                   

                      

                                   
                        
    <br />
    <br />
    <br />
    <br />
</asp:Content>
