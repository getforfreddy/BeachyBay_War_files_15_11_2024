<%@page import="bean.BookingDetails"%>
<%@page import="dao.BookingDAO"%>
<%@ page import="java.sql.*" %>

 <%
 HttpSession httpSession = request.getSession(false);
 if (httpSession == null || httpSession.getAttribute("user") == null) {
     response.sendRedirect("signIN.jsp");
     return;
 }
 %>
<%
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

    BookingDetails booking = new BookingDetails();
    booking.setFirstName(firstName);
    booking.setLastName(lastName);
    booking.setEmail(email);
    booking.setRoomType(roomType);
    booking.setGuests(Integer.parseInt(guests));
    booking.setArrivalDate(arrivalDate);
    booking.setArrivalTime(arrivalTime);
    booking.setTimePeriod(timePeriod);
    booking.setDepartureDate(departureDate);
    booking.setSpecialRequests(specialRequests);

    BookingDAO bookingDAO = new BookingDAO();
    boolean isSaved = bookingDAO.saveBookingDetails(booking);

    if (isSaved) {
%>
        <script>
            alert("Booking successful! Welcome to BeachyBay.");
            window.location.href = "home.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("There was an issue with your booking. Please try again.");
            window.location.href = "roomBook.jsp";
        </script>
<%
    }
%>
