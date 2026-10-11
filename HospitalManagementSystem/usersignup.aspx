<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="HospitalManagementSystem.usersignup" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }


        .centered-label {
            text-align: center;
        }

        .style5 {
            -webkit-font-smoothing: antialiased;
            text-size-adjust: 100%;
            text-rendering: optimizeLegibility;
            font-family: UHC Sans,Helvetica,Arial,sans-serif;
            font-size: 1.125rem;
            line-height: 1.5rem;
            text-align: center !important;
            font-style: inherit;
            font-weight: inherit;
            box-sizing: inherit;
            background-color:white;
            cursor: pointer;
            color: #115fa0;
            text-decoration: underline;
        }


        .style6 {
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

            .style6:hover {
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






        .style7 {
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
            background-color: rgb(254,254,254);
            border-color: rgb(21,53,76);
            color: rgb(21,53,76);
            text-decoration: none;
            margin-bottom: 0;
            margin-top: 0;
        }

            .style7:hover {
                -webkit-font-smoothing: antialiased;
                text-size-adjust: 100%;
                overflow: visible;
                text-transform: none;
                margin: 0;
                align-items: center;
                border: 1px solid #0000;
                border-radius: 290486px;
                box-shadow: inset;
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
                border-color: rgb(254,254,254);
                color: rgb(254,254,254);
                text-decoration: underline;
                margin-bottom: 0;
                margin-top: 0;
            }
            .needhelpstyle{
    -webkit-font-smoothing: antialiased;
    text-size-adjust: 100%;
    text-rendering: optimizeLegibility;
    color: #2d2d39;
    text-align: center;
    box-sizing: inherit;
    margin: 0;
    padding: 0;
    font-family: UHC Sans,Helvetica,Arial,sans-serif;
    font-size: 1.266rem;
    font-weight: 500;
    line-height: 1.5rem;
    margin-bottom: 16px!important;
    margin-top: 0;
}
.callusstyle{
        -webkit-font-smoothing: antialiased;
    text-size-adjust: 100%;
    text-rendering: optimizeLegibility;
    color: #2d2d39;
    text-align: center;
    font-family: UHC Sans,Helvetica,Arial,sans-serif;
    font-size: .889rem;
    line-height: 1.25rem;
    box-sizing: inherit;
    font-style: inherit;
    font-weight: inherit;
}

        .custom-radio-list {
            display: inline;
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .custom-radio-list label {
                display: inline-block;
                margin-right: 20px;
                cursor: pointer;
                position: relative;
                padding-left: 25px; /* space for the custom radio button */
            }

            .custom-radio-list input[type="radio"] {
                position: absolute;
                left: 0;
                opacity: 0; /* hide the default radio button */
                cursor: pointer;
            }

            /* Style the custom radio button */
            .custom-radio-list label::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                width: 20px;
                height: 20px;
                border: 2px solid #3498db;
                border-radius: 50%;
                background-color: #fff;
                transition: background-color 0.3s ease-in-out;
            }

            /* Animation for the custom radio button */
            .custom-radio-list input[type="radio"]:checked + label::before {
                background-color: #3498db;
            }
    .auto-style2 {
        color: #FF0000;
        text-decoration: underline;
    }
    </style>
    <link rel="icon" type="image/jpg" href="Content/images/JKRLOGO.JPG">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>

                                    <br />

                           <img width="150px" src="Content/images/generaluser.png"/><br /><br />
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <center>
                           <h4>Let's Get You Registered</h4>
                           <span>Create your <a href="#!">JKRHealthSafe ID<sup>®</sup></a> to help protect the security of your personal health information.</span>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <%--first row--%>
                        <div class="row">
                            <%--first name column--%>
                            <div class="col-md-6">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="FName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FName" ErrorMessage="First name is required" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <%--last name column--%>
                            <div class="col-md-6">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="LName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LName" ErrorMessage="Last name is required" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>




                        <%--second row--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email </label>
                                &nbsp;<div class="form-group">
                            <asp:Label ID="lbl" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="Email" runat="server" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Email" ErrorMessage="Email is required" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="The email format is incorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="OK" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="PhoneNum" runat="server" TextMode="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PhoneNum"
                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="OK" />
                                    <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNum"
                                        ValidationExpression="^09\d{8}$" ErrorMessage="Please enter a valid Syrian phone number starting with 09 and containing 8 digits." ForeColor="Red" ValidationGroup="OK" />
                                </div>
                            </div>
                        </div>

                         <div class="row">
                         <div class="col-md-6">
                            <label>Password</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="Password" runat="server" TextMode="Password" OnTextChanged="Password_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Password" CssClass="auto-style1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Password" CssClass="auto-style1" Display="Dynamic" ErrorMessage="the password should be at least 6 characters" ValidationExpression=".{6,}" ValidationGroup="OK"></asp:RegularExpressionValidator>

                            
                                

                            </div>
                        </div>



                        <div class="col-md-6">
                            <label>Confirm Password</label>
                             <div class="form-group">
                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" TextMode="Password" ></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="TextBox1" CssClass="auto-style1" ErrorMessage="Passwords not Matching"></asp:CompareValidator>
                            <br />
                                 </div>
                            </div>
                        </div>

                   <div class="row">
                     <div class="col-md-6">
                            <label>Age</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="Age" runat="server" TextMode="Number" CausesValidation="True"></asp:TextBox>
                                <span class="auto-style1">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Age" ErrorMessage="Age is reqired" ForeColor="Red" EnableTheming="True" ValidationGroup="OK">*</asp:RequiredFieldValidator>
                                </span>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Age" CssClass="auto-style1" ErrorMessage="age must be between 1 and 110" MaximumValue="110" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="OK"></asp:RangeValidator>
                             
                                </div>
                                </div>

                            <div class="col-md-6">
                                   <label>Upload a Pitcure!</label>
                                   <div class="form-group">
                                <asp:FileUpload ID="FileUpload1" runat="server" style="margin-top: 10px; padding: 5px;" />
                                <asp:RequiredFieldValidator  ID="RequiredFieldValidator10" runat="server" ControlToValidate="FileUpload1" CssClass="auto-style1" ErrorMessage="RequiredFieldValidator" ValidationGroup="OK"></asp:RequiredFieldValidator>
                                <br />
                                <strong><em>
                                <asp:Label ID="StatusLabel" runat="server" CssClass="auto-style2"></asp:Label>
                                </em></strong>
                                       </div></div>
                       </div>
                     <center>
                        <div class="col-md-2">
                            <label>Gender</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Age" ErrorMessage="Last name is required" ForeColor="Red" EnableTheming="True" ValidationGroup="ok">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-9">
                            <asp:RadioButtonList Style="display: inline" ID="Gender" runat="server">
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Gender" CssClass="auto-style1" ErrorMessage="*" ValidationGroup="OK"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                        </div>
                        </center>

                    </div>





                    <div class="row">
                       

                        




                            <div class="row">
                           

                        
                  


                    <div class="row">
                        <div class="col-8 mx-auto">
                            <center>
                               <div class="form-group">             
                            <asp:Button ID="Button2" class="style6" runat="server" Style="display: inline" Text="Submit" EnableTheming="True" ValidationGroup="OK" OnClick="Button1_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Style="display: inline" class="style7" Text="Reset" OnClick="Button2_Click" />
                            <br />
                            <br />
                                   </div>
                            </center>
                        </div>
                    </div>
                                
                            </div>
                        </div> <%--card div--%>

                    








                    <a href="Home.aspx" class="style5">Back to HomePage.</a>
                    <br>
                </div>
            </div>

             <br />
        <h2 class="needhelpstyle" <%--class="is-rds-h6 has-rds-mb-16"--%>>&nbsp;</h2>
            <h2 class="needhelpstyle" <%--class="is-rds-h6 has-rds-mb-16"--%>>Need Help?</h2>
    <p id="footer-message"  class="callusstyle" <%--class  ="is-rds-body-3"--%>><span>We’re here for you. Call us toll-free at <a href="tel:1-877-844-4999">1-877-844-4999</a>, 24 hours a day, 7 days a week.</span></p>
    <br />
     <br />

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var radioButtons = document.querySelectorAll(".custom-radio-list input[type='radio']");

                    radioButtons.forEach(function (radio) {
                        radio.addEventListener("change", function () {
                            // Remove the 'checked' class from all labels
                            document.querySelectorAll(".custom-radio-list label").forEach(function (label) {
                                label.classList.remove("checked");
                            });

                            // Add the 'checked' class to the selected label
                            this.nextElementSibling.classList.add("checked");
                        });
                    });
                });
            </script>
</asp:Content>
