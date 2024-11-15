<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="bean.User" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Action</title>
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center">Login Status</h2>
        <hr>

        <%
          String email = request.getParameter("email");
          String password = request.getParameter("password");
          UserDAO userDAO = new UserDAO();
          User user = userDAO.getUserByEmail(email);

          if (user != null) {
              // Verify password using BCrypt
              if (BCrypt.checkpw(password, user.getPassword())) {
                  out.println("<div class='alert alert-success'>Password matched. You are logged in!</div>");
                  // Proceed with the login logic (session creation, redirection)
                  HttpSession httpsession = request.getSession(true);
                  httpsession.setAttribute("user", email);
                  response.sendRedirect("home.jsp"); // Redirect to home page
              } else {
                  out.println("<div class='alert alert-danger'>Incorrect password. Please try again.</div>");
              }
          } else {
              out.println("<div class='alert alert-danger'>No user found with this email. Please register.</div>");
          }
        %>
      </div>
    </div>
  </div>
</body>
</html>
