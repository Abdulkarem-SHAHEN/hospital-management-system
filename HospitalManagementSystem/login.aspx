<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HospitalManagementSystem.login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <style type="text/css">

                .centered-label {
            text-align: center;
        }
    .auto-style2 {
        text-decoration: underline;
        color: #FF0000;
    }
            
    .style5{
            -webkit-font-smoothing: antialiased;
    text-size-adjust: 100%;
    text-rendering: optimizeLegibility;
    font-family: UHC Sans,Helvetica,Arial,sans-serif;
    font-size: 1.125rem;
    line-height: 1.5rem;
    text-align: center!important;
    font-style: inherit;
    font-weight: inherit;
    box-sizing: inherit;
    background-color: #0000;
    cursor: pointer;
    color: #115fa0;
    text-decoration: underline;
    }


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






    .style7{
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
    text-decoration:none;
    margin-bottom: 0;
    margin-top: 0;    
    }

    .style7:hover{
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
   background-color:  rgb(28,70,102);
    border-color: rgb(254,254,254);
    color: rgb(254,254,254);
    text-decoration:underline;
    margin-bottom: 0;
    margin-top: 0;
    }



    /*-----------------------------------------------------------------------------------------------------------------------------*/
    /* Style for the DropDownList container */
.dropdown-container {
    position: relative;
    display: inline-block;
}

/* Style for the DropDownList itself */
.custom-dropdown {
    width: 150px; /* Set the desired width */
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    background-color: #fff;
    text-align: center;
}

/* Style for the DropDownList options */
.dropdown-options {
    display: none;
    position: absolute;
    z-index: 1;
    width: 100%;
    border: 1px solid #ccc;
    border-top: none;
    border-radius: 0 0 4px 4px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

/* Style for individual options */
.dropdown-option {
    padding: 8px;
    cursor: pointer;
}

/* Hover effect on options */
.dropdown-option:hover {
    background-color: #f5f5f5;
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
.webchat{
        -webkit-font-smoothing: antialiased;
    text-size-adjust: 100%;
    text-rendering: optimizeLegibility;
    font-family: UHC Sans,Helvetica,Arial,sans-serif;
    color: #4d4d4d;
    font-size: 1.125rem;
    font-weight: 400;
    line-height: 1.5rem;
    box-sizing: inherit;
}




        .auto-style4 {
            position: center;
            display: inline-block;
            left: 0px;
            top: -46px;
        }
        .auto-style5 {
            color: #FF0000;
        }




    </style>
        <link rel="icon" type="image/jpg" href="Content/images/JKRLOGO.JPG">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center style="direction: ltr">
                            <br />
                           <img width="150px" src="Content/images/generaluser.png"/><br />
                            <br />
                        </center>
                     </div>
                  </div>
             




                    <div class="row">
                            <div class="col-md-6 mx-auto">
                                <center>
                           <h4>Member Login</h4>
                            <span>Use your JKRSafe ID<sup>®</sup> to access your ac<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    count<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    s using a single ID and password. 
                             <a data-show-modal="learn-more-modal" class="style5" role="button" tabindex="0" >Learn more</a>.</span><asp:Label ID="Label4" runat="server" CssClass="auto-style5"></asp:Label>
                                    </p></asp:Label>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>





                  <div class="row">
                     <div class="col">
                        <label>Member ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"  ></asp:TextBox>
                        </div>
                         <strong>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="this field is required" CssClass="auto-style2"></asp:RequiredFieldValidator>
                         </strong>
                         <br />
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"  TextMode="Password"></asp:TextBox>
                            <strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="This field is required" CssClass="auto-style2"></asp:RequiredFieldValidator>
                            </strong>
                        </div>


                       <div class="form-group">
                             <label>
                                
                                 <div class="auto-style4"> <p">Sign in as:&nbsp;&nbsp;&nbsp;
                             <label>
                                     <asp:DropDownList ID="DropDownList2" runat="server" CssClass="custom-dropdown">
                           <%-- Log-in as<asp:DropDownList ID="DropDownList1" runat="server">--%>
                                <asp:ListItem>Doctor</asp:ListItem>
                                <asp:ListItem>Patient</asp:ListItem>
                                <asp:ListItem>Employee</asp:ListItem>
                                <asp:ListItem>Admin</asp:ListItem>
                            </asp:DropDownList>
                                     
                           </label>
                                     </p>
                                     
                                     </div>
                                 
                           </label>
                           <asp:Button class="style6" ID="Button1" runat="server" Text="Sign in" OnClick="Button1_Click" />
                             <br />
                        </div>
                        <div class="form-group">
                           <a href="usersignup.aspx"><input class="style7" id="Button2" type="button" OnClick="Button2_Click" value="Register Now" /></a>
                            <br />
                             <label>
                            <br />
                            <br />
                                
                           </label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
                     </div>
                  </div>
               </div> 
                <a href="Home.aspx" class="style5">Back to HomePage.</a> 
                <br />
            </div>
             <br>
         </div>
      </div>
   </div>
     <br />
        <h2 class="needhelpstyle" <%--class="is-rds-h6 has-rds-mb-16"--%>>Need Help?</h2>
    <p id="footer-message"  class="callusstyle" <%--class  ="is-rds-body-3"--%>><span>We’re here for you. Call us toll-free at <a href="tel:1-877-844-4999">1-877-844-4999</a>, 24 hours a day, 7 days a week.</span></p>
    <br />
     <br />

            <div id="webChatContainer" class="webchat"><div id="webChatButton"><div class="caip-web-chat"><p class="buttonText"></p><button id="webChatButtonComp" class="maximize" aria-label="Maximise chat window"><span class="ms-Icon ms-Icon--MessageFill"></span></button></div></div><div id="webchat" tabindex="-1"></div></div>




    <%-- <script>
         document.addEventListener("DOMContentLoaded", function () {
             var dropdown = document.querySelector(".custom-dropdown");
             var options = document.querySelector(".dropdown-options");

             dropdown.addEventListener("click", function (event) {
                 event.stopPropagation();

                 if (options.style.display === "none" || options.style.display === "") {
                     options.style.display = "block";
                     setTimeout(function () {
                         options.style.opacity = "1";
                     }, 10);
                 } else {
                     options.style.opacity = "0";
                     setTimeout(function () {
                         options.style.display = "none";
                     }, 300);
                 }
             });

             document.addEventListener("click", function () {
                 options.style.opacity = "0";
                 setTimeout(function () {
                     options.style.display = "none";
                 }, 300);
             });

             options.addEventListener("click", function (event) {
                 event.stopPropagation();
             });
         });
    </script>--%>
    
</asp:Content>



    
