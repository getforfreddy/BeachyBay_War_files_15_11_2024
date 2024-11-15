 <%
 HttpSession httpSession = request.getSession(false);
 if (httpSession == null || httpSession.getAttribute("user") == null) {
     response.sendRedirect("signIN.jsp");
     return;
 }
 %>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>BeachyBay Booking</title>
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    .top-centered { height: 50vh; }
  </style>
</head>
<body>

<%! 
  // Method to process the form data and check if form is submitted
  public boolean processFormData(javax.servlet.http.HttpServletRequest request) {
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String roomType = request.getParameter("roomType");
    String guests = request.getParameter("guests");
    String arrivalDate = request.getParameter("arrivalDate");
    String arrivalTime = request.getParameter("arrivalTime");
    String timePeriod = request.getParameter("timePeriod");
    String departureDate = request.getParameter("departureDate");
    String specialRequests = request.getParameter("specialRequests");

    // Set the retrieved values as request attributes for later use in JSP
    request.setAttribute("firstName", firstName);
    request.setAttribute("lastName", lastName);
    request.setAttribute("email", email);
    request.setAttribute("roomType", roomType);
    request.setAttribute("guests", guests);
    request.setAttribute("arrivalDate", arrivalDate);
    request.setAttribute("arrivalTime", arrivalTime);
    request.setAttribute("timePeriod", timePeriod);
    request.setAttribute("departureDate", departureDate);
    request.setAttribute("specialRequests", specialRequests);

    // Check if form is submitted by verifying if firstName is not empty
    return firstName != null && !firstName.isEmpty();
  }
%>

<%
  // Call the processFormData method and store the result
   boolean formSubmitted = processFormData(request);

  // Redirect to bookingAction.jsp if the form is submitted successfully
  if (formSubmitted) {
    response.sendRedirect("bookingAction.jsp");
  }
%>

<div class="d-flex justify-content-center align-items-center top-centered"> 
  <div class="card m-2" style="width: 18rem;">
    <!-- Correct image path -->
    <img src="image/beachy_bay_booking.webp" class="card-img-top" alt="Homestay Image" style="width: 100%; height: 180px; object-fit: cover;">
    <div class="card-body">
     <h5 class="card-title" align="center">BeachyBay</h5>
    </div>
  </div>
</div>	


<div class="text-center mt-4">
  <h1>BeachyBay Booking</h1>
  
<%--   <% if (formSubmitted) { %>
    <p class="text-success">Hello, <%= request.getAttribute("firstName") %>! Your booking request has been received.</p>
  <% } %> --%>
</div>

<!-- Form field below the heading -->
<div class="text-center mt-3 p-3">
  <form action="bookingAction.jsp" method="post">
    <div class="mb-3 row">
      <div class="col-4">
        <label for="firstName" class="form-label">First Name</label>
        <input type="text" class="form-control ps-2 pe-2" id="firstName" name="firstName" placeholder="Enter your first name" required>
      </div>
      <div class="col-4">
        <label for="lastName" class="form-label">Last Name</label>
        <input type="text" class="form-control ps-2 pe-2" id="lastName" name="lastName" placeholder="Enter your last name" required>
      </div>
      <div class="col-4">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control ps-2 pe-2" id="email" name="email" placeholder="Enter your email" required>
      </div>
    </div>

    <div class="mb-3 row">
      <div class="col-6">
        <label for="roomType" class="form-label">Room Type</label>
        <select class="form-select ps-2 pe-2" id="roomType" name="roomType">
          <option value="" disabled selected>Select room type</option>
          <option value="AC">AC</option>
          <option value="Non-AC">Non-AC</option>
        </select>
      </div>
      <div class="col-6">
        <label for="guests" class="form-label">Number of Guests</label>
        <input type="number" class="form-control ps-2 pe-2" id="guests" name="guests" placeholder="Eg: 5" min="1">
      </div>
    </div>

    <div class="mb-3 row">
      <div class="col-6">
        <label for="arrivalDate" class="form-label">Arrival Date</label>
        <input type="date" class="form-control ps-2 pe-2" id="arrivalDate" name="arrivalDate">
      </div>
      <div class="col-6 d-flex">
        <div class="me-2 w-auto">
          <label for="arrivalTime" class="form-label">Arrival Time</label>
          <input type="time" class="form-control ps-2 pe-2" id="arrivalTime" name="arrivalTime">
        </div>
     
      </div>
    </div>

    <div class="mb-3 row">
      <div class="col-6">
        <label for="departureDate" class="form-label">Departure Date</label>
        <input type="date" class="form-control" id="departureDate" name="departureDate">
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="specialRequests" class="form-label">Special Requests</label>
          <textarea class="form-control ps-2 pe-2" id="specialRequests" name="specialRequests" rows="3" placeholder="Enter any special requests"></textarea>
        </div>
      </div>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>	
  </form>
</div>

</body>
</html>
 
 