<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminEditsAssets.aspx.cs" Inherits="HospitalManagementSystem.adminEditsAssets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        /*#cb{
            background-image:url("photos/IMG_2330.JPG");
            background-repeat:no-repeat;
            background-size:cover;
            background-position: center;

            
        }*/
        #cb{
            background-color:beige
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body" id="cb">



                        <br />
                        <div class="row">
                            <div class="col">

                                <div class="form-group">
                                    <label>Item's ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>

                                <label>Item's Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" CssClass="auto-style1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>


                                <label>Number of Items</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" CssClass="auto-style1" ErrorMessage="greater than 0" MaximumValue="100000000" MinimumValue="0"></asp:RangeValidator>
                                </div>
                                <br />


                                <label>Item's Description</label>
                                <div class="form-group">

                                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Height="130px" TextMode="MultiLine" Width="446px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" CssClass="auto-style1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                                <br />





                            </div>
                            <%------------------------------end of column--%>
                        </div>
                        <%---------------------------------end of row--%>
                       
                    </div>
                </div>
            </div>
        </div>
      

    </div>

        <%--<div style="background-color:green" width: 50%">

        </div>--%>

    <br />
    <br />
    <br />
    <br />
    


</asp:Content>
