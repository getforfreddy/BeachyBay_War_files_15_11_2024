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
  <title>Registration Action</title>
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center">Registration Status</h2>
        <hr>

        <%
          String email = request.getParameter("email");
          String password = request.getParameter("password");
          
          // Hash the password using BCrypt
          String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
          
          UserDAO userDAO = new UserDAO();
          User user = new User();
          user.setEmail(email);
          user.setPassword(hashedPassword);

          boolean registrationSuccess = false;
          boolean emailExists = false;

          try {
              // Check if email already exists
              emailExists = userDAO.doesEmailExist(user.getEmail());

              if (!emailExists) {
                  // If email doesn't exist, proceed to register the user
                  registrationSuccess = userDAO.registerUser(user);
              }
          } catch (Exception e) {
              e.printStackTrace();
          }

          if (emailExists) {
        %>
            <div class="alert alert-danger" role="alert">
              This email is already registered. Please use a different email.<br>
              <a href="registraion.jsp">Ok</a>
            </div>
        <%
          } else if (registrationSuccess) {
        %>
            <div class="alert alert-success" role="alert">
              Registration successful! You can now <a href="signIn.jsp">login</a>.
            </div>
        <%
        } else {
        %>
            <div class="alert alert-danger" role="alert">
              Registration failed. Please try again or contact support.
            </div>
        <%
          }
        %>
      </div>
    </div>
  </div>
</body>
</html>
