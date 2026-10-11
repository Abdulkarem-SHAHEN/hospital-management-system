<%@ Page Title="patient homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="patientHomePage.aspx.cs" Inherits="HospitalManagementSystem.patientHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="icon" type="image/jpg" href="Content/images/JKRLOGO.JPG">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
        <!DOCTYPE html>
<html>
<head>
    <title>Container with Two Divs</title>
    <style>
        #container {
            display: flex;
            justify-content: space-between;
            /*background-color: green;*/
            background-color:rgb(242,245,250); 
            height: 50rem;
        }

        #left {
            width: 50%;
            /*background-color: blue;*/
             display: flex;
              flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #right {
            width: 50%;
            /*background-color: red;*/
             display: flex;
             flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        #videodiv{
            display:flex;
            justify-content:center;
            align-items:center;
        }
        #w1{

        }
        img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}


        #kk{
                --input-height: 56;
    --input-height--tablet-l: 48;
    --input-border-width: 2px;
    --select-height--tablet-l: var(--input-height--tablet-l);
    --select-padding-x: 20;
    --select-font-size: 17;
    --select-font-weight: 500;
    --select-border-radius: 5px;
    --select-chevron-size: 20px;
    --select-height: var(--input-height);
    --select-color: #1c1c1c;
    --select-bg: #fff;
    --select-border: #1c1c1c;
    --select-border-width: 1px;
    --select-color-focus: #1c1c1c;
    --select-bg-focus: #fff;
    --select-border-focus: #1c1c1c;
    --select-dropdown-padding-x: 20;
    --select-dropdown-padding-y: 10;
    --select-dropdown-bg: #fff;
    --select-dropdown-border: 1px solid hsla(0,0%,60%,.5);
    --select-dropdown-shadow: 0 2px 4px rgba(0,0,0,.2);
    --select-dropdown-color: #2f2f2f;
    --select-dropdown-color-hover: #000;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    font-weight: 400;
    -webkit-text-size-adjust: none;
    background: transparent;
    border: 0;
    box-sizing: border-box;
    padding: 0;
    vertical-align: baseline;
    margin-top: 0;
    max-width: 45rem;
    color: #000;
    font-family: Noto Sans,sans-serif;
    margin-bottom: 2rem;
    font-size: 1.063rem;
    line-height: 1.688rem;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
        }
        #ss{
                --input-height: 56;
    --input-height--tablet-l: 48;
    --input-border-width: 2px;
    --select-height--tablet-l: var(--input-height--tablet-l);
    --select-padding-x: 20;
    --select-font-size: 17;
    --select-font-weight: 500;
    --select-border-radius: 5px;
    --select-chevron-size: 20px;
    --select-height: var(--input-height);
    --select-color: #1c1c1c;
    --select-bg: #fff;
    --select-border: #1c1c1c;
    --select-border-width: 1px;
    --select-color-focus: #1c1c1c;
    --select-bg-focus: #fff;
    --select-border-focus: #1c1c1c;
    --select-dropdown-padding-x: 20;
    --select-dropdown-padding-y: 10;
    --select-dropdown-bg: #fff;
    --select-dropdown-border: 1px solid hsla(0,0%,60%,.5);
    --select-dropdown-shadow: 0 2px 4px rgba(0,0,0,.2);
    --select-dropdown-color: #2f2f2f;
    --select-dropdown-color-hover: #000;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    font-weight: 400;
    font-family: Noto Sans,sans-serif;
    list-style: none;
    --theme-link: #333;
    --theme-link-hover: #0056b3;
    --theme-button-primary-bg: var(--theme-color);
    --theme-button-primary-bg-hover: var(--theme-color);
    line-height: 1.75;
    -webkit-text-size-adjust: none;
    font-size: 100%;
    outline: 0 dotted #0068c1;
    display: block;
    outline-offset: .1em;
    position: static;
    color: var(--theme-link-hover);
    text-decoration: none;
        }

       #jj{
                --input-height: 56;
    --input-height--tablet-l: 48;
    --input-border-width: 2px;
    --select-height--tablet-l: var(--input-height--tablet-l);
    --select-padding-x: 20;
    --select-font-size: 17;
    --select-font-weight: 500;
    --select-border-radius: 5px;
    --select-chevron-size: 20px;
    --select-height: var(--input-height);
    --select-color: #1c1c1c;
    --select-bg: #fff;
    --select-border: #1c1c1c;
    --select-border-width: 1px;
    --select-color-focus: #1c1c1c;
    --select-bg-focus: #fff;
    --select-border-focus: #1c1c1c;
    --select-dropdown-padding-x: 20;
    --select-dropdown-padding-y: 10;
    --select-dropdown-bg: #fff;
    --select-dropdown-border: 1px solid hsla(0,0%,60%,.5);
    --select-dropdown-shadow: 0 2px 4px rgba(0,0,0,.2);
    --select-dropdown-color: #2f2f2f;
    --select-dropdown-color-hover: #000;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    color: #333;
    font-weight: 400;
    line-height: 1.5;
    font-family: Noto Sans,sans-serif;
    -webkit-text-size-adjust: none;
    background: transparent;
    border: 0;
    box-sizing: border-box;
    font-size: 100%;
    padding: 0;
    vertical-align: baseline;
    margin: 3rem -1rem;
    padding-left: 1rem;
    padding-right: 1rem;
    margin-left: -4rem;
    margin-right: -4rem;
        }


        
    </style>
</head>
<body>

   
    

    <div id="container">
        <div id="left">
            <div id="videodiv" style="margin-left:10rem" >
        <video autoplay muted src="Content/media/promo.mp4" width="800"></video>
    </div>
            <br />
            <br />
            <br />
            <p id="kk" style="text-align: center;font-size:1.2rem ;margin-left:10rem;">Explore the patient services that make your visit to JKR Hospital easy, comfortable and secure. From billing and insurance to dining and admissions planning, we’ve worked to anticipate your every need regardless of which JKR Hospital you are visiting.</p>

        </div>
        <div id="right">
             <div style="text-align: center;">
            <p id="w1">Welcome.</p>
        </div>
        <br />
            <asp:Image ID="Image1" runat="server"  Width="300px" Height="400px" style=" border-radius: 8px;border: 2px solid rgb(21,53,76);padding: 3px; "/>
        </div>
    </div>






  


</body>
</html>
        <br /><br />
        <asp:Button class="btn btn-primary rounded-pill px-3" ID="Button1" runat="server" OnClick="Button1_Click" Text="DeleteMyPhoto" />
&nbsp;
        <asp:Button class="btn btn-primary rounded-pill px-3" ID="Button2" runat="server" OnClick="Button2_Click" Text="change my photo" />
</asp:Content>
