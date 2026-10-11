<%@ Page Title="JRK homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HospitalManagementSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="icon" type="image/jpg" href="Content/images/JKRLOGO.JPG">


    <link rel="stylesheet" href="Content/css/homepagecss.css" />
    <script src="Scripts/JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 


<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false" >
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/images/hit.jpg" Height="500" Width="100%" />
    </div>
    <div class="carousel-item">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/images/doctornote.jpg" Height="500" Width="100%" />
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>

      <div class="carousel-item">
      <asp:Image ID="Image4" runat="server" ImageUrl="~/Content/images/world.jpg" Height="500" Width="100%" />
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>

   
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
    </div>


   <%-- doctor,patients &assets number--%>
<section class="icons-container">
    <div class="icons">
        <i class="fas fa-user-md"></i>
        <h3><asp:Label ID="DoctorsCount" runat="server"></asp:Label>
        </h3>
        <p>Doctors</p>
    </div>
     <div class="icons">
        <i class="fas fa-users"></i>
        <h3><asp:Label ID="PatientsCount" runat="server"></asp:Label>
         </h3>
        <p>Patients</p>
    </div>
     <div class="icons">
        <i class="fas fa-procedures"></i>
        <h3>140</h3>
        <p>assets</p>
    </div>
</section>



   <%-- services--%>
    <section class="services" id="services">
        <h1 class="heading">Services</h1><br />

        <div>
        <i class="fas fa-notes-medical"></i>
        <h3>Emergency room</h3>
        </div>

        <div>
          <i class="fas fa-ambulance"></i>
        <h3>24/7 Ambulance</h3>
        </div>

        <div>
          <i class="fas fa-user-md"></i>
        <h3>Expert Doctors</h3>
        </div>

        <div>
          <i class="fas fa-pills"></i>
        <h3>Medicines</h3>
        </div>

        <div>
          <i class="fas fa-heartbeat"></i>
        <h3>Total care</h3>
        </div>

    </section>


   <%-- doctors--%>
   <section class="doctors" id="doctors">
       <h1 class="heading" >Our Doctors</h1><br />
       <div class="box-container">
           <div class="box">
               <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/images/D1.jpg" />
               <h3>Pediatrician</h3>
               <h4>Dr.william</h4>
               <p>Language:English,German </p>
               
           </div>
            <div class="box">
               <asp:Image ID="Image5" runat="server" ImageUrl="~/Content/images/D2.jpg" />
               <h3>Anesthesiologist</h3>
               <h4>Dr.Madison</h4>
               <p>Language: English, French </p>
               
           </div>
            <div class="box">
               <asp:Image ID="Image6" runat="server" ImageUrl="~/Content/images/D3.jpg" />
               <h3>Plastic Surgery</h3>
               <h4>Dr.Hana</h4>
               <p>Language:English, Turkish </p>
               
           </div>
            <div class="box">
               <asp:Image ID="Image7" runat="server" ImageUrl="~/Content/images/D4.jpg" />
               <h3>Radiology</h3>
               <h4>Dr.Aya</h4>
               <p>Language: English, Russian </p>
               
           </div>
            <div class="box">
               <asp:Image ID="Image8" runat="server" ImageUrl="~/Content/images/D5.jpg" />
               <h3>Gastroenterology</h3>
               <h4>Dr.Nathan</h4>
               <p>Language: English, Italian </p>
               
           </div>
            <div class="box">
               <asp:Image ID="Image9" runat="server" ImageUrl="~/Content/images/D6.jpg" />
               <h3>Dermatology</h3>
               <h4>Dr.Isabella</h4>
               <p>Language:Arabic, English </p>
               
           </div>




       </div>
   </section>
     


    <%--reviews--%>
   

    <section class="reviews" id="reviews">
        <h1 class="heading">Client's reviews</h1>
        <div class="swiper reviews-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide slide" style="width:20%">
                    <p class="text">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                         <i class="fas fa-star"></i>
                        <br>
                     It is a nice hospital with Highly professional staff, Doctors and Nurses. Their doctors listen their patients.</p>
                    <div class="user">
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Content/images/P2.jpg" />
                        <div class="info">
                            <h3>kreem</h3>
                        </div>
                    </div>
                </div>

                   <div class="swiper-slide slide" style="width:20%">
                    <p class="text">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <br>
                     The discharge process at Moolchand is efficient. The staff ensures that patients leave with all necessary information.  </p>
                    <div class="user">
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Content/images/P5.jpg" />
                        <div class="info">
                            <h3>Dana</h3>
                        </div>
                    </div>
                </div>
                   <div class="swiper-slide slide" style="width:20%">
                    <p class="text">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <br>
                       Very Good hospital nearby my house.Very caring doctors and staffs, had recently visited the private consultation opd.  </p>
                    <div class="user">
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Content/images/P4.jpg" />
                        <div class="info">
                            <h3>Sima</h3>
                        </div>
                    </div>
                </div>
                   <div class="swiper-slide slide" style="width:20%;  " >
                    <p class="text">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <br>
                      Excellent service all over is fine, is very nice so we are visiting ur hospital from one generation to another generation also.</p>
                    <div class="user">
                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Content/images/P6.jpg" />
                        <div class="info">
                            <h3>Ali</h3>
                        </div>
                    </div>
                </div>


                   <div class="swiper-slide slide" style="width:20%;  " >
                    <p class="text">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <br>
                   Good hospital nice treatment we are satisfied with the service admited with a fracture in hand after surgery everything was ok </p>
                       <div class="user">
                        <asp:Image ID="Image14" runat="server" ImageUrl="~/Content/images/P7.jpg" />
                        <div class="info">
                            <h3>Jalal</h3>
                        </div>
                    </div>
                </div>
                <!-- Add more swiper slides here -->

            </div>
        </div>
    </section>

         <link rel="stylesheet" href="Content/css/swiper-bundle.min.css">
    <script src="Scripts/swiper-bundle.min.js"></script>
  <%--   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>--%>
    <script src="Scripts/JavaScript.js"></script>
    

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;<br />
    <br />
</asp:Content>

