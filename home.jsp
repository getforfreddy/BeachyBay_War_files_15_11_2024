 
<%--   <% 
    session.setAttribute("user", "user");
 String user = (String) session.getAttribute("user");
 
%>
<p>Welcome, <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Guest" %>!</p>
 --%>
 <%
 HttpSession httpSession = request.getSession(false);
 if (httpSession == null || httpSession.getAttribute("user") == null) {
     response.sendRedirect("signIn.jsp");
     return;
 }
 %>
 
 <!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>BeachBay Homestay</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-3 m-0 border-0 bd-example">



  <!-- Include Navigation Bar -->
  <%@ include file="navBar.jsp"%>
 <!-- Carousel Slider -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000" style="width: 800px; height: 500px; margin: 0 auto;">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="carosil/carosel_BeachyBay_1.jpeg" class="d-block w-100" alt="First Slide" style="width: 800px; height: 500px; object-fit: cover;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Welcome to BeachBay</h5>
        <p>Enjoy a serene and peaceful stay with beautiful ocean views.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="carosil/carosel_BeacyBay_2.jpeg" class="d-block w-100" alt="Second Slide" style="width: 800px; height: 500px; object-fit: cover;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Comfort and Luxury</h5>
        <p>Relax in our well-appointed rooms with modern amenities.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="carosil/carosel_BeachyBay_3.jpeg" class="d-block w-100" alt="Third Slide" style="width: 800px; height: 500px; object-fit: cover;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Unforgettable Experiences</h5>
        <p>Explore the beach, indulge in local cuisine, and unwind.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

  <!-- Hero Section -->
  <div class="bg-light p-5 text-center">
    <h1>Welcome to BeachBay Homestay</h1>
    <p class="lead">Experience the serenity and beauty of beachfront living</p>
    <a href="#rooms" class="btn btn-primary btn-lg">Explore Our Rooms</a>
  </div>
  
  

 <!-- Rooms Section -->
  <section id="rooms" class="py-5 bg-light">
    <div class="container">
      <h2 class="text-center">Our Rooms</h2>
      <div class="row">
        <div class="col-md-4">
          <div class="card">
            <img src="path/to/room1.jpg" class="card-img-top" alt="Room 1">
            <div class="card-body">
              <h5 class="card-title">Beachfront Suite</h5>
              <p class="card-text">A luxurious suite with stunning ocean views and a private balcony.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <img src="path/to/room2.jpg" class="card-img-top" alt="Room 2">
            <div class="card-body">
              <h5 class="card-title">Garden View Room</h5>
              <p class="card-text">Cozy room with a relaxing view of our lush gardens.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <img src="path/to/room3.jpg" class="card-img-top" alt="Room 3">
            <div class="card-body">
              <h5 class="card-title">Family Suite</h5>
              <p class="card-text">Spacious suite with multiple beds, perfect for families.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Amenities Section -->
  <section id="amenities" class="py-5">
    <div class="container text-center">
      <h2>Amenities</h2>
      <div class="row">
        <div class="col-md-4">
          <h5>Free Wi-Fi</h5>
          <p>High-speed internet available throughout the property.</p>
        </div>
        <div class="col-md-4">
          <h5>Complimentary Breakfast</h5>
          <p>Enjoy a delicious breakfast with a variety of options.</p>
        </div>
        <div class="col-md-4">
          <h5>Beach Access</h5>
          <p>Direct beach access with complimentary chairs and umbrellas.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Happy Customers Carousel -->
 <!-- <h2 class="text-center mt-5">Happy Customers</h2>
  <div id="customCarousel" class="carousel slide" data-bs-ride="carousel">
     <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="path/to/customer1.jpg" class="d-block w-100" alt="First Customer">
        <div class="carousel-caption d-none d-md-block">
          <div class="card text-center" style="background-color: rgba(255, 255, 255, 0.8);">
            <div class="card-body">
              <h5 class="card-title">Jane Doe</h5>
              <p class="card-text">"A wonderful stay with excellent service and beautiful views!"</p>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="path/to/customer2.jpg" class="d-block w-100" alt="Second Customer">
        <div class="carousel-caption d-none d-md-block">
          <div class="card text-center" style="background-color: rgba(255, 255, 255, 0.8);">
            <div class="card-body">
              <h5 class="card-title">John Smith</h5>
              <p class="card-text">"A peaceful retreat with all the comforts of home. Highly recommend!"</p>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="path/to/customer3.jpg" class="d-block w-100" alt="Third Customer">
        <div class="carousel-caption d-none d-md-block">
          <div class="card text-center" style="background-color: rgba(255, 255, 255, 0.8);">
            <div class="card-body">
              <h5 class="card-title">Emma Wilson</h5>
              <p class="card-text">"The best beachside experience I've ever had. Beautiful rooms and scenery!"</p>
            </div>
          </div>
        </div>
      </div>
    </div> -->
  <!--   <button class="carousel-control-prev" type="button" data-bs-target="#customCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#customCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button> -->
  </div>
  <!-- Include Footer -->
  <%@ include file="footer.jsp" %>

</body>
</html>
 
