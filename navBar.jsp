

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    
<title>Insert title here</title>
</head>
<body>
<!-- Nav bar -->
        
    <!-- <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top"> -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">BeachBay</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
          <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
            <li class="nav-item">
              <a class="nav-link" href="#Our Rooms">Our Rooms</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="#Amenities">Amenities</a>
            </li>
          </ul>
          
          <!--  <button type="button" class="btn btn-outline-success" onclick="window.location.href='roomBook.jsp'">Order Now</button>
         <button type="button" class="btn btn-outline-success" onclick="window.location.href='logout.jsp'">Log out</button>
        -->
        <div class="d-flex justify-content-center mt-3">
  <button type="button" class="btn btn-outline-success me-2" onclick="window.location.href='roomBook.jsp'">Order Now</button>
  <button type="button" class="btn btn-outline-success" onclick="window.location.href='logout.jsp'">Log out</button>
</div>
        
         </div>
      </div>
    </nav>
</body>
</html>